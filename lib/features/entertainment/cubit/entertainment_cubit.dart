import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:meta/meta.dart';
import 'package:travel_club/core/utils/appwidget.dart';
import 'package:travel_club/features/entertainment/data/model/add_reservation_model.dart';

import '../../../core/exports.dart';
import '../data/model/get_orginization_details_model.dart';
import '../data/model/get_orginization_model.dart';
import '../data/model/get_ways_model.dart';
import '../data/repo/entertainment_repo_impl.dart';

part 'entertainment_state.dart';

class EntertainmentCubit extends Cubit<EntertainmentState> {
  EntertainmentCubit(this.api) : super(EntertainmentInitial());
  EntertainmentRepoImpl api;
  bool isServiceSelected = false;
  int currentIndex = 0;
  TextEditingController clientCountController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  String countryCode = '+20';
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  String singleDate = DateFormat('yyyy-MM-dd', 'en').format(DateTime.now());
  DateTime selectedDate = DateTime.now();
  void onSelectedDateSingle({required BuildContext context}) async {
    var picked = await DatePicker.showSimpleDatePicker(
      context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(9999),
      dateFormat: "dd/MMMM/yyyy",
      backgroundColor: AppColors.primary,
      textColor: AppColors.white,
      itemTextStyle: getMediumStyle(color: AppColors.white),
      locale: DateTimePickerLocale.en_us,
      looping: false,
    );
    if (picked != null) {
      selectedDate = picked;
      updateDateStrings();
      emit(DateChangedState());
    }
  }

  void updateDateStrings() {
    singleDate = DateFormat('yyyy-MM-dd', 'en').format(selectedDate);
  }

  bool? isFavoriteTrue = false;
  final List<String> imageUrls = [
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
  ];
  void changeIndex(bool index) {
    isServiceSelected = index;
    emit(ChangeIndex());
  }

  /////get catogrey
  GetWaysModel getWaysModel = GetWaysModel();
  getWays() async {
    emit(LoadingGetWays());
    final res = await api.GetWays();
    res.fold((l) {
      emit(ErrorGetWays());
    }, (r) {
      getWaysModel = r;

      emit(LoadedGtWays());
    });
  }

  //get orginization
  GetOrganizationsModel? getOrganizationsModel;
  getOrginization({required String id}) async {
    getOrganizationsModel=null;
    emit(LoadingOrganizers());
    final res = await api.getOrganizations(id: id);
    res.fold((l) {
      emit(ErrorOrganizers());
    }, (r) {
      getOrganizationsModel = r;

      emit(LoadedOrganizers());
    });
  }

  GetOrganizationDetails? getOrganizationsDetailsModel;
  getOrginizationDetails({required String id}) async {
    getOrganizationsDetailsModel=null;
    emit(LoadingOrganizersDetails());
    final res = await api.getOrganizationsDetails(id: id);
    res.fold((l) {
      emit(ErrorOrganizersDetails());
    }, (r) {
      getOrganizationsDetailsModel = r;
      emit(LoadedOrganizersDetails());
    });
  }

  AddEntertainmentReservationModel? addEntetainmentReservationModel;
  addEntertainmentReservation(
      BuildContext context, WayService wayService) async {
    AppWidget.createProgressDialog(context, AppTranslations.loading);

    emit(ReservationLoading());

    final response = await api.addEntertainmentReservation(
        serviceId: wayService.id.toString(),
        userName: userNameController.text,
        date: singleDate.toString(),
        clientCount: clientCountController.text,
        userPhone: userPhoneController.text);
    response.fold((l) {
      Navigator.pop(context);
      errorGetBar(AppTranslations.error);
      emit(ReservationError());
    }, (r) {
      Navigator.pop(context);
      print("code: ${r.status.toString()}");
      if (r.status != 200 && r.status != 201) {
        errorGetBar(r.msg ?? "");
      } else {
        addEntetainmentReservationModel = r;
        Navigator.pushNamed(context, Routes.secondBookTableEntertainment,
            arguments: wayService);
        userPhoneController.clear();
        userNameController.clear();
        // clientCountController.clear();
        emit(ReservationLoaded());
        successGetBar(r.msg);
      }
    });
  }
}
