import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/utils/app_colors.dart';
import 'package:travel_club/features/auth/cubit/cubit.dart';
import 'package:travel_club/features/auth/cubit/state.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/custom_skip_row.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../widgets/custom_forward.dart';
import '../widgets/custom_title.dart';
import '../widgets/social_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
 @override
  void initState() {
context.read<LoginCubit>().signOutFromGmail();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (BuildContext context, state) {
        return SafeArea(
          child: Scaffold(
            //  backgroundColor: AppColors.white,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKeyLogin,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: CustomSkipRow(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(context, Routes.mainRoute , (route) => false,);
                            },
                            backgroundColor: AppColors.yellow),
                      ),
                      // CustomContainer(),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTitle(
                        title: AppTranslations.login,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomPhoneFormField(
                        controller: cubit.phoneController,
                        initialValue: cubit.countryCode,
                        title: AppTranslations.phone,
                        onCountryChanged: (v) {
                          cubit.countryCode = '+${v.fullCountryCode}';
                          print("Country changed to: ${v.name}");
                        },
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                      CustomTextField(
                        controller: cubit.passwordControllerLogin,
                        enabled: true,
                        isPassword: true,
                        title: AppTranslations.pass,
                        hintText: AppTranslations.writePass,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //forget pass
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.forgetPass);
                            },
                            child: Text(
                              AppTranslations.forgetPass,
                              style: getUnderLine(
                                  fontSize: 14.sp,
                                  color: AppColors.primary,
                                  fontweight: FontWeight.w500),
                            ),
                          ),
                          CustomForward(
                            onTap: () {
                              if (formKeyLogin.currentState!.validate()) {
                                cubit.login(context);
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SocialLoginRow(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppTranslations.havenotAccount,
                            style: getSemiBoldStyle(
                                color: AppColors.secondPrimary,
                                fontSize: 14.sp),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.signUp);
                              },
                              child: Text(
                                AppTranslations.createNewAccount,
                                style: getUnderLine(
                                  fontSize: 14.sp,
                                  color: AppColors.primary,
                                  fontweight: FontWeight.w500,
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            // Center(
            //   child: ElevatedButton(
            //       onPressed: () {
            //         Navigator.pushReplacementNamed(context, Routes.mainRoute);
            //       },
            //       child: const Text('Nav To Main Screen')),
            // ),
          ),
        );
      },
    );
  }
}
