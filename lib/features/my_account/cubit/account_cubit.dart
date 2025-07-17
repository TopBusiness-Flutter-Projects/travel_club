import 'package:easy_localization/easy_localization.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/preferences/preferences.dart';
import 'package:travel_club/core/utils/appwidget.dart';
import 'package:travel_club/core/utils/restart_app_class.dart';
import 'package:travel_club/features/auth/data/models/default_model.dart';
import 'package:travel_club/features/auth/data/models/login_model.dart';
import 'package:travel_club/features/home/cubit/home_cubit.dart';
import '../../maintenance_screen.dart';
import '../data/model/get_payment_types.dart';
import '../data/model/get_points_history.dart';
import '../data/model/get_setting_model.dart';
import '../data/repo/account_repo_impl.dart';
import 'account_state.dart';
import 'package:url_launcher/url_launcher.dart';


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
    context.setLocale(Locale(langCode));
    // Save the language preference
    Preferences.instance.savedLang(langCode);
    Preferences.instance.getSavedLang();
    //Restart.restartApp();

     HotRestartController.performHotRestart(context);
//Navigator.push(context, MaterialPageRoute(builder: (context) => const SplashScreen()));
    print("change lang and restart");

    emit(AccountLanguageChanged()); // Emit a new state to notify the UI

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
  GetPointsHistoryModel? getPointsHistoryModel ;
  getMyPointHistory() async {    
      emit(GetAccountLoading());
      final res = await api.getMyPointHistory();
      res.fold((l) {
        emit(GetAccountError());
      }, (r) {
          getPointsHistoryModel = r;        
      
        emit(GetAccountSuccess());
      });   
  }
  GetPaymentMethodsModel? getPaymentMethodsModel ;
  getPaymentMethods() async {    
      emit(GetAccountLoading());
      final res = await api.getPaymentMethods();
      res.fold((l) {
        emit(GetAccountError());
      }, (r) {
          getPaymentMethodsModel = r;        
      
        emit(GetAccountSuccess());
      });   
  }
  PaymentType ?selectedPaymentMethod;
changePaymentMethod(PaymentType paymentType) async {
    selectedPaymentMethod = paymentType;
    emit(GetAccountSuccess());  
}
String amountToPoints(){
  double amount = double.parse(amountController.text);
  double pointValue = 
   double.parse(
        loginModel.data?.pointValue.toString() ??
            "0");
  double points = amount * pointValue; // Assuming 1 point = 10 currency units
  return points.toStringAsFixed(0); // Convert to string with no decimal places
}
 addWhitelistPoints(BuildContext context) async {
    AppWidget.createProgressDialog(context, AppTranslations.loading);
    emit(GetAccountLoading());
    final res = await api.addWhitelistPoints(
        points: amountToPoints(),
        number:selectedPaymentMethod!.need!?ipanController.text: countryCode+ phonePointsController.text,
        paymentMethodId: selectedPaymentMethod!.id.toString());
    res.fold((l) {
      Navigator.pop(context);
      errorGetBar(AppTranslations.error);
      emit(GetAccountError());
    }, (r) {
      Navigator.pop(context);
      if (r.status == 200 || r.status == 201) {
        ipanController.clear();
        phonePointsController.clear();
        amountController.clear();
        selectedPaymentMethod = null;
        Navigator.pop(context);
        successGetBar(r.msg);
        getMyPointHistory() ;
        getUserData();
      } else if (r.status == 401 ||
          r.status == 407 ||
          r.status == 403 ||
          r.status == 422) {
        errorGetBar(r.msg ?? AppTranslations.error);
      }
      emit(GetAccountSuccess());
    });
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
  getSetting(BuildContext context) async {
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


    }, (r) async {
      getSettingModel = r;
      if (r.data?.appMentainance.toString() == 'true') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const MaintenanceScreen()));
      }
      await checkAndShowUpdateDialog(
      context: context,
      latestAndroidVersion: r.data?.androidAppVersion ?? "1.0.0",
      latestIosVersion: r.data?.iosAppVersion ?? "1.0.0",
      );
      emit(GetSettingSuccess());
    });
  }
  Future<void> checkAndShowUpdateDialog({
    required BuildContext context,
    required String latestAndroidVersion,
    required String latestIosVersion,
  }) async {
    // Get current app version info
    final packageInfo = await PackageInfo.fromPlatform();

    // Determine platform and latest version
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    final latestVersion = isIOS ? latestIosVersion : latestAndroidVersion;

    // Extract build numbers for comparison
    final currentBuild = int.tryParse(packageInfo.buildNumber) ?? 0;
    final latestBuild = extractBuildMetadata(latestVersion) ?? 0;

    // Debug prints (optional, can be removed)
    debugPrint('Current: ${packageInfo.version}+${packageInfo.buildNumber}');
    debugPrint('Latest: $latestVersion');

    // Check if update is needed
    final needsUpdate = !isCurrentVersionGreaterThanOrEqual(
      packageInfo.version,
      latestVersion,
      currentBuild,
      latestBuild,
    );

    if (needsUpdate) {
      _showUpdateDialog(context, latestVersion, packageInfo.packageName, isIOS);
    }
  }
  void _showUpdateDialog(
      BuildContext context,
      String latestVersion,
      String packageName,
      bool isIOS,
      ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title:  Row(
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.only(end: 8.0),
                  child: Icon(
                    Icons.tips_and_updates_rounded,
                    color: Colors.orange,
                  ),
                ),
                Flexible(child: Text("update_available".tr())),
              ],
            ),
            content: Text(
              'توجد نسخة جديدة ($latestVersion). يرجى التحديث إلى أحدث نسخة.',
            ),
            actions: <Widget>[
              TextButton(
                child: Text("upload_now".tr()),
                onPressed: () async {
                  final url = isIOS
                      ? 'https://apps.apple.com/app/idYOUR_APP_ID' // <-- Replace with your App Store ID
                      : 'https://play.google.com/store/apps/details?id=$packageName';
                  _launchUrl(url);
                },
              ),
            ],
          ),
        );
      },
    );
  }
  Future<void> _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
  int? extractBuildMetadata(String version) {
    final buildRegExp = RegExp(r'\+(\d+)$');
    final match = buildRegExp.firstMatch(version);
    return match != null ? int.parse(match.group(1)!) : null;
  }

  bool isCurrentVersionGreaterThanOrEqual(
      String currentVersion,
      String targetVersion,
      int currentBuildNumber,
      int targetBuildVersion,
      ) {
    final versionRegExp = RegExp(r'^(\d+)\.(\d+)\.(\d+)');
    final currentMatch = versionRegExp.firstMatch(currentVersion);
    final targetMatch = versionRegExp.firstMatch(targetVersion);

    if (currentMatch == null || targetMatch == null) {
      throw FormatException('invalid_version_format'.tr());
    }

    final currentMajor = int.parse(currentMatch.group(1)!);
    final currentMinor = int.parse(currentMatch.group(2)!);
    final currentPatch = int.parse(currentMatch.group(3)!);

    final targetMajor = int.parse(targetMatch.group(1)!);
    final targetMinor = int.parse(targetMatch.group(2)!);
    final targetPatch = int.parse(targetMatch.group(3)!);

    if (currentMajor > targetMajor) return true;
    if (currentMajor < targetMajor) return false;

    if (currentMinor > targetMinor) return true;
    if (currentMinor < targetMinor) return false;

    if (currentPatch > targetPatch) return true;
    if (currentPatch < targetPatch) return false;

    // If version numbers are equal, compare build numbers
    return currentBuildNumber >= targetBuildVersion;
  }
    String countryCode = '+20';
   TextEditingController phonePointsController = TextEditingController();

  TextEditingController amountController = TextEditingController();
  TextEditingController ipanController = TextEditingController();
}
// Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3RyYXZlbC50b3BidXNpbmVzcy5lYmhhcmJvb2suY29tL2FwaS92MS9sb2dpbi9nb29nbGUiLCJpYXQiOjE3MzY2Nzk4NzMsImV4cCI6MTc2ODIxNTg3MywibmJmIjoxNzM2Njc5ODczLCJqdGkiOiJha21ja3VoWFhKTFdhamNlIiwic3ViIjoiMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.uGiUcBdTaHcm_Wt1irBsXi6-FSp9Gf_n_uV505p43-M