import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:travel_club/core/exports.dart';
import '../data/models/get_others_model.dart';
import '../data/models/get_single_service_model.dart';
import '../data/models/sub_services_model.dart';
import '../data/repo/other_services_repo_impl.dart';
import 'other_services_state.dart';

class OtherServicesCubit extends Cubit<OtherServicesScreenState> {
  OtherServicesCubit(this.api) : super(OtherServicesScreenInitial());
  OtherServicesRepoImpl api;
  TextEditingController searchController = TextEditingController();
  GetOthersModel othersModel = GetOthersModel();
  getOthers() async {
    emit(LoadingOthers());
    final res = await api.getOthers();
    res.fold((l) {
      emit(ErrorOthers());
    }, (r) {
      othersModel = r;
      // homeModel.data!.modules = homeModel.data!.modules!.sublist(0, moduleslenth);
      emit(LoadedOthersData());
    });
  }

  GetSubServicesModel subServicesModel = GetSubServicesModel();
  getSubServices({required String id}) async {
    emit(LoadingOthers());
    final res = await api.getSubServices(id: id);
    res.fold((l) {
      emit(ErrorOthers());
    }, (r) async {
      subServicesModel = r;
      // emit(LoadedOthersData());
      for (int i = 0; i < subServicesModel.data!.length; i++) {
        if (subServicesModel.data?[i].latitude != null &&
            subServicesModel.data?[i].longitude != null) {
          subServicesModel.data?[i].location = await getAddress(
              double.parse(subServicesModel.data![i].latitude!),
              double.parse(subServicesModel.data![i].longitude!));
        }

        print("location: ${subServicesModel.data?[i].location}");
      }
      emit(LoadedOthersData());
    });
  }

  Future<String> getAddress(double latitude, double longitude) async {
    String address = "";
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        address = " ${place.locality}, ${place.administrativeArea}";
      }
      return address;
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
      return address;
    }
  }

  GetSubServiceDetailsModel getSingleServiceModel = GetSubServiceDetailsModel();
  getSinglelSubServices({required String id}) async {
    emit(LoadingOthers());
    final res = await api.getServiceDetails(id: id);
    res.fold((l) {
      emit(ErrorOthers());
    }, (r) {
      getSingleServiceModel = r;
      // homeModel.data!.modules = homeModel.data!.modules!.sublist(0, moduleslenth);
      emit(LoadedOthersData());
    });
  }
}
