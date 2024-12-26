import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import '../data/repo/my_bookings_repo_impl.dart';
import 'my_bookings_state.dart';

class MyBookingsCubit extends Cubit<MyBookingsState> {
  MyBookingsCubit(this.api) : super(MyBookingsInitial());
  MyBookingsRepoImpl api;
  int selectedIndex = 0;
  double rating = 0; // Default rating

  List<String>categories = [
    AppTranslations.accommodationBookings,
    AppTranslations.transportation,
    AppTranslations.foodBookings
  ];

  void changeContainer(int index) {
    selectedIndex = index;
    emit(IndexChanged());
  }

  void changeRating(double newRating) {
    rating = newRating;
    emit(ChangeRating()); // Emit an event to notify listeners
  }
}
