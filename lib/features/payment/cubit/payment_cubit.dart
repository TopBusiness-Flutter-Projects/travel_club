import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/utils/appwidget.dart';
import 'package:travel_club/features/payment/data/models/check_payment_status_model.dart';
import 'package:travel_club/features/payment/screens/done_payment.dart';
import '../data/models/check_copoune_model.dart';
import '../data/repo/payment_repo_impl.dart';
import '../screens/payment_screen.dart';
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

  // GetPaymentUrlModel getPaymentUrlModel = GetPaymentUrlModel();
  getPaymentUrl(BuildContext context, {required int reservationId}) async {
    AppWidget.createProgressDialog(context, AppTranslations.loading);
    emit(LoadingCheckCopouneState());
    final response = await api.getPaymentUrl(
        reservationId: reservationId,
        code: checkCopouneModel.data == null ? "" : couponController.text,
        moduleId: currentModuleId);
    response.fold((l) {
      Navigator.pop(context);
      errorGetBar(AppTranslations.error);
      emit(FailureCheckCopouneState());
    }, (r) {
      debugPrint("code: ${r.status.toString()}");
      Navigator.pop(context);
      if (r.status != 200 && r.status != 201) {
        errorGetBar(r.msg!);
      } else {
        if (r.data?.paymentUrl != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentWebViewScreen(
                  url: "${r.data!.paymentUrl}",
                  reservationid: reservationId,
                ),
              ));
        }
        emit(SuccessCheckCopouneState());
      }
    });
  }
  CheckPaymentStatusModel checkPaymentStatusModel = CheckPaymentStatusModel();
  checkPaymentStatus(BuildContext context,
  {required int reservationId}
  ) async {
    AppWidget.createProgressDialog(context, AppTranslations.loading);
    emit(LoadingCheckCopouneState());
    final response = await api.checkPaymentStatus(
        reservationId: reservationId,
        code: checkCopouneModel.data == null ? "" : couponController.text,
        moduleId: currentModuleId);
    response.fold((l) {
      Navigator.pop(context);
      errorGetBar(AppTranslations.error);
      emit(FailureCheckCopouneState());
    }, (r) {
      debugPrint("code: ${r.status.toString()}");

      if (r.status != 200 && r.status != 201) {
        Navigator.pop(context);
          Navigator.pop(context);
        errorGetBar(r.msg??AppTranslations.error);
      } else {
          Navigator.pop(context);
        if (r.data != null ) {
          checkPaymentStatusModel = r;
          if (r.data!.status!) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => DonePaymentScreen(
                        paymentModel: r.data!,
                      )),
              (route) => false,
            );
          }
          else{
              Navigator.pop(context);
        errorGetBar(r.msg ??AppTranslations.error );
          }
        }else{
               Navigator.pop(context);
      errorGetBar(AppTranslations.error);
        }

        emit(SuccessCheckCopouneState());
      }
    });
  }

  makeCopouneNull() {
    checkCopouneModel = CheckCopouneModel();
    emit(SuccessCheckCopouneState());
  }
    //check privacy
  bool isChecked = false; 
  void checkPrivacy() {
    isChecked = !isChecked;
    emit(ChangePrivacyState());
  }
}
//Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3RyYXZlbC50b3BidXNpbmVzcy5lYmhhcmJvb2suY29tL2FwaS92MS9sb2dpbi9nb29nbGUiLCJpYXQiOjE3MzczNjMyOTksImV4cCI6MTc2ODg5OTI5OSwibmJmIjoxNzM3MzYzMjk5LCJqdGkiOiI2NmZsdkpSOFl5Z0hXWkFvIiwic3ViIjoiOSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjciLCJhdXRoX3V1aWQiOiI0MzcxNDhhZi1lNDE3LTRiY2EtYjgzMy1kNzYwMmE4NjIxMmEifQ.kX0HZDF2a1SPf52Qc5CjNES91sNoD9GxbTtFhxPmaYU
//"24.81834667943636","longitude":"46.340216992187486"