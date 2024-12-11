import 'package:flutter/material.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/utils/app_colors.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_forward.dart';
import '../../widgets/custom_title.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: AppColors.white,
        body:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,),

                CustomContainer(),
                SizedBox(height: 10.h,),

                CustomTitle(title: AppTranslations.writeNewPass,),
                SizedBox(height: 10.h,),
                CustomTextField(enabled:true,isPassword: true,title: "كلمة المرور الجديدة",),
                CustomTextField(enabled:true,isPassword: true,title: "تاكيد كلمه المرور الجديدة",),
                CustomForward()
            ],),
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
  }
}
