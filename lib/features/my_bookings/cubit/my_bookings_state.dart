abstract class MyReservationsState {}

class MyReservationInitial extends MyReservationsState {}

class IndexChanged extends MyReservationsState {}

class ChangeRating extends MyReservationsState {}
//reservation booking
class LoadingReservationBooking extends MyReservationsState {}
class LoadedReservationBooking extends MyReservationsState {}
class ErrorReservationBooking extends MyReservationsState {}
//cancel reservation
class LoadingCancelReservation extends MyReservationsState {}
class LoadedCancelReservation extends MyReservationsState {}
class ErrorCancelReservation extends MyReservationsState {}
