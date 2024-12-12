// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/preferences/preferences.dart';
import 'package:travel_club/core/utils/restart_app_class.dart';
import 'package:travel_club/features/main_screen/cubit/cubit.dart';
import 'package:travel_club/features/main_screen/cubit/state.dart';

import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    AccountCubit cubit = context.read<AccountCubit>();
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        return Center(
          child: InkWell(
              onTap: () {
                if (EasyLocalization.of(context)!.locale.languageCode == 'ar') {
                  EasyLocalization.of(context)!.setLocale(Locale('en', ''));
                  // Preferences.instance
                  //     .savedLang(AppStrings.englishCode);
                  // Preferences.instance.getSavedLang();
                  HotRestartController.performHotRestart(context);
                } else {
                  EasyLocalization.of(context)!.setLocale(Locale('ar', ''));
                  // Preferences.instance
                  //     .savedLang(AppStrings.arabicCode);
                  // Preferences.instance.getSavedLang();
                  HotRestartController.performHotRestart(context);
                }
              },
              child: Text('Language ')),
        );
      },
    );
  }
}