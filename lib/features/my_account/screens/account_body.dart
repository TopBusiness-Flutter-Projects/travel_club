import 'dart:io';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/auth/cubit/cubit.dart';
import 'package:travel_club/features/my_account/screens/widgets/custom_container.dart';
import 'package:travel_club/features/my_account/screens/widgets/custom_row.dart';
import '../../home/screens/widgets/custom_appbar.dart';
import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';

class Accountbody extends StatefulWidget {
  const Accountbody({
    super.key,
  });
  @override
  State<Accountbody> createState() => _AccountbodyState();
}

class _AccountbodyState extends State<Accountbody> {
  @override
  Widget build(BuildContext context) {
    AccountCubit cubit = context.read<AccountCubit>();
    return BlocBuilder<AccountCubit, AccountState>(builder: (context, state) {
      return Column(children: [
        SizedBox(height: getVerticalPadding(context) * 2),
        //app bar
        CustomHomeAppbar(
          isHome: false,
          title: AppTranslations.myAccount,
        ),
        // SizedBox(height: 10.h,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //custom container above list view
                if(AppConst.isLogged==true)...[
              CustomContainerMyAccount(),
                ],
//list view
                SizedBox(height: 20.h,),

                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    // crossAxisAlignment:   CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 30.h,),
                      if(AppConst.isLogged==true)...[
                        CustomRowProfile(
                          title: AppTranslations.personalData,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.profileInfo);
                          },
                        ),      ],

                      CustomRowProfile(
                        title: AppTranslations.changeLang,
                        onTap: () {
                          Navigator.pushNamed(context, Routes.changeLanguage);
                        },
                      ),
                      CustomRowProfile(
                        title: AppTranslations.contactUs,
                        onTap: () {
                          Navigator.pushNamed(context, Routes.contact);
                        },
                      ),
                      CustomRowProfile(
                        title: AppTranslations.aboutUs,
                        onTap: () {
                          Navigator.pushNamed(context, Routes.aboutUs);
                        },
                      ),
                      CustomRowProfile(
                        title: AppTranslations.PrivacyAndSecurity,
                        onTap: () {
                          Navigator.pushNamed(context, Routes.privacyRoute);
                        },
                      ),
                      CustomRowProfile(
                        title: AppTranslations.shareApp,
                        onTap: () async {
                          PackageInfo packageInfo =
                              await PackageInfo.fromPlatform();
                          String url = '';
                          String packageName = packageInfo.packageName;
                          if (Platform.isAndroid) {
                            url =
                                "https://play.google.com/store/apps/details?id=$packageName";
                          } else if (Platform.isIOS) {
                            url = 'https://apps.apple.com/us/app/$packageName';
                          }
                          await Share.share(url);
                        },
                      ),
                      CustomRowProfile(
                        title:AppConst.isLogged? AppTranslations.logout:AppTranslations.login,
                        onTap: () {
                          context.read<LoginCubit>().logout(context);
                        },
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      //  SizedBox(height: 100.h,),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ]);
    });
  }
}
