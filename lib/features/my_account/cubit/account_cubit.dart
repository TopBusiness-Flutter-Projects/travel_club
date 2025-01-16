import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/preferences/preferences.dart';
import 'package:travel_club/core/utils/restart_app_class.dart';
import 'package:travel_club/features/auth/data/models/login_model.dart';
import '../data/repo/account_repo_impl.dart';
import 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this.api) : super(AccountInitial());
  AccountRepoImpl api;
  GlobalKey<FormState> formInfo = GlobalKey<FormState>();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController passController = TextEditingController();
  late TextEditingController newpassController = TextEditingController();
  late TextEditingController confirmPassController = TextEditingController();
  String? selectedLanguage = 'Arabic';
  void changeLanguage(BuildContext context, String newLanguage) {
    selectedLanguage = newLanguage; // Update the selected language
    if (newLanguage == 'Arabic') {
      context.setLocale(const Locale('ar', ''));
      Preferences.instance.savedLang(AppStrings.arabicCode);
    } else {
      context.setLocale(const Locale('en', ''));
      Preferences.instance.savedLang(AppStrings.englishCode);
    }
    emit(AccountLanguageChanged()); // Emit a new state to notify the UI
    Preferences.instance.getSavedLang();
    HotRestartController.performHotRestart(context);
  }

  LoginModel loginModel = LoginModel();
  getUserData() async {
    if (AppConst.isLogged) {
      emit(GetAccountLoading());
      final res = await api.getUserData();
      res.fold((l) {
        emit(GetAccountError());
      }, (r) {
        if (r.status == 200 || r.status == 201) {
          loginModel = r;
          if (r.data != null) {
            nameController.text = r.data!.name!;
            phoneController.text = r.data!.phone.toString();
          }
        } else if (r.status == 401 || r.status == 407 || r.status == 403) {
          prefs.setBool("ISLOGGED", false);
          Preferences.instance.clearUser();
        }

        emit(GetAccountSuccess());
      });
    }
  }
}
// Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3RyYXZlbC50b3BidXNpbmVzcy5lYmhhcmJvb2suY29tL2FwaS92MS9sb2dpbi9nb29nbGUiLCJpYXQiOjE3MzY2Nzk4NzMsImV4cCI6MTc2ODIxNTg3MywibmJmIjoxNzM2Njc5ODczLCJqdGkiOiJha21ja3VoWFhKTFdhamNlIiwic3ViIjoiMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.uGiUcBdTaHcm_Wt1irBsXi6-FSp9Gf_n_uV505p43-M