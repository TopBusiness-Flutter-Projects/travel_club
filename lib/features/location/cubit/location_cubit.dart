// ignore_for_file: use_build_context_synchronously

import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart' as perm;
import 'package:travel_club/core/exports.dart';
import 'dart:ui' as ui;
import '../data/repo/location_repo_impl.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(this.api) : super(LocationInitial()) {
    getmarker();
  }
  LocationRepoImpl api;

  Set<Marker> transportationMarkers = const <Marker>{};
  Uint8List? markerIcon;

//location section
  loc.LocationData? currentLocation;
  Future<void> checkAndRequestLocationPermission(BuildContext context) async {
    perm.PermissionStatus permissionStatus =
        await perm.Permission.location.status;
    if (permissionStatus.isDenied) {
      perm.PermissionStatus newPermissionStatus =
          await perm.Permission.location.request();
      if (newPermissionStatus.isGranted) {
        await enableLocationServices(context);
      }
    } else if (permissionStatus.isGranted) {
      await enableLocationServices(context);
    } else if (permissionStatus.isPermanentlyDenied) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(AppTranslations.locationRequired),
          content: Text(AppTranslations.locationDescribtion),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(AppTranslations.cancel),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await perm.openAppSettings();
              },
              child: Text(AppTranslations.openSettings),
            ),
          ],
        ),
      );
    }
  }

// enable location
  Future<void> enableLocationServices(BuildContext context) async {
    loc.Location location = loc.Location();
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      } else {
        getCurrentLocation(context);
      }
    }
    loc.PermissionStatus permissionStatus =
        await loc.Location().hasPermission();
    if (permissionStatus == loc.PermissionStatus.granted) {
      getCurrentLocation(context);
    }
  }

//get currnet
  Future<void> getCurrentLocation(BuildContext context) async {
    loc.Location location = loc.Location();
    location.getLocation().then(
      (location) async {
        currentLocation = location;
        getAddressFromLatLng(
            location.latitude ?? 0.0, location.longitude ?? 0.0);
        setTransportationMarkers();
        emit(GetCurrentLocationState());
        debugPrint("lat: ${currentLocation?.latitude}");
        debugPrint("long: ${currentLocation?.longitude}");
      },
    );
    location.onLocationChanged.listen((newLocationData) async {
      if (currentLocation != null) {
        double distance = Geolocator.distanceBetween(
          currentLocation!.latitude ?? 0.0,
          currentLocation!.longitude ?? 0.0,
          newLocationData.latitude ?? 0.0,
          newLocationData.longitude ?? 0.0,
        );
        //  debugPrint("Movedddd: $distance meters");
        if (distance > 8) {
          currentLocation = newLocationData;
          // getAddressFromLatLng(newLocationData.latitude ?? 0.0, newLocationData.longitude ?? 0.0);
          emit(GetCurrentLocationState());
          debugPrint("Updated lat: ${currentLocation?.latitude}");
          debugPrint("Updated long: ${currentLocation?.longitude}");
          debugPrint("Moved: $distance meters");
        }
        currentLocation = newLocationData;
        updateCameraposition();
      }
    });
  }

  setTransportationMarkers() {
    transportationMarkers = {
      Marker(
        markerId: const MarkerId('currentLocation'),
        icon: markerIcon != null
            ? BitmapDescriptor.bytes(markerIcon!)
            : BitmapDescriptor.defaultMarker,
        position: LatLng(
          currentLocation?.latitude ?? 0.0,
          currentLocation?.longitude ?? 0.0,
        ),
      ),
    };
    emit(SetTransportationMarkersState());
  }

  getmarker() async {
    markerIcon = await getBytesFromAsset(ImageAssets.marker, 50);
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

  GoogleMapController? mapController;
  Future<void> updateCameraposition() async {
    if (mapController != null && currentLocation != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(
            currentLocation!.latitude!,
            currentLocation!.longitude!,
          ),
        ),
      );
    }
  }

  disposeController() {
    mapController?.dispose();
    emit(DisposeMapState());
  }

  String country = " country ";
  String city = " city ";
  String address = " address ";
  String address2 = " address ";
  Future<void> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      //  await placemarkFromCoordinates(37.4219983, -122.084);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        country = place.country ?? "";
        city = place.locality ?? "";
        address2 =
            "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}, ${place.administrativeArea}, ${place.name}, ${place.subLocality}, ${place.subThoroughfare}";
        address = " ${place.locality}, ${place.administrativeArea}";
        emit(GetCurrentLocationAddressState());
      } else {
        emit(ErrorCurrentLocationAddressState());
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
      emit(ErrorCurrentLocationAddressState());
    }
  }
}
