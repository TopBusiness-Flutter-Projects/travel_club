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
}
