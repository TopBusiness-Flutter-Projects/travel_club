import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_club/core/exports.dart';

import '../../../../core/utils/app_colors.dart';
import '../../cubit/cubit.dart';
import '../../cubit/state.dart';

void showTermsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
useSafeArea: true,
    // showDragHandle: true,
   // enableDrag: true,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
   return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
  return Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    children: [
      SingleChildScrollView(
        child: Column(
mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 79.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.samawy, // هنا يمكنك تغيير اللون
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

        SizedBox(height: 16.h),
        Text(
        "الشروط والأحكام",
        style:getSemiBoldStyle( fontSize: 20.sp,color: AppColors.blue)
        ),
        SizedBox(height: 16),
        Text(
        "خسائر اللازمة ومطالبة حدة بل، الذكر الحلفاء أن غزو. اجعل وقامت عدد مع ظهر معركة الأمريكي، انه. بربع الإثنان الحقبة في، انتهت المحور حيث و هذه ما طرفاً عالمية استسلام. المضي بتخصيص حين بل، وفتح الصرب الصفحة كل غزو. أسر كافة الاستئناف بل، وبعض وتزويد الصفحة غزو كل ثم تعداد الجنوب.",
        style:getMediumStyle(fontSize: 14.sp,color: AppColors.secondPrimary))

        ],
        ),
      ),
    ],
  ),
  );
    },
  );
}
  );}