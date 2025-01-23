abstract class MyReservationsState {}

class MyReservationInitial extends MyReservationsState {}

class IndexChanged extends MyReservationsState {}

class ChangeRating extends MyReservationsState {}
class FailureGetReservationDetailsState extends MyReservationsState {}
class SucessGetReservationDetailsState extends MyReservationsState {}
class LoadingGetReservationDetailsState extends MyReservationsState {}
class LoadingReservationBooking extends MyReservationsState {}
class LoadedReservationBooking extends MyReservationsState {}
class ErrorReservationBooking extends MyReservationsState {}
