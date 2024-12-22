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
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<LoginCubit>();
    return  BlocBuilder<LoginCubit,LoginState>(builder: (BuildContext context, state) {  return SafeArea(
      child: Scaffold(
        body:
        Form(
          key: cubit.formKeySignUp,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,),
                //skip
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: CustomSkipRow(
                      onTap:(){}, backgroundColor: AppColors.yellow),
                ),
                // CustomContainer(),
                SizedBox(height: 10.h,),
                //title
                CustomTitle(title: AppTranslations.signUp,),
                SizedBox(height: 10.h,),
                CustomTextField(controller: cubit.nameController,enabled:true,title: AppTranslations.fullName,hintText: AppTranslations.writeFullName,suffixIcon:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(AppIcons.profile),
                ), validator: (value) {
                  // Check if the input matches a valid phone number format
                  final phoneRegex = RegExp(r'^(?:\+20|0)\d{10}$');  // Regex for Egyptian phone numbers
                  if (value == null || value.isEmpty) {
                    return AppTranslations.phoneNumberIsRequired;
                  } else if (!phoneRegex.hasMatch(value)) {
                    return AppTranslations.pleaseEnterValidPhoneNumber;
                  }
                  return null; // valid phone number
                },),
                CustomTextField(controller: cubit.phoneControllerSignUp,enabled:true,title: AppTranslations.phone,hintText: AppTranslations.writePhone,suffixIcon:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(AppIcons.phone),
                ), validator: (value) {},
                ),

                CustomTextField(controller: cubit.passwordControllerSignUp,enabled:true,isPassword: true,title: AppTranslations.pass,hintText: AppTranslations.writePass,),
                SizedBox(height: 30.h,),
                //forward
                Center(
                  child: CustomForward(onTap: (){
                   //  if(cubit.formKeySignUp.currentState!.validate()){
                   // //   Navigator.pushNamed(context, Routes.newPass);
                   //    Navigator.pushNamed(context, Routes.otpScreen);
                   //  }
                    Navigator.pushNamed(context, Routes.otpScreen,arguments:false);

                  },),
                ),
                SizedBox(height: 30.h,),
//social
                SocialLoginRow(),
                SizedBox(height: 20.h,),
             //terms
             Column(

               children: [
               Center(child: Text(AppTranslations.termsAndConditions,style: getMediumStyle(fontSize: 12.sp))),
               SizedBox(height: 5.h,),
               GestureDetector(
                 onTap: (){
                   showTermsBottomSheet(context);
                 },
                   child: Center(child: Text(AppTranslations.terms,style: getMediumStyle(fontSize: 12.sp,color: AppColors.primary))))
             ],)

              ],),
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
    ); },);
  }
}
