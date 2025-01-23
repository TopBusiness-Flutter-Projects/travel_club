import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import '../data/repo/my_reservations_repo_impl.dart';
import 'my_bookings_state.dart';

class MyReservationsCubit extends Cubit<MyReservationsState> {
  MyReservationsCubit(this.api) : super(MyReservationInitial());
  MyReservationsRepoImpl api;
  int selectedIndex = 0;
  double rating = 0; // Default rating
  List<double> rates = [3, 3, 3, 3];

  List<String> categories = [
    AppTranslations.accommodationBookings,
    AppTranslations.transportation,
    AppTranslations.foodBookings,
    AppTranslations.entertainment,
  ];

  void changeContainer(int index) {
    selectedIndex = index;
    emit(IndexChanged());
  }

  void changeRating(double newRating, int index) {
    rates[index] = newRating;
    emit(ChangeRating()); // Emit an event to notify listeners
  }
}
