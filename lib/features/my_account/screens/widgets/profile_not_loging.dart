import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_club/core/exports.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/custom_button.dart';


class ProfileNotLoging extends StatelessWidget {
   ProfileNotLoging({super.key,this.title});
String ?title;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(  title!,style: TextStyle(color: AppColors.black,fontSize: 20.sp,fontWeight: FontWeight.w700),),
          ),
          SizedBox(height: 50.h,),
          Align(
            alignment: Alignment.center,
              child: Text(AppTranslations.notLogin,style: TextStyle(color: AppColors.black,fontSize: 18.sp,fontWeight: FontWeight.w600),)),
SizedBox(height: 50.h,),
          Center(child: Image.asset(ImageAssets.profileNotLogin)),
          SizedBox(height: 50.h,),
          CustomButton(title: AppTranslations.login,onTap:
    () {
        Navigator.pushNamed(context, Routes.loginRoute);
      },)
        ],),
    );
  }
}
