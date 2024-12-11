import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/utils/app_colors.dart';
import 'package:travel_club/features/auth/cubit/cubit.dart';
import 'package:travel_club/features/auth/cubit/state.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_forward.dart';
import '../widgets/custom_title.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
 return  BlocBuilder<LoginCubit,LoginState>(builder: (BuildContext context, state) {  return SafeArea(
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

               CustomTitle(title: AppTranslations.login,),
               SizedBox(height: 10.h,),
               CustomTextField(enabled:true,title: AppTranslations.phone,hintText: AppTranslations.writePhone,suffixIcon:
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: SvgPicture.asset(AppIcons.phone),
               )),
               CustomTextField(enabled:true,isPassword: true,title: AppTranslations.pass,hintText: AppTranslations.writePass,),
               SizedBox(height: 30.h,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("نسيت كلمة المرور ؟",style: getUnderLine(fontSize: 20,color: AppColors.white),),
                   CustomForward(onTap: (){
                     Navigator.pushNamed(context, Routes.newPass);
                   },),
                 ],
               )
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
   ); },);
  }
}
