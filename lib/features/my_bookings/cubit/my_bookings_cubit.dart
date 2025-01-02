import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import '../data/repo/my_bookings_repo_impl.dart';
import 'my_bookings_state.dart';

class MyBookingsCubit extends Cubit<MyBookingsState> {
  MyBookingsCubit(this.api) : super(MyBookingsInitial());
  MyBookingsRepoImpl api;
  int selectedIndex = 0;
  double rating = 0; // Default rating
  List<double> rates = [
    3,3,3,3
  ];

  List<String>categories = [
    AppTranslations.accommodationBookings,
    AppTranslations.transportation,
    AppTranslations.foodBookings,
    AppTranslations.entertainment,

  ];

  void changeContainer(int index) {
    selectedIndex = index;
    emit(IndexChanged());
  }

  void changeRating(double newRating , int index) {
    rates[index] = newRating;
    emit(ChangeRating()); // Emit an event to notify listeners
  }
}
