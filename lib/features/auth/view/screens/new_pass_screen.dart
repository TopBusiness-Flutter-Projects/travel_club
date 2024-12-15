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


class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<LoginCubit>();
  return BlocBuilder<LoginCubit,LoginState>(builder: (BuildContext context, state) {  return SafeArea(
     child: Scaffold(
         backgroundColor: AppColors.white,
         body:
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Form(
             key: cubit.formKeyNewPass,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 SizedBox(height: 10.h,),

                 CustomContainer(),
                 SizedBox(height: 10.h,),

                 CustomTitle(title: AppTranslations.writeNewPass,),
                 SizedBox(height: 10.h,),
                 CustomTextField(enabled:true,isPassword: true,title: AppTranslations.newPass,hintText: AppTranslations.writeNewPass,),
                 CustomTextField(enabled:true,isPassword: true,title: AppTranslations.confirmNewPass,hintText: AppTranslations.writeNewPass,),
                 SizedBox(height: 30.h,),
                 Center(
                   child: CustomForward(onTap: (){
                     Navigator.pushNamed(context, Routes.otpScreen,arguments:true);
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
