import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/utils/appwidget.dart';
import 'package:travel_club/features/home/data/models/home_model.dart';
import '../data/models/residence_reservation_details_model.dart';
import '../data/models/residence_reservation_model.dart';
import '../data/repo/my_reservations_repo_impl.dart';
import 'my_bookings_state.dart';

class MyReservationsCubit extends Cubit<MyReservationsState> {
  MyReservationsCubit(this.api) : super(MyReservationInitial());
  MyReservationsRepoImpl api;
  int selectedModuleId = 1;
  ModuleModel? selectedModule;

  double rating = 0; // Default rating
  List<double> rates = [3, 3, 3, 3];
 
  GetMyResidenceReservationModel residenceReservationModel =
      GetMyResidenceReservationModel();
  getMyBookingReservation() async {
    emit(LoadingReservationBooking());
    final res = await api.getMyResidenceReservation();
    res.fold((l) {
      emit(ErrorReservationBooking());
    }, (r) {
      residenceReservationModel = r;
      emit(LoadedReservationBooking());
    });
  }

  void changeModule(int moduleId) {
    selectedModuleId = moduleId;
    emit(IndexChanged());
  }

  void changeRating(double newRating, int index) {
    rates[index] = newRating;
    emit(ChangeRating()); // Emit an event to notify listeners
  }

  //cancel reservation
  cancelReservation(BuildContext context, {required int reservationId}) async {
    AppWidget.createProgressDialog(context, AppTranslations.loading);
    emit(LoadingCancelReservation());
    final res = await api.cancelReservation(
        moduleId: selectedModuleId, reservationId: reservationId);
    res.fold((l) {
      Navigator.pop(context);
      errorGetBar(AppTranslations.error);
      emit(ErrorCancelReservation());
    }, (r) {
      Navigator.pop(context);
      if (r.data == false) {
        errorGetBar(r.msg ?? AppTranslations.error);
      } else {
        getResidenceReservationDetails(reservationId: reservationId);
        Navigator.pop(context);
        successGetBar(r.msg);
      }
      emit(LoadedCancelReservation());
    });
  }

  /// reservation details
  GetResidenceReservationDetailsModel getResidenceReservationDetailsModel =
      GetResidenceReservationDetailsModel();
  getResidenceReservationDetails({
    required int reservationId,
  }) async {
    emit(LoadingGetReservationDetailsState());
    final res = await api.getResidenceReservationDetails(
        reservationId: reservationId, moduleId:selectedModuleId );
    res.fold((l) {
      emit(FailureGetReservationDetailsState());
    }, (r) {
      getResidenceReservationDetailsModel = r;
      emit(SucessGetReservationDetailsState());
    });
  }
}
