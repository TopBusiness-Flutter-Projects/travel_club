import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/utils/appwidget.dart';
import 'package:travel_club/features/home/data/models/home_model.dart';
import 'package:travel_club/features/my_bookings/data/models/transportation_reservation_details_model.dart';
import 'package:travel_club/features/my_bookings/data/models/transportation_reservation_model.dart';
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


/////// counter /////// 

 int goAndReturnDifference( {required int goCounter,required int returnCounter}) {
    int difference = returnCounter - goCounter;
    return difference > 0
        ? difference
        : -difference; // Ensure the result is positive
  }

  int getRoundTripsCounter( {required int goCounter,required int returnCounter}) {
    if (goCounter <= returnCounter) {
      return goCounter;
    } else {
      return returnCounter;
    }
  }

    








  GetMyResidenceReservationModel residenceReservationModel =
      GetMyResidenceReservationModel();
  GetMyTransportationReservationModel transportationReservationModel =
      GetMyTransportationReservationModel();
  getMyReservation() async {
    emit(LoadingReservationBooking());
    final res = await api.getMyReservation(
      moduleId: selectedModuleId,
    );
    res.fold((l) {
      emit(ErrorReservationBooking());
    }, (r) {
      if (selectedModuleId == 1) {
        residenceReservationModel = r;
      }
      if (selectedModuleId == 2) {
        transportationReservationModel = r;
      }
      emit(LoadedReservationBooking());
    });
  }

  void changeModule(int moduleId) {
    selectedModuleId = moduleId;
    getMyReservation();
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
        getReservationDetails(reservationId: reservationId);
        Navigator.pop(context);
        successGetBar(r.msg);
      }
      emit(LoadedCancelReservation());
    });
  }

  /// reservation details
  GetResidenceReservationDetailsModel getResidenceReservationDetailsModel =
      GetResidenceReservationDetailsModel();
  GeTransportationReservationDetailsModel
      getTransportationReservationDetailsModel =
      GeTransportationReservationDetailsModel();
  getReservationDetails({
    required int reservationId,
  }) async {
    emit(LoadingGetReservationDetailsState());
    final res = await api.getResidenceReservationDetails(
        reservationId: reservationId, moduleId: selectedModuleId);
    res.fold((l) {
      emit(FailureGetReservationDetailsState());
    }, (r) {
      if (selectedModuleId == 1) {
        getResidenceReservationDetailsModel = r;
      }
      if (selectedModuleId == 2) {
        getTransportationReservationDetailsModel = r;
      }
      emit(SucessGetReservationDetailsState());
    });
  }
}
