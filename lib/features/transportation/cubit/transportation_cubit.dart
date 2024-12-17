import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import '../data/repo/transportation_repo_impl.dart';
import 'transportation_state.dart';

class TransportationCubit extends Cubit<TransportationState> {
  TransportationCubit(this.api) : super(TransportationInitial());
  TransportationRepoImpl api;

  bool goOnly = true; // isOnly send single date else send drom and to

  void changeGoOnly(bool value) {
    goOnly = value;
    emit(TransportationInitial());
  }

  ///// from and to cities
  List<String> cities = ['القاهرة', 'اسيوط'];
  String? bookingFromvalue;
  String? bookingTovalue;
  void changeFromValue(String value) {
    bookingFromvalue = value;
    emit(TransportationInitial());
  }

  void changeToValue(String value) {
    bookingTovalue = value;
    emit(TransportationInitial());
  }

  ////// from and to dates
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  String fromDate = DateFormat('yyyy-MM-dd', 'en').format(DateTime.now());
  String toDate = DateFormat('yyyy-MM-dd', 'en').format(DateTime.now());
  String singleDate = DateFormat('yyyy-MM-dd', 'en').format(DateTime.now());
  void onSelectedDate(
      {required bool isStartDate, required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(9999),
    );

    if (picked != null) {
      if (isStartDate) {
        if (picked.isAfter(selectedEndDate)) {
          errorGetBar("تاريخ البداية يجب أن يكون قبل تاريخ النهاية");
          return;
        }
        selectedStartDate = picked;
      } else {
        if (picked.isBefore(selectedStartDate)) {
          errorGetBar("تاريخ النهاية يجب أن يكون بعد تاريخ البداية");
          return;
        }
        selectedEndDate = picked;
      }
      updateDateStrings();
      emit(DateChangedState());
    }
  }

  void onSelectedDateSingle({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(9999),
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

  int seatColumnCount = 11;
}
