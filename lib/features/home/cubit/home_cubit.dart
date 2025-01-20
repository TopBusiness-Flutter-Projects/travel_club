import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/utils/appwidget.dart';
import 'package:travel_club/features/auth/data/models/login_model.dart';
import 'package:travel_club/features/home/data/models/home_model.dart';
import '../data/repo/home_repo_impl.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(HomeInitial());
  HomeRepoImpl api;
  int moduleslenth = 5;
  GetHomeModel homeModel = GetHomeModel();
  getHomeData() async {
    emit(LoadingHomeData());
    final res = await api.getHome();
    res.fold((l) {
      emit(ErrorGetHomeData());
    }, (r) {
      homeModel = r;
      // getUserData();
      emit(SucessGetHomeData());
    });
  }

  int currentModuleId = 0;
  TextEditingController couponController = TextEditingController();
  // login
  LoginModel loginModel = LoginModel();
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
        loginModel = r;

        emit(SuccessCheckCopouneState());
      }
    });
  }
}
