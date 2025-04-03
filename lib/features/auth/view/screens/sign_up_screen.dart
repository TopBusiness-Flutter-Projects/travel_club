import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/auth/cubit/cubit.dart';
import 'package:travel_club/features/auth/cubit/state.dart';
import 'package:travel_club/features/auth/view/widgets/custom_container.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../widgets/custom_forward.dart';
import '../widgets/custom_title.dart';
import '../../../../core/widgets/custom_terms_and_conditions.dart';
import '../widgets/social_login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  @override
  void initState() {
context.read<LoginCubit>().signOutFromGmail();
    super.initState();
  }
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
                child: Padding(
              padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                     CustomBackContainer(),
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
                          controller: cubit.nameController,                        textInputAction: TextInputAction.next,

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
                        enabled: true,                        textInputAction: TextInputAction.next,

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
                          CustomTermsAndConditionsText(terms: "dasdsa",),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      )
                    ],
                  ),
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

