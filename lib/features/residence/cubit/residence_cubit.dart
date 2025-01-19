// ignore_for_file: avoid_print

import 'dart:ui' as ui;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/location/cubit/location_cubit.dart';
import 'package:travel_club/features/residence/data/models/rooms_model.dart';
import 'package:travel_club/features/residence/view/widgets/hotels_widgets/custom_check_box.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';

import '../data/models/facilities_model.dart';
import '../data/models/lodge_details_model.dart';
import '../data/models/lodges_model.dart';
import '../data/models/places_model.dart';
import '../data/repo/residence_repo_impl.dart';

part 'residence_state.dart';

class ResidenceCubit extends Cubit<ResidenceState> {
  ResidenceCubit(this.api) : super(ResidenceInitial());
  int changedRooms = 0;
  int counter = 1;
  void minusCounter() {
    if (counter > 1) {
      counter = counter - 1;
      emit(MinusLoaded());
    }
  }

 

  //change choice
  bool? choice = false;
  void changeChoice() {
    choice = !(choice ?? true);
    emit(ChangeChoice());
  }

  void plusCounter() {
    counter = counter + 1;
    emit(PlusLoaded());
  }

  List<RoomModel> selectedRooms = [];
  double sum = 0;
  void addOrRemoveRoom(RoomModel room) {
    if (selectedRooms.any((selectedRoom) => selectedRoom.id == room.id)) {
      selectedRooms.removeWhere((selectedRoom) => selectedRoom.id == room.id);
    } else {
      selectedRooms.add(room);
    }

    sum = 0; // Reset the sum to avoid accumulation
    for (var selectedRoom in selectedRooms) {
      sum += double.tryParse(selectedRoom.totalPrice.toString()) ?? 0;
    }

    emit(PlusLoaded());
  }

  ResidenceRepoImpl api;
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndex());
  }

  List<int> stars = [];

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

  // remove filter
  void removeFilter() {
    for (int i = 0; i <= starsFilters.length; i++) {
      starsFilters[i].isChecked = false;
    }
    emit(ChangeIndex());
  }

  LodgeModel? selectedLodge;
  Set<Marker> lodgesMarkers = const <Marker>{};
  Uint8List? markerIcon;
  Uint8List? markerIconSelected;
  setMarkers(List<LodgeModel> lodges) {
    lodgesMarkers = lodges
        .map(
          (e) => Marker(
            markerId: MarkerId(e.id!.toString()),
            // infoWindow: const InfoWindow(title: 'currentLocation'),
            onTap: () {
              selectedLodge = e;

              emit(SetMarkersState());
              setMarkers(lodges);
            },
            icon: (markerIcon != null && markerIconSelected != null)
                ? selectedLodge?.id == e.id
                    ? BitmapDescriptor.bytes(markerIconSelected!)
                    : BitmapDescriptor.bytes(markerIcon!)
                : BitmapDescriptor.defaultMarker,
            position: LatLng(
              e.latitude ?? 0.0,
              e.longitude ?? 0.0,
            ),
          ),
        )
        .toSet();
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
    final res = await api.getPlaces();
    res.fold((l) {
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
    final res = await api.getFacilities();
    res.fold((l) {
      emit(FacilitiesError());
    }, (r) {
      facilitiesModel = r;
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
  getLodges({required int placeId, required BuildContext context}) async {
    emit(LoadgesLoading());
    double? lat, long;
    if (selectedFilter?.text == "nearestDistance") {
      if (context.read<LocationCubit>().isLocationNull(context)) {
        return;
      }
      lat = context.read<LocationCubit>().currentLocation?.latitude;
      long = context.read<LocationCubit>().currentLocation?.longitude;
    }
    List<int> stars = [];
    for (int i = 0; i < starsFilters.length; i++) {
      if (starsFilters[i].isChecked) {
        stars.add(i + 1);
      }
    }
    //facilities
    List<int> selectedFacilities = [];
    if (facilitiesModel.data != null) {
      for (int i = 0; i < facilitiesModel.data!.length; i++) {
        if (facilitiesModel.data?[i].isChecked ?? false) {
          selectedFacilities.add(facilitiesModel.data?[i].id ?? 0);
        }
      }
    }

    final res = await api.getLodges(
        placeId: placeId,
        lat: lat,
        long: long,
        filter: getFilterValue(),
        stars: stars,
        facilities: selectedFacilities);
    res.fold((l) {
      emit(LoadgesError());
    }, (r) {
      if (r.data != null && r.data!.isNotEmpty) {
        selectedLodge = r.data!.first;
        setMarkers(r.data!);
      }
      lodgesModel = r;

      emit(LoadgesLoaded());
    });
  }

  GetLodgeDetailModel lodgesDetailsModel = GetLodgeDetailModel();
  getLodgesDetails(
      {required int lodgeId, required BuildContext context}) async {
    final res = await api.getDetailsLodges(lodgeId: lodgeId);
    emit(LodgesDetailsLoading());

    res.fold((l) {
      emit(LodgesDetailsError());
    }, (r) {
      lodgesDetailsModel = r;
      emit(LodgesDetailsLoaded());
    });
  }

  GetLodgesRooms lodgesRoomsModel = GetLodgesRooms();
  getRoomsLodges({required int lodgeId, required BuildContext context}) async {
    final res = await api.getRoomsLodges(
        lodgeId: lodgeId,
        fromDay: context.read<TransportationCubit>().fromDate,
        toDay: context.read<TransportationCubit>().toDate,
        guest: counter);
    emit(LodgesRoomLoading());
    res.fold((l) {
      emit(LodgesRoomError());
    }, (r) {
      print("okkkkk send the result");
      lodgesRoomsModel = r;
      emit(LodgesRoomLoaded());
    });
  }

  bool isChangeAnyRoom = false;
}
