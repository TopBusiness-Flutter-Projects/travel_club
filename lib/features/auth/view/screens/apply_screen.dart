import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:travel_club/features/auth/cubit/cubit.dart';
import 'package:travel_club/features/auth/cubit/state.dart';
import 'package:travel_club/features/auth/view/widgets/custom_forward.dart';
import '../../../../core/exports.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class ApplyScreen extends StatefulWidget {
  const ApplyScreen({super.key});

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();

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
              CustomForward(
                onTap: () {
                  AwesomeDialog(
                      closeIcon: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            cubit.codeController.clear();
                          },
                          child: Icon(Icons.close)),
                      showCloseIcon: true,
                      dialogBackgroundColor: AppColors.white,
                      context: context,
                      customHeader: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          ImageAssets.logoImage,
                        ),
                      ),
                      animType: AnimType.topSlide,
                      //   showCloseIcon: true,
                      body: BlocBuilder<LoginCubit, LoginState>(
                        builder: (BuildContext context, state) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                AppTranslations.enterCodeToGetPoints,
                                style: getRegularStyle(fontSize: 16.sp),
                              ),
                              CustomTextField(
                                onChanged: (value) {
                                  cubit.changeCode(value);
                                },
                                controller: cubit.codeController,
                                keyboardType: TextInputType.number,
                                hintText: AppTranslations.enterCode,
                              ),
                              Row(children: [
                                Expanded(
                                  child: CustomButton(
                                    title: AppTranslations.skip,
                                    isBordered: true,
                                    onTap: () {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          Routes.mainRoute, (route) => false);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                if (cubit.codeController.text.isNotEmpty)
                                  Expanded(
                                    child: CustomButton(
                                      title: AppTranslations.next,
                                      onTap: () {
                                        cubit.acceptReferral(context,
                                            code: cubit.codeController.text);
                                      },
                                    ),
                                  ),
                              ])
                            ],
                          );
                        },
                      )).show();
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
