import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/location/cubit/location_cubit.dart';
import 'package:travel_club/features/residence/cubit/residence_cubit.dart';
import 'package:travel_club/features/transportation/data/models/get_companies_model.dart';
import 'package:travel_club/features/transportation/data/models/get_companyStations_model.dart';
import '../data/repo/transportation_repo_impl.dart';
import 'transportation_state.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';

class TransportationCubit extends Cubit<TransportationState> {
  TransportationCubit(this.api) : super(TransportationInitial());
  TransportationRepoImpl api;

  bool goOnly = true; // isOnly send single date else send drom and to

  void changeGoOnly(bool value) {
    goOnly = value;
    emit(TransportationInitial());
  }

  ///// from and to cities
  bool isFavoriteTrue = false;
  StationModel? selectedFromStation;
  StationModel? selectedToStation;

  void changeStationValue(StationModel value, bool isFrom) {
    print("Selected Station ID: ${value.id}");
    print("Current Selected From Station ID: ${selectedFromStation?.id}");
    print("Current Selected To Station ID: ${selectedToStation?.id}");
    if ((isFrom &&
            selectedToStation != null &&
            value.id == selectedToStation?.id) ||
        (!isFrom && selectedFromStation != null &&
            value.id == selectedFromStation?.id)) {
      print("You cannot select the same station.");
      errorGetBar(AppTranslations.youCanNotSelectSameStation);

      // Reset the corresponding station
      if (isFrom) {
        selectedFromStation = null;
      } else {
        selectedToStation = null;
      }
    } else {
      // Set the station based on isFrom
      if (isFrom) {
        selectedFromStation = value;
      } else {
        selectedToStation = value;
      }
    }

    // Emit the updated state
    emit(TransportationInitial());
  }

  ////// from and to dates
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now().add(const Duration(days: 2));
  DateTime selectedDate = DateTime.now();
  String fromDate = DateFormat('yyyy-MM-dd', 'en').format(DateTime.now());
  String toDate = DateFormat('yyyy-MM-dd', 'en')
      .format(DateTime.now().add(const Duration(days: 2)));
  String singleDate = DateFormat('yyyy-MM-dd', 'en').format(DateTime.now());
  void onSelectedDate(
      {required bool isStartDate, required BuildContext context}) async {
    // final DateTime? picked = await showDatePicker(

    // );
    var picked = await DatePicker.showSimpleDatePicker(
      context,
      initialDate: isStartDate ? selectedStartDate : selectedEndDate,
      firstDate: isStartDate
          ? DateTime.now()
          : selectedStartDate.add(Duration(days: 1)),
      lastDate: isStartDate
          ? selectedEndDate.subtract(Duration(days: 1))
          : selectedStartDate.add(Duration(days: 365)),
      // : DateTime(9999),
      dateFormat: "dd/MMMM/yyyy",
      backgroundColor: AppColors.primary,
      textColor: AppColors.white,
      itemTextStyle: getMediumStyle(color: AppColors.white),
      locale: DateTimePickerLocale.en_us,
      looping: false,
    );

    if (picked != null) {
      if (isStartDate) {
        // if (picked.isAfter(selectedEndDate)) {
        //   errorGetBar("تاريخ البداية يجب أن يكون قبل تاريخ النهاية");
        //   return;
        // }
        selectedStartDate = picked;
        context.read<ResidenceCubit>().makeModelNull();
      } else {
        // if (picked.isBefore(selectedStartDate)) {
        //   errorGetBar("تاريخ النهاية يجب أن يكون بعد تاريخ البداية");
        //   return;
        // }
        selectedEndDate = picked;
        context.read<ResidenceCubit>().makeModelNull();
      }
      updateDateStrings();
      emit(DateChangedState());
    }
  }

  void onSelectedDateSingle({required BuildContext context}) async {
    var picked = await DatePicker.showSimpleDatePicker(
      context,
      initialDate: DateTime.now(),
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
    fromDate = DateFormat('yyyy-MM-dd', 'en')
        .format(selectedStartDate); // تاريخ اليوم كقيمة افتراضية

    toDate = DateFormat('yyyy-MM-dd', 'en')
        .format(selectedEndDate); // تاريخ اليوم كقيمة افتراضية
    singleDate = DateFormat('yyyy-MM-dd', 'en')
        .format(selectedDate); // تاريخ اليوم كقيمة افتراضية
  }

  // 13 >> 50 seats
  // 11 >>43
  int seatRowsCount = 13;
  List<int> reservedSeats = [1, 4, 5, 22, 25, 26, 55, 41];
  List<int> selectedSeats = [];

  void selectSeat(int seatNumber) {
    if (selectedSeats.contains(seatNumber)) {
      selectedSeats.remove(seatNumber);
    } else {
      selectedSeats.add(seatNumber);
    }
    emit(SeatChangedState());
  }

  String convertToEnglishDigits(String input) {
    const Map<String, String> arabicToEnglishDigits = {
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
    };
    String output = input;
    arabicToEnglishDigits.forEach((arabic, english) {
      output = output.replaceAll(arabic, english);
    });

    return output;
  }

  //get Companies
  GetCompaniesModel getCompaniesModel = GetCompaniesModel();
  getCompanies(BuildContext context) async {
    getCompaniesModel = GetCompaniesModel();
    emit(GetCompaniesModelLoadingState());
    final res = await api.getCompanies(
      lat: (context.read<LocationCubit>().currentLocation?.latitude ?? 0.0)
          .toString(),
      long: (context.read<LocationCubit>().currentLocation?.longitude ?? 0.0).toString(),
    );
    res.fold((l) {
      emit(GetCompaniesModelFailureState());
    }, (r) {
      getCompaniesModel = r;
      emit(GetCompaniesModelSuccessState());
    }
    );
  }

  //get Company Stations
  GetCompanyStationModel getCompanyStationsiesModel = GetCompanyStationModel();
  getCompanyStations(BuildContext context, {required int companyId}) async {
    getCompanyStationsiesModel = GetCompanyStationModel();
    selectedFromStation = null;
    selectedToStation = null;
    emit(GetCompaniesModelLoadingState());
    final res = await api.getCompanyStations(
      lat: (context.read<LocationCubit>().currentLocation?.latitude ?? 0.0)
          .toString(),
      long: (context.read<LocationCubit>().currentLocation?.longitude ?? 0.0)
          .toString(),
      companyId: companyId,
    );
    res.fold((l) {
      emit(GetCompaniesModelFailureState());
    }, (r) {
      if (r.data!.isNotEmpty) {
        selectedFromStation = r.data!.first;
        // selectedToStation = r.data!.last;
      }
      getCompanyStationsiesModel = r;
      emit(GetCompaniesModelSuccessState());
    });
  }
}
