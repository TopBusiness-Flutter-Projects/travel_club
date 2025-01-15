import 'dart:ui' as ui;
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/location/cubit/location_cubit.dart';

import '../data/models/facilities_model.dart';
import '../data/models/getlodge_details.dart';
import '../data/models/getlodges_model.dart';
import '../data/models/places_model.dart';
import '../data/repo/details_accomendation_repo_impl.dart';
import '../view/widgets/hotels_widgets/custom_check_box.dart';

part 'accomendation_state.dart';

class AccomendationCubit extends Cubit<AccomendationState> {
  AccomendationCubit(this.api) : super(DetailsAccomendationPngInitial()) {
    getmarker();
  }
  int? counter = 1;
  void minusCounter() {
    if (counter! > 1) {
      counter = counter! - 1;
      emit(MinusLoaded());
    }
  }

  //check privacy
  bool isChecked = false; // حالة ال checkbox
  void checkPrivacy() {
    isChecked = !isChecked;
    emit(ChangePrivacy());
  }

  //change choice
  bool? choice = false;
  void changeChoice() {
    choice = !(choice ?? true);
    emit(ChangeChoice());
  }

  void plusCounter() {
    counter = counter! + 1;
    emit(PlusLoaded());
  }

  //is added
  bool? isAdded = true;
  void addedOrRemove() {
    print("nono");
    // isAdded != (isAdded);
    isAdded = !(isAdded ?? true);

    print("is added" + isAdded.toString() ?? "");
    emit(IsAddedChange());
  }

  DetailsAccomendationRepoImpl? api;
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndex());
  }

  final List<String> imageUrls = [
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
  ];
  //filter results
  //starsFilters
  List<StarsFilter> starsFilters = [
    StarsFilter(text: AppTranslations.oneStar, isChecked: false),
    StarsFilter(text: AppTranslations.twoStars, isChecked: false),
    StarsFilter(text: "3 " + AppTranslations.stars, isChecked: false),
    StarsFilter(text: "4 " + AppTranslations.stars, isChecked: false),
    StarsFilter(text: "5 " + AppTranslations.stars, isChecked: false),
  ];


  StarsFilter? selectedFilter;
  setSelectedFilter(StarsFilter filter) {
    if (selectedFilter == filter) {
      selectedFilter = null;
    } else {
      selectedFilter = filter;
    }
    emit(SetSelectedFilter());
  }

  //facilitoes
  List<StarsFilter> Facilities = [
    StarsFilter(text: "جراج خاص", isChecked: false),
    StarsFilter(text: "جراج خاص", isChecked: false),
    StarsFilter(text: "جراج خاص", isChecked: false),
    StarsFilter(text: "جراج خاص", isChecked: false),
    StarsFilter(text: "جراج خاص", isChecked: false),
  ];
  //current index stars
  int? currentIndexCheckbox;
  //curent index facilitoes
  int? currentIndexFacilities;

  //change stars check
  void changeIndexCheckbox(int index) {
    currentIndexCheckbox = index;
    emit(ChangeIndex());
  }

  //change facilities check
  void changeIndexFacilities(int index) {
    currentIndexFacilities = index;
    emit(ChangeIndex());
  }

  //remove filter
  void removeFilter() {
    // currentIndexCheckbox=-1;
    // currentIndexFacilities = -1;
    for (int i = 0; i <= starsFilters.length!; i++) {
      starsFilters[i].isChecked = false;
      Facilities[i].isChecked = false;
    }
    emit(ChangeIndex());
  }

  bool isSelectedHotel = false;
  Set<Marker> hotelsMarkers = const <Marker>{};
  Uint8List? markerIcon;
  Uint8List? markerIconSelected;
  setMarkers() {
    hotelsMarkers = {
      Marker(
        markerId: const MarkerId('currentLocation'),
        // infoWindow: const InfoWindow(title: 'currentLocation'),
        onTap: () {
          isSelectedHotel = !isSelectedHotel;

          emit(SetMarkersState());
          setMarkers();
        },
        icon: (markerIcon != null && markerIconSelected != null)
            ? isSelectedHotel
                ? BitmapDescriptor.bytes(markerIconSelected!)
                : BitmapDescriptor.bytes(markerIcon!)
            : BitmapDescriptor.defaultMarker,
        position: LatLng(
          0.0,
          0.0,
        ),
      ),
    };
    emit(SetMarkersState());
  }

  getmarker() async {
    markerIcon = await getBytesFromAsset(ImageAssets.marker, 30);
    markerIconSelected = await getBytesFromAsset(ImageAssets.markerSelect, 40);
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  //get places
  PlacesModel placesModel = PlacesModel();
  getPlaces() async {
    emit(PlacesLoading());
    final res = await api?.getPlaces();
    res?.fold((l) {
      emit(PlacesError());
    }, (r) {
      placesModel = r;
      // getUserData();
      emit(PlacesLoaded());
    });
  }

  //get facilities
  FacilitiesModel facilitiesModel = FacilitiesModel();
  getFacilities() async {
    emit(FacilitiesLoading());
    final res = await api?.getFacilities();
    res?.fold((l) {
      emit(FacilitiesError());
    }, (r) {
      facilitiesModel = r;
      // getUserData();
      emit(FacilitiesLoaded());
    });
  }
  //list orders
  List<StarsFilter> ordersFilters = [
    StarsFilter(text: AppTranslations.mostRating, isChecked: false),
    StarsFilter(text: AppTranslations.mostPrice, isChecked: false),
    StarsFilter(text: AppTranslations.lowestRating, isChecked: false),
    StarsFilter(text: AppTranslations.nearest, isChecked: false),
    StarsFilter(text: AppTranslations.lowestPrice, isChecked: false),
  ];
String? getFilterValue() {
  String? filterValue;

  if (selectedFilter?.text == AppTranslations.mostRating) {
    filterValue = "highestRate";
  } else if (selectedFilter?.text == AppTranslations.mostPrice) {
    filterValue = "highestPrice";
  } else if (selectedFilter?.text == AppTranslations.lowestRating) {
    filterValue = "lowestRate";
  } else if (selectedFilter?.text == AppTranslations.nearest) {
    filterValue = "nearestDistance";
  } else if (selectedFilter?.text == AppTranslations.lowestPrice) {
    filterValue = "lowestPrice";
  }
  return filterValue;
}

  //getLodges
  GetLodgesModel lodgesModel = GetLodgesModel();
  getLodges({int? id, required BuildContext context}) async {
    emit(LoadgesLoading());
    double? lat, long;
    if (selectedFilter?.text == "nearestDistance") {
     if ( context.read<LocationCubit>().isLocationNull(context)) {
       return;
     }
      lat = context.read<LocationCubit>().currentLocation?.latitude;
      long = context.read<LocationCubit>().currentLocation?.longitude;
    }
    final res = await api?.getLodges(
      placeId: id,
      lat:lat,
      long: long,
      filter:getFilterValue(),
    );
    res?.fold((l) {
      emit(LoadgesError());
    }, (r) {
      lodgesModel = r;
      // getUserData();
      emit(LoadgesLoaded());
    });
  }
  GetLodgeDetail lodgesDetailsModel = GetLodgeDetail();
  getLodgesDetails({int? id, required BuildContext context}) async {
    final res = await api?.getDetailsLodges(lodgeId: id);
    emit(LodgesDetailsLoading());

    res?.fold((l) {
      emit(LodgesDetailsError());
    }, (r) {
      lodgesDetailsModel = r;
      // getUserData();
      emit(LodgesDetailsLoaded());
    });
  }
}
