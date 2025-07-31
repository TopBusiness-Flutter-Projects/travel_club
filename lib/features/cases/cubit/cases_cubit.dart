import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/utils/appwidget.dart';
import 'package:travel_club/features/cases/data/model/book_case_model.dart';
import 'package:travel_club/features/cases/data/model/suitcase_details_model.dart';

import '../../../core/exports.dart';
import '../data/model/get_suitcase.dart';
import '../data/repo/cases_repo_impl.dart';

part 'cases_state.dart';

class CasesCubit extends Cubit<CasesState> {
  CasesCubit(this.api) : super(CasesInitial());
  CasesRepoImpl api;
  GetSuitCaseModel? getSuitCaseModel;
  getSuitCases() async {
    emit(NotificationLoadingState());
    final res = await api.getSuitCases();
    res.fold((l) {
      emit(NotificationErrorState(error: "server_error_occurred".tr()));
    }, (r) {
      getSuitCaseModel = r;
      emit(NotificationLoadedState());
    });
  }

  GetSuitCaseDetailsModel? getSuitcaseDetailsModel;
  getSuitcasesDetails({required String id}) async {
    try {
      getSuitcaseDetailsModel = null;
      selectedFromDate = null;
      counter = 1;
      emit(SeenNotificationLoadingState());
      final res = await api.getSuitcasesDetails(id);
      res.fold((l) {
        errorGetBar(AppTranslations.error);
        emit(SeenNotificationErrorState(error: "server_error_occurred".tr()));
      }, (r) {
        if (r.status == 200 || r.status == 201) {
          getSuitcaseDetailsModel = r;
        } else if (r.status == 401 || r.status == 407 || r.status == 403) {
          errorGetBar(r.msg ?? AppTranslations.error);
        }
        emit(SeenNotificationLoadedState());
      });
    } catch (e) {
      errorGetBar(AppTranslations.error);
      emit(SeenNotificationErrorState(error: "unKnown_error_occurred".tr()));
    }
  }

  BookSuitCaseDetailsModel? bookSuitcaseDetailsModel;
  bookSuitcases(BuildContext context) async {
   AppWidget.createProgressDialog(context, ""); try {
      
      emit(SeenNotificationLoadingState());
      final res = await api.bookSuitcases(
        id: selectedFromDate?.id.toString() ?? "",
        count: counter,
      );
      res.fold((l) {
        Navigator.pop(context);

        errorGetBar(AppTranslations.error);
        emit(SeenNotificationErrorState(error: "server_error_occurred".tr()));
      }, (r) {
        Navigator.pop(context);
        if (r.status == 200 || r.status == 201) {
          bookSuitcaseDetailsModel = r;
          Navigator.pushNamed(
            context,
            Routes.bookCasesRoute,
          );
        } else if (r.status == 401 || r.status == 407 || r.status == 403) {
          errorGetBar(r.msg ?? AppTranslations.error);
        }
        emit(SeenNotificationLoadedState());
      });
    } catch (e) {
      log("Error in bookSuitcases: $e");
      Navigator.pop(context);
      errorGetBar(e.toString());
      emit(SeenNotificationErrorState(error: "unKnown_error_occurred".tr()));
    }
  }

  StartsDate? selectedFromDate;
  void changeStationValue(
    StartsDate value,
  ) {
    selectedFromDate = value;
    counter = 1;

    emit(StartsDateState());
  }

  int counter = 1;

  void changeCounter(bool isPlus) {
    if (isPlus) {
      if (selectedFromDate?.available != null &&
          counter < selectedFromDate!.available!) {
        counter = counter + 1;
      }
    } else {
      if (counter > 1) {
        counter = counter - 1;
      }
    }
    emit(StartsDateState());
  }
}
