import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import '../data/repo/my_bookings_repo_impl.dart';
import 'my_bookings_state.dart';

class MyBookingsCubit extends Cubit<MyBookingsState> {
  MyBookingsCubit(this.api) : super(MyBookingsInitial());
  MyBookingsRepoImpl api;
}
