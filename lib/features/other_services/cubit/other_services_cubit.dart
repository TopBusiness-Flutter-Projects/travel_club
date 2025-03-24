import 'package:flutter_bloc/flutter_bloc.dart';
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
    }, (r) {
      subServicesModel = r;

      // homeModel.data!.modules = homeModel.data!.modules!.sublist(0, moduleslenth);
      emit(LoadedOthersData());
    });
  }
  GetSingleServiceMoedl getSingleServiceModel = GetSingleServiceMoedl();
  getSinglelSubServices({required String id}) async {
    emit(LoadingOthers());
    final res = await api.getSubSingleServices(id: id);
    res.fold((l) {
      emit(ErrorOthers());
    }, (r) {
      getSingleServiceModel = r;
      // homeModel.data!.modules = homeModel.data!.modules!.sublist(0, moduleslenth);
      emit(LoadedOthersData());
    });
  }
}
