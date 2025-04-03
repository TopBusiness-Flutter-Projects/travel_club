abstract class MyReservationsState {}

class MyReservationInitial extends MyReservationsState {}

class IndexChanged extends MyReservationsState {}

class ChangeRating extends MyReservationsState {}
class FailureGetReservationDetailsState extends MyReservationsState {}
class SucessGetReservationDetailsState extends MyReservationsState {}
class LoadingGetReservationDetailsState extends MyReservationsState {}
class LoadingReservationBooking extends MyReservationsState {}
class LoadedReservationBooking extends MyReservationsState {}
class ErrorReservationBooking extends MyReservationsState {
  String error;
    ErrorReservationBooking({required this.error});
}
//cancel reservation
class LoadingCancelReservation extends MyReservationsState {}
class LoadedCancelReservation extends MyReservationsState {}
class ErrorCancelReservation extends MyReservationsState {}
