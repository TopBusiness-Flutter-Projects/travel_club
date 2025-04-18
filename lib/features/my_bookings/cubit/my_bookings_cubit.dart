import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/utils/appwidget.dart';
import 'package:travel_club/features/home/data/models/home_model.dart';
import 'package:travel_club/features/my_bookings/data/models/transportation_reservation_details_model.dart';
import 'package:travel_club/features/my_bookings/data/models/transportation_reservation_model.dart';
import '../../food/data/models/get_menu_meals_model.dart';
import '../data/models/food_reservation_details.dart';
import '../data/models/food_reservation_model.dart';
import '../data/models/get_entertainment_details_reserv.dart';
import '../data/models/get_entertainment_reservation_model.dart';
import '../data/models/residence_reservation_details_model.dart';
import '../data/models/residence_reservation_model.dart';
import '../data/repo/my_reservations_repo_impl.dart';
import 'my_bookings_state.dart';

class MyReservationsCubit extends Cubit<MyReservationsState> {
  MyReservationsCubit(this.api) : super(MyReservationInitial());
  MyReservationsRepoImpl api;
  int selectedModuleId = 1;
  ModuleModel? selectedModule;

  TextEditingController rateCommentController = TextEditingController();
  List<double> rates = [3, 3, 3, 3];
 
 addRate(BuildContext context ,{required int reservationId ,required int id}) async {
    AppWidget.createProgressDialog(context, AppTranslations.loading);
    emit(LoadingCancelReservation());
    final res = await api.addRate(
        moduleId: selectedModuleId,
        reservationId: reservationId,
        comment: rateCommentController.text,
        rates: rates, id: id
        );
    res.fold((l) {
      Navigator.pop(context);
      errorGetBar(AppTranslations.error);
      emit(ErrorCancelReservation());
    }, (r) {
      Navigator.pop(context);
      if (r.data == false) {
        errorGetBar(r.msg ?? AppTranslations.error);
      } else {
        if (selectedModuleId == 1) {                    
          residenceReservationModel = GetMyResidenceReservationModel();
        }
        if (selectedModuleId == 2) {
          transportationReservationModel = GetMyTransportationReservationModel();
        }
        if (selectedModuleId == 3) {
          foodReservationModel = GetMyFoodReservationModel();
        }
        if (selectedModuleId == 4) {
          entertainmentReservationModel = GetEntertainmentReservationModel();
        }
        getMyReservation(moduleId: selectedModuleId);
        getReservationDetails(reservationId: reservationId);
        Navigator.pop(context);
        successGetBar(r.msg);
      }
      emit(LoadedCancelReservation());
    });
  }
/////// counter ///////

  int goAndReturnDifference(
      {required int goCounter, required int returnCounter}) {
    int difference = returnCounter - goCounter;
    return difference > 0
        ? difference
        : -difference; // Ensure the result is positive
  }

  int getRoundTripsCounter(
      {required int goCounter, required int returnCounter}) {
    if (goCounter <= returnCounter) {
      return goCounter;
    } else {
      return returnCounter;
    }
  }

  GetMyResidenceReservationModel ?residenceReservationModel;
  GetMyFoodReservationModel foodReservationModel = GetMyFoodReservationModel();
  GetEntertainmentReservationModel entertainmentReservationModel = GetEntertainmentReservationModel();
  GetMyTransportationReservationModel transportationReservationModel =
      GetMyTransportationReservationModel();
  getMyReservation({required int moduleId}) async {
    emit(LoadingReservationBooking());
    final res = await api.getMyReservation(
      moduleId: moduleId,
    );
    res.fold((l) {
      if (l is ServerFailure) {
        emit(ErrorReservationBooking(error:"server_error_occurred".tr()));
      } else {
        emit(ErrorReservationBooking(error:"unKnown_error_occurred".tr()));
      }
  //    emit(ErrorReservationBooking(error: l.toString()));
    }, (r) {
      if (moduleId == 1) {
        residenceReservationModel = r;
      }
      if (moduleId == 2) {
        transportationReservationModel = r;
      } if (moduleId == 3) {
        foodReservationModel = r;
      }if(moduleId == 4){
        entertainmentReservationModel = r;
      }
      emit(LoadedReservationBooking());
    });
  }

  void changeModule(int moduleId) {
    selectedModuleId = moduleId;
    getMyReservation(moduleId: moduleId);
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
        if (selectedModuleId == 1) {
          residenceReservationModel = GetMyResidenceReservationModel();
        }
        if (selectedModuleId == 2) {
          transportationReservationModel =
              GetMyTransportationReservationModel();
        }
        if (selectedModuleId == 3) {
          foodReservationModel = GetMyFoodReservationModel();
        }
        if (selectedModuleId == 4) {
          entertainmentReservationModel = GetEntertainmentReservationModel();
        }
        getMyReservation(moduleId: selectedModuleId);
        getReservationDetails(reservationId: reservationId);
        Navigator.pop(context);
        successGetBar(r.msg);
      }
      emit(LoadedCancelReservation());
    });
  }
  List<MealModel> cartItems = [];

  /// reservation details
  GetResidenceReservationDetailsModel getResidenceReservationDetailsModel = GetResidenceReservationDetailsModel();
  GetEntertainmentReservationDetailsModel getEntertainmentReservationDetailsModel = GetEntertainmentReservationDetailsModel();
  GeTransportationReservationDetailsModel
      getTransportationReservationDetailsModel =
      GeTransportationReservationDetailsModel();
  GetFoodReservationDetailsModel foodReservationDetails=GetFoodReservationDetailsModel();
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
      if (selectedModuleId == 3) {
       
        foodReservationDetails = r;
      }  if (selectedModuleId == 4) {
       
        getEntertainmentReservationDetailsModel = r;
      }
      emit(SucessGetReservationDetailsState());
    });
  }

}
