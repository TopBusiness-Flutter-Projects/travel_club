import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/utils/app_colors.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

import '../../cubit/cubit.dart';
import '../../cubit/state.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_forward.dart';
import '../widgets/custom_title.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  GlobalKey<FormState> formKeyForgetPass = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (BuildContext context, state) {
        return SafeArea(
          child: Scaffold(
              backgroundColor: AppColors.white,
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: formKeyForgetPass,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      //custom container
                      CustomBackContainer(),
                      SizedBox(
                        height: 30.h,
                      ),
                      //custom title and description
                      CustomTitle(
                        title: AppTranslations.forgetPassword,
                        discreption: AppTranslations.enterPhone,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      //text field
                      CustomPhoneFormField(
                        controller: cubit.phoneControllerForgetPass,
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
                      SizedBox(
                        height: 30.h,
                      ),
                      //custom forward
                      Center(
                        child: CustomForward(
                          onTap: () {
                            cubit.forgetPassword(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
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
