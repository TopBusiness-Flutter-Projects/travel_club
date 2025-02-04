import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_club/core/exports.dart';

import '../../../../core/utils/app_colors.dart';
import '../../cubit/cubit.dart';
import '../../cubit/state.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_forward.dart';
import '../widgets/custom_title.dart';
import '../widgets/pin_put.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key, required this.isForget});
  bool isForget;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int secondsRemaining = 60;
  late Timer timer;
  //start time
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        setState(() {});
      }
    });
  }

  void disposeTimer() {
    timer.cancel();
  }

//reset pin
  void resetPin() {
    if (secondsRemaining == 0) {
      timer.cancel();
      secondsRemaining = 60; // Reset the timer
      context
          .read<LoginCubit>()
          .pinController
          .clear(); // 45Clear the PIN input// Stop the timer

      startTimer(); // Restart the timer
    }
  }

  @override
  void initState() {
    super.initState();

    startTimer();
    //   startTimer();
  }

  @override
  void dispose() {
    disposeTimer(); // Cancel the timer to avoid memory leaks
    context
        .read<LoginCubit>()
        .pinController
        .dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  void deactivate() {
    disposeTimer();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is OTPSentState) {
          resetPin();
        }
      },
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
                  CustomBackContainer(),
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
                            "00:${secondsRemaining.toString().padLeft(2, '0')}",
                            style: getMediumStyle(
                                fontSize: 14.sp,
                                color: AppColors.secondPrimary),
                          ),
                          SizedBox(width: 5.w),
                          GestureDetector(
                            onTap: () {
                              if (secondsRemaining == 0) {
                                widget.isForget
                                    ? cubit.forgetPassword(context,
                                        isResend: true)
                                    : cubit.register(context, isResend: true);
                              } else {
                                errorGetBar(
                                    "please wait ${secondsRemaining.toString()} seconds");
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
                            widget.isForget
                                ? cubit.validateOtp(context)
                                : cubit.checkOtp(context);
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
