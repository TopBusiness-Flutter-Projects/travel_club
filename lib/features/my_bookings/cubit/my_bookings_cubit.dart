import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/utils/appwidget.dart';
import '../data/models/residence_reservation_model.dart';
import '../data/repo/my_reservations_repo_impl.dart';
import 'my_bookings_state.dart';

class MyReservationsCubit extends Cubit<MyReservationsState> {
  MyReservationsCubit(this.api) : super(MyReservationInitial());
  MyReservationsRepoImpl api;
  int selectedIndex = 1;

  double rating = 0; // Default rating
  List<double> rates = [3, 3, 3, 3];

  List<String> categories = [
    AppTranslations.accommodationBookings,
    AppTranslations.transportation,
    AppTranslations.foodBookings,
    AppTranslations.entertainment,
    AppTranslations.otherServices,
  ];
  GetMyResidenceReservationModel?residenceReservationModel;
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
  void changeContainer(int index) {
    selectedIndex = index;
    emit(IndexChanged());
  }

  void changeRating(double newRating, int index) {
    rates[index] = newRating;
    emit(ChangeRating()); // Emit an event to notify listeners
  }
  //cancel reservation
  cancelReservation(int id, BuildContext context)async{
    AppWidget.createProgressDialog(context, AppTranslations.loading);
    emit(LoadingCancelReservation());
    final res = await api.cancelReservation(moduleId: selectedIndex, reservationId: id);
    res.fold((l) {
      Navigator.pop(context);
      emit(ErrorCancelReservation());
    }, (r) {
      Navigator.pop(context);

      emit(LoadedCancelReservation());
    }
    );
  }
}
