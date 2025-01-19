import 'dart:ui';

import 'package:travel_club/features/auth/cubit/cubit.dart';
import 'package:travel_club/features/auth/cubit/state.dart';
import 'package:travel_club/features/auth/view/widgets/custom_forward.dart';
import 'package:travel_club/features/main_screen/cubit/cubit.dart';

import '../../../../core/exports.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class ApplyScreen extends StatelessWidget {
  const ApplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    TextEditingController codeController = TextEditingController();

    return BlocBuilder<LoginCubit, LoginState>(
        builder: (BuildContext context, state) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: SvgPicture.asset(AppIcons.correctGreen)),
              SizedBox(
                height: 10.h,
              ),
              Text(
                AppTranslations.accountActivated,
                style: getSemiBoldStyle(
                  fontSize: 20.sp,
                  color: AppColors.green,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Text(
                  AppTranslations.thankYou + AppTranslations.allFeatures,
                  style: getMediumStyle(
                    fontSize: 14.sp,
                    color: AppColors.grey,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                controller: codeController,
                keyboardType: TextInputType.number,
                title: AppTranslations.enterCode,
                hintText: "",
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomForward(
                onTap: () {
                  if (codeController.text.isEmpty) {
                    showDialog(
                        context: context,
                        barrierColor: AppColors.primary.withOpacity(0.1),
                        builder: (_) {
                          return BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Dialog(
                              elevation: 0,
                              backgroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 15,
                                          top: 35,
                                          left: 15,
                                          right: 15),
                                      child: Text(
                                        AppTranslations.areYouSure,
                                        textAlign: TextAlign.center,
                                        style: getMediumStyle(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: getHeightSize(context) * 0.03,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: CustomButton(
                                              onTap: () {
                                                Navigator.pop(context, false);
                                              },
                                              title: AppTranslations
                                                  .backToEnterCode,
                                            ),
                                          ),
                                          10.w.horizontalSpace,
                                          Expanded(
                                            child: CustomButton(
                                              isBordered: true,
                                          
                                              onTap: () {
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                        context,
                                                        Routes.mainRoute,
                                                        (route) => false);
                                              },
                                              title: AppTranslations
                                                  .finishWithoutCode,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: getHeightSize(context) * 0.01,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    cubit.acceptReferral(context, code: codeController.text);
                  }
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
