import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/auth/cubit/cubit.dart';
import 'package:travel_club/features/auth/cubit/state.dart';
import '../../../../core/widgets/custom_skip_row.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../widgets/custom_forward.dart';
import '../widgets/custom_title.dart';
import '../widgets/show_terms_bottom_sheet.dart';
import '../widgets/social_login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
   GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (BuildContext context, state) {
        return SafeArea(
          child: Scaffold(
            body: Form(
              key: formKeySignUp,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    //skip
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 83.w, // Adjust size as needed
                        height: 36.h,
                        decoration: BoxDecoration(
                          color: AppColors.lightWhite,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(
                              15.r), // Circular with rounded corners
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios,
                                  color: AppColors.grey,
                                ),
                                Text(
                                  AppTranslations.back,
                                  style: getSemiBoldStyle(
                                      color: AppColors.grey, fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 10.w),
                    //   child: CustomSkipRow(
                    //       onTap:(){}, backgroundColor: AppColors.yellow),
                    // ),
                    // CustomContainer(),
                    SizedBox(
                      height: 10.h,
                    ),
                    //title
                    CustomTitle(
                      title: AppTranslations.signUp,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextField(
                        controller: cubit.nameController,
                        enabled: true,
                        title: AppTranslations.fullName,
                        hintText: AppTranslations.writeFullName,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AppIcons.profile),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppTranslations.writeFullName;
                          }
                          return null;
                        }),
                    CustomPhoneFormField(
                      controller: cubit.phoneController,
                      initialValue: cubit.countryCode,
                      title: AppTranslations.phone,
                      onCountryChanged: (v) {
                        cubit.countryCode = '+${v.fullCountryCode}';
                        print("Country changed to: ${v.name}");
                      },
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),

                    CustomTextField(
                      controller: cubit.passwordControllerSignUp,
                      enabled: true,
                      isPassword: true,
                      title: AppTranslations.pass,
                      hintText: AppTranslations.writePass,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return AppTranslations.passIsRequired;
                        } else if (v.length < 8) {
                          return AppTranslations.passLength;
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: cubit.confirmPasswordControllerSignUp,
                      enabled: true,
                      isPassword: true,
                      title: AppTranslations.confirmPassword,
                      hintText: AppTranslations.enterPasswordAgain,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return AppTranslations.passIsRequired;
                        } else if (v != cubit.passwordControllerSignUp.text) {
                          return AppTranslations.passNotMatch;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    //forward
                    Center(
                      child: CustomForward(
                        onTap: () {
                          if (formKeySignUp.currentState!.validate()) {
                            cubit.register(context);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
//social
                    SocialLoginRow(),
                    SizedBox(
                      height: 20.h,
                    ),
                    //terms
                    Column(
                      children: [
                        Center(
                            child: Text(AppTranslations.termsAndConditions,
                                style: getMediumStyle(fontSize: 12.sp))),
                        SizedBox(
                          height: 5.h,
                        ),
                        GestureDetector(
                            onTap: () {
                              showTermsBottomSheet(context);
                            },
                            child: Center(
                                child: Text(AppTranslations.terms,
                                    style: getMediumStyle(
                                        fontSize: 12.sp,
                                        color: AppColors.primary)))),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // Center(
            //   child: ElevatedButton(
            //       onPressed: () {
            //         Navigator.pushReplacementNamed(context, Routes.mainRoute);
            //       },
            //       child: const Text('Nav To Main Screen')),
            // ),
          ),
        );
      },
    );
  }
}
