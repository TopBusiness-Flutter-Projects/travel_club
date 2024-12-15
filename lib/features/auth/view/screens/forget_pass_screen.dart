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
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<LoginCubit>();
    return BlocBuilder<LoginCubit,LoginState>(builder: (BuildContext context, state) {  return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.white,
          body:
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key:cubit. formKeyForgetPass,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h,),
                  //custom container
                  CustomContainer(),
                  SizedBox(height: 30.h,),
                  //custom title and description
                  CustomTitle(title:"نسيت كلمه المرور",discreption: "ادخل رقم الهاتف المسجل لدينا وسوف يصلك رمز لاعاده تعين كلمه المرور",),
                  SizedBox(height: 30.h,),
                  //text field
                  CustomTextField(
                    controller: cubit.phoneControllerForgetPass,
                    enabled: true,
                    title: AppTranslations.phone,
                    hintText: AppTranslations.writePhone,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AppIcons.phone),
                    ),
                    validator: (value) {
                      // Check if the input matches a valid phone number format
                      final phoneRegex = RegExp(
                          r'^(?:\+20|0)\d{10}$'); // Regex for Egyptian phone numbers
                      if (value == null || value.isEmpty) {
                        return AppTranslations.phoneNumberIsRequired;
                      } else if (!phoneRegex.hasMatch(value)) {
                        return AppTranslations.pleaseEnterValidPhoneNumber;
                      }
                      return null; // valid phone number
                    },
                  ),
                  SizedBox(height: 30.h,),
                  //custom forward
                  Center(
                    child: CustomForward(onTap: (){
                      Navigator.pushNamed(context, Routes.newPass);
                    },),
                  )
                ],),
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
    ); },);
  }
}
