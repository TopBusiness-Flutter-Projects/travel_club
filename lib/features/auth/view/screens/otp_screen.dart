import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:travel_club/core/exports.dart';

import '../../../../core/utils/app_colors.dart';
import '../../cubit/cubit.dart';
import '../../cubit/state.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_forward.dart';
import '../widgets/custom_title.dart';
import '../widgets/pin_put.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key, required this.isPasss});
  bool isPasss;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LoginCubit>().startTimer();
    //   startTimer();
  }

  @override
  void dispose() {
    context
        .read<LoginCubit>()
        .timer
        .cancel(); // Cancel the timer to avoid memory leaks
    context
        .read<LoginCubit>()
        .pinController
        .dispose(); // Dispose of the controller
    super.dispose();
  }

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  // Custom container
                  CustomContainer(),
                  SizedBox(height: 30.h),
                  // Custom title and description
                  CustomTitle(
                    title: AppTranslations.activateAccount,
                    discreption: AppTranslations.codeSent,
                  ),
                  SizedBox(height: 30.h),
                  // PIN OTP
                  SizedBox(
                    height: 100.h,
                    width: double.infinity,
                    child: PinInputScreen(),
                  ),
                  SizedBox(height: 30.h),
                  // Custom forward
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Forget pass
                      Row(
                        children: [
                          Text(
                            "00:${cubit.secondsRemaining.toString().padLeft(2, '0')}",
                            style: getMediumStyle(
                                fontSize: 14.sp,
                                color: AppColors.secondPrimary),
                          ),
                          SizedBox(width: 5.w),
                          GestureDetector(
                            onTap: () {
                              if (cubit.secondsRemaining == 0) {
                                cubit.register(context, isResend: true);
                              } else {
                                errorGetBar(
                                    "please wait ${cubit.secondsRemaining.toString()} seconds");
                              }
                              // Reset timer and PIN when tapped
                            },
                            child: Text(
                              AppTranslations.sendAgain,
                              style: getUnderLine(
                                  fontSize: 14.sp,
                                  color: AppColors.primary,
                                  fontweight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      if (cubit.pinController.text.length > 5)
                        CustomForward(
                          onTap: () {
                            cubit.checkOtp(context);
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
