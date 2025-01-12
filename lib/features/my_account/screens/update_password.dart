import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/core/widgets/custom_text_form_field.dart';
import 'package:travel_club/features/accommodation/view/booking_accommodation/screens/widgets/custom_rounded_button.dart';

import '../../../core/exports.dart';
import '../../../core/widgets/custom_screen.dart';
import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';

class UpdatePassword extends StatelessWidget {
  const UpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formPass = GlobalKey<FormState>();

    var cubit = context.read<AccountCubit>();
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
            appbarTitle: AppTranslations.changePassword,
            body: SingleChildScrollView(
              child: Form(
                key: formPass,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getVerticalPadding(context) * 2,
                      ),
                      CustomTextField(
                        enabled: true,
                        isPassword: true,
                        title: AppTranslations.currentPassword,
                        hintText: AppTranslations.writePass,
                        controller: cubit.passController,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return AppTranslations.passIsRequired;
                          } else if (v.length < 8) {
                            return AppTranslations.passLength;
                          }
                          return null;
                        },
                      ),
                      20.h.verticalSpace,
                      CustomTextField(
                        enabled: true,
                        isPassword: true,
                        title: AppTranslations.newPass,
                        hintText: AppTranslations.writeNewPass,
                        controller: cubit.newpassController,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return AppTranslations.passIsRequired;
                          } else if (v.length < 8) {
                            return AppTranslations.passLength;
                          }
                          return null;
                        },
                      ),
                      20.h.verticalSpace,
                      CustomTextField(
                        enabled: true,
                        isPassword: true,
                        title: AppTranslations.confirmNewPass,
                        hintText: AppTranslations.writeNewPass,
                        controller: cubit.confirmPassController,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return AppTranslations.passIsRequired;
                          } else if (v != cubit.newpassController.text) {
                            return AppTranslations.passNotMatch;
                          }
                          return null;
                        },
                      ),
                      60.h.verticalSpace,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                          title: AppTranslations.savedChanges,
                          onTap: () {},
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.forgetPass);
                        },
                        child: Text(
                          AppTranslations.forgetPassword,
                          style: getUnderLine(
                              color: AppColors.primary, fontSize: 14.sp),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
