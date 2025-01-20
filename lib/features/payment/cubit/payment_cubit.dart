import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/preferences/preferences.dart';
import 'package:travel_club/core/utils/appwidget.dart';
import 'package:travel_club/core/utils/restart_app_class.dart';
import 'package:travel_club/features/auth/data/models/login_model.dart';
import '../data/models/check_copoune_model.dart';
import '../data/repo/payment_repo_impl.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.api) : super(PaymentInitial());
  PaymentRepoImpl api;
  int currentModuleId = 0;
  TextEditingController couponController = TextEditingController();
  // check copoune
  CheckCopouneModel checkCopouneModel = CheckCopouneModel();
  checkCopoune(BuildContext context, {required String amount}) async {
    emit(LoadingCheckCopouneState());
    AppWidget.createProgressDialog(context, AppTranslations.loading);
    final response = await api.checkCopoune(
        amount: amount, code: couponController.text, moduleId: currentModuleId);
    response.fold((l) {
      Navigator.pop(context);
      errorGetBar(AppTranslations.error);
      emit(FailureCheckCopouneState());
    }, (r) {
      debugPrint("code: ${r.status.toString()}");
      if (r.status != 200 && r.status != 201) {
        Navigator.pop(context);
        errorGetBar(r.msg!);
      } else {
        Navigator.pop(context);
        checkCopouneModel = r;

        emit(SuccessCheckCopouneState());
      }
    });
  }
  makeModelNull(){
    checkCopouneModel = CheckCopouneModel();
     emit(SuccessCheckCopouneState());
  }
}
// Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3RyYXZlbC50b3BidXNpbmVzcy5lYmhhcmJvb2suY29tL2FwaS92MS9sb2dpbi9nb29nbGUiLCJpYXQiOjE3MzY2Nzk4NzMsImV4cCI6MTc2ODIxNTg3MywibmJmIjoxNzM2Njc5ODczLCJqdGkiOiJha21ja3VoWFhKTFdhamNlIiwic3ViIjoiMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.uGiUcBdTaHcm_Wt1irBsXi6-FSp9Gf_n_uV505p43-M