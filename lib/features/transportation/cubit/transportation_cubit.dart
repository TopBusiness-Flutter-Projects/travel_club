import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import '../data/repo/transportation_repo_impl.dart';
import 'transportation_state.dart';

class TransportationCubit extends Cubit<TransportationState> {
  TransportationCubit(this.api) : super(TransportationInitial());
  TransportationRepoImpl api;

  bool goOnly = true;

  void changeGoOnly( bool value) {
    goOnly = value;
    emit(TransportationInitial());
  }
  ///// from and to cities
  List<String> cities = ['القاهرة', 'اسيوط'];
  String? bookingFromvalue;
  String? bookingTovalue ;
  void changeFromValue(String value) {
    bookingFromvalue = value;
    emit(TransportationInitial());
  }

  void changeToValue(String value) {
    bookingTovalue = value;
    emit(TransportationInitial());
  }

  ////// from and to dates
   DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  String? fromDate;
  String? toDate;
  void onSelectedDate(bool isStartDate, BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate
          ? (selectedStartDate ?? DateTime.now())
          : (selectedEndDate ?? DateTime.now()),
      firstDate: DateTime(2000),
      lastDate: DateTime(9999),
    );

    if (picked != null) {
      if (isStartDate) {
        // التأكد أن تاريخ البداية هو قبل تاريخ النهاية (إذا كان موجودًا)
        if (selectedEndDate != null && picked.isAfter(selectedEndDate!)) {
          errorGetBar("تاريخ البداية يجب أن يكون قبل تاريخ النهاية");
          return;
        }
        selectedStartDate = picked;
      } else {
        // التأكد أن تاريخ النهاية هو بعد تاريخ البداية (إذا كان موجودًا)
        if (selectedStartDate != null && picked.isBefore(selectedStartDate!)) {
          errorGetBar("تاريخ النهاية يجب أن يكون بعد تاريخ البداية");
          return;
        }
        selectedEndDate = picked;
      }
      updateDateStrings();
      emit(DateChangedState());
    }
  }

  void updateDateStrings() {
    fromDate = selectedStartDate != null
        ? DateFormat('yyyy-MM-dd', 'en').format(selectedStartDate!)
        : DateFormat('yyyy-MM-dd', 'en')
            .format(DateTime.now()); // تاريخ اليوم كقيمة افتراضية

    toDate = selectedEndDate != null
        ? DateFormat('yyyy-MM-dd', 'en').format(selectedEndDate!)
        : DateFormat('yyyy-MM-dd', 'en')
            .format(DateTime.now()); // تاريخ اليوم كقيمة افتراضية

    print('From date: $fromDate, To date: $toDate');
  }

}
