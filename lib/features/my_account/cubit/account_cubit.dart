import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/preferences/preferences.dart';
import 'package:travel_club/core/utils/appwidget.dart';
import 'package:travel_club/core/utils/restart_app_class.dart';
import 'package:travel_club/features/auth/data/models/default_model.dart';
import 'package:travel_club/features/auth/data/models/login_model.dart';
import 'package:travel_club/features/home/cubit/home_cubit.dart';
import '../data/model/get_setting_model.dart';
import '../data/repo/account_repo_impl.dart';
import 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this.api) : super(AccountInitial());
  AccountRepoImpl api;
  late TextEditingController nameController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController currentPassController = TextEditingController();
  late TextEditingController newpassController = TextEditingController();
  late TextEditingController confirmPassController = TextEditingController();
  //controller in account screen
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
DefaultPostModel ?defaultPostModel;
  late TextEditingController subjectController = TextEditingController();
  late TextEditingController messageController = TextEditingController();
  contactUs(BuildContext context, ) async {
    AppWidget.createProgressDialog(context, AppTranslations.loading);
    emit(GetAccountLoading());
    final res = await api.contactUs(
  subject:subjectController.text,
        message: messageController.text,
        moduleId:context.read<HomeCubit>().moduleId.toString()
    );
    res.fold((l) {
      Navigator.pop(context);
      errorGetBar(AppTranslations.error);
      emit(GetAccountError());
    }, (r) {
      Navigator.pop(context);
      if (r.status == 200 || r.status == 201) {
        defaultPostModel = r;
        subjectController.clear();
        messageController.clear();
        successGetBar(r.msg);
      } else if (r.status == 401 || r.status == 407 || r.status == 403) {
        errorGetBar(r.msg ?? AppTranslations.error);
      }

      emit(GetAccountSuccess());
    });
  }

  // String? selectedLanguage = 'Arabic';
  // First, let's update the changeLanguage method to handle all languages
  void changeLanguage(BuildContext context, String newLanguage) {
    // selectedLanguage = newLanguage; // Update the selected language

    // Map of language display names to their codes
    final Map<String, String> languageCodes = {
      'Arabic': 'ar',
      'English': 'en',
      'German': 'de',
      'Italian': 'it',
      'Korean': 'ko',
      'Russian': 'ru',
      'Spanish': 'es'
    };

    // Get the language code from the map
    final String langCode = languageCodes[newLanguage] ?? 'en';

    // Set the locale
    context.setLocale(Locale(langCode, ''));

    // Save the language preference
    Preferences.instance.savedLang(langCode);

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

  updateUserData(BuildContext context, {String? imagePath}) async {
    AppWidget.createProgressDialog(context, AppTranslations.loading);
    emit(GetAccountLoading());
    final res = await api.updateUserData(
        name: nameController.text, imagePath: imagePath);
    res.fold((l) {
      Navigator.pop(context);
      errorGetBar(AppTranslations.error);
      emit(GetAccountError());
    }, (r) {
      Navigator.pop(context);
      if (r.status == 200 || r.status == 201) {
        loginModel = r;
        if (r.data != null) {
          nameController.text = r.data!.name!;
        }
        successGetBar(r.msg);
      } else if (r.status == 401 || r.status == 407 || r.status == 403) {
        errorGetBar(r.msg ?? AppTranslations.error);
      }

      emit(GetAccountSuccess());
    });
  }

  updatePassword(BuildContext context) async {
    AppWidget.createProgressDialog(context, AppTranslations.loading);
    emit(GetAccountLoading());
    final res = await api.updatepassword(
        currentPassword: currentPassController.text,
        newPassword: newpassController.text);
    res.fold((l) {
      Navigator.pop(context);
      errorGetBar(AppTranslations.error);
      emit(GetAccountError());
    }, (r) {
      Navigator.pop(context);
      if (r.status == 200 || r.status == 201) {
        currentPassController.clear();
        newpassController.clear();
        confirmPassController.clear();
        Navigator.pop(context);
        successGetBar(r.msg);
      } else if (r.status == 401 ||
          r.status == 407 ||
          r.status == 403 ||
          r.status == 422) {
        errorGetBar(r.msg ?? AppTranslations.error);
      }
      emit(GetAccountSuccess());
    });
  }
  //get setting
  GetSettingModel getSettingModel = GetSettingModel();
  getSetting() async {
    //getSettingModel = GetMenuMealsModel();
    emit(GetSettingLoading());
    final res =
    await api.getSetting();
    res.fold((l) {
      if (l is ServerFailure) {
        emit(GetSettingError(error:"server_error_occurred".tr()));
      } else {
        emit(GetSettingError(error:"unKnown_error_occurred".tr()));
      }

    }, (r) {
      getSettingModel = r;

      emit(GetSettingSuccess());
    });
  }
}
// Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3RyYXZlbC50b3BidXNpbmVzcy5lYmhhcmJvb2suY29tL2FwaS92MS9sb2dpbi9nb29nbGUiLCJpYXQiOjE3MzY2Nzk4NzMsImV4cCI6MTc2ODIxNTg3MywibmJmIjoxNzM2Njc5ODczLCJqdGkiOiJha21ja3VoWFhKTFdhamNlIiwic3ViIjoiMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.uGiUcBdTaHcm_Wt1irBsXi6-FSp9Gf_n_uV505p43-M