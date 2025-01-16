import 'dart:ui' as ui;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/accommodation/data/models/getlodges_room.dart';
import 'package:travel_club/features/location/cubit/location_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';

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
  bool isChosenChange=false;

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
List<LodgyRoom> selectedRooms =[];
  double sum=0;
  void addOrRemoveRoom(LodgyRoom room) {
    // Toggle room in the selectedRooms list
    if (selectedRooms.any((selectedRoom) => selectedRoom.id == room.id)) {
      // Remove if the room with the same ID exists
      selectedRooms.removeWhere((selectedRoom) => selectedRoom.id == room.id);

    } else {
      // Add the room if it doesn't exist
      selectedRooms.add(room);
    }
// for(int i=0;i<=selectedRooms.length;i++){
// sum += int.parse(selectedRooms[i].totalPrice.toString()??"");
// }
    sum = 0; // Reset the sum to avoid accumulation
    for (var selectedRoom in selectedRooms) {
      sum += double.tryParse(selectedRoom.totalPrice.toString() ?? "0") ?? 0;
    }
    // Log the current count of selected rooms
    print("Selected rooms count: ${selectedRooms.length}");
    print(" rooms price: ${sum}");
    emit(PlusLoaded());
  }

  DetailsAccomendationRepoImpl? api;
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndex());
  }

  // final List<String> imageUrls = [
  //   'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
  //   'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
  //   'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
  // ];
  //filter results
  //starsFilters
  List<int> stars =[];

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
  // List<StarsFilter> Facilities = [
  //   StarsFilter(text: "جراج خاص", isChecked: false),
  //   StarsFilter(text: "جراج خاص", isChecked: false),
  //   StarsFilter(text: "جراج خاص", isChecked: false),
  //   StarsFilter(text: "جراج خاص", isChecked: false),
  //   StarsFilter(text: "جراج خاص", isChecked: false),
  // ];
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
  // void removeFilter() {
  //   // currentIndexCheckbox=-1;
  //   // currentIndexFacilities = -1;
  //   for (int i = 0; i <= starsFilters.length; i++) {
  //     starsFilters[i].isChecked = false;
  //     Facilities[i].isChecked = false;
  //   }
  //   emit(ChangeIndex());
  // }

  LodgeModel? selectedLodge ;
  Set<Marker> hotelsMarkers = const <Marker>{};
  Uint8List? markerIcon;
  Uint8List? markerIconSelected;
  setMarkers(List <LodgeModel> lodges ) {

    hotelsMarkers = lodges.map((e) =>
        Marker(
          markerId:  MarkerId(e.id!.toString()),
          // infoWindow: const InfoWindow(title: 'currentLocation'),
          onTap: () {
            selectedLodge = e;


            emit(SetMarkersState());
            setMarkers(lodges);
          },
          icon: (markerIcon != null && markerIconSelected != null )
              ? selectedLodge?.id == e.id
              ? BitmapDescriptor.bytes(markerIconSelected!)
              : BitmapDescriptor.bytes(markerIcon!)
              : BitmapDescriptor.defaultMarker,
          position: LatLng(
            e.latitude ?? 0.0,
            e.longitude ?? 0.0,
          ),
        ),
    ).toSet();
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
  LodgeModel defaultLodge = LodgeModel(
    id: 0,
    name: "",
    latitude: 0.0,
    longitude: 0.0,
    placeId: 0,
    media: "dd",
    rate: 0,
    users: 0,
    isFav: false,
  );
  //getLodges
  GetLodgesModel lodgesModel = GetLodgesModel();
  getLodges({ required int id, required BuildContext context}) async {
    emit(LoadgesLoading());
    double? lat, long;
    if (selectedFilter?.text == "nearestDistance") {
     if ( context.read<LocationCubit>().isLocationNull(context)) {
       return;
     }
      lat = context.read<LocationCubit>().currentLocation?.latitude;
      long = context.read<LocationCubit>().currentLocation?.longitude;
    }
    List<int> stars =[];
    for (int i = 0; i < starsFilters.length; i++) {
      if (starsFilters[i].isChecked) {
        stars.add(i+1);
      }
    }
    //facilities
    List<int> selectedFacilities =[];
    if (facilitiesModel.data != null) {
      for (int i = 0; i < facilitiesModel.data!.length; i++) {
        if (facilitiesModel.data?[i].isChecked??false) {
          selectedFacilities.add(facilitiesModel.data?[i].id??0);
        }
      }
    }


    final res = await api?.getLodges(
      placeId: id,
      lat:lat,
      long: long,
      filter:getFilterValue(),
      stars: stars, facilities: selectedFacilities
    );
    res?.fold((l) {
      emit(LoadgesError());
    }, (r) {
     
      setMarkers(r.data ?? []);
      if (r.data != null && r.data!.isNotEmpty) {
        selectedLodge = r.data!.first;
      }
 lodgesModel = r;


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
      emit(LodgesDetailsLoaded());
    });
  }
GetLodgesRooms lodgesRoomsModel = GetLodgesRooms();
  getRoomsLodges({int? id, required BuildContext context}) async {
    final res = await api?.getRoomsLodges(lodgeId: id, fromDay: context.read<TransportationCubit>().fromDate, toDay: context.read<TransportationCubit>().toDate, guest: counter);
    emit(LodgesRoomLoading());
    res?.fold((l) {
      emit(LodgesRoomError());
    }, (r) {
      print("okkkkk send the result");
      lodgesRoomsModel = r;
      emit(LodgesRoomLoaded());
    });
  }
  // stars
  //
  // addRemoveToListStars(int index,bool isAdd){
  //   isAdd?stars.add(index+1):stars.remove(index+1);
  //   print (stars);
  //   emit(ChangeSelcetedStars());
  // }


}
