import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/core/widgets/custom_text_form_field.dart';
import 'package:travel_club/features/accommodation/view/booking_accommodation/screens/widgets/custom_rounded_button.dart';

import '../../../core/exports.dart';
import '../../../core/widgets/custom_screen.dart';
import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<AccountCubit>();
   return BlocBuilder<AccountCubit, AccountState>(builder: (BuildContext context, state) {  return
     CustomScreen(
     appbarTitle: AppTranslations.personalData,
     body: Form(
       key: cubit.formInfo,
       child: Column(

         children: [
           SizedBox(height: getVerticalPadding(context) * 1,),
           //image
           Container(
             width: 75.w, // Adjust size as needed
             height: 75.h,
             decoration: BoxDecoration(
               color: AppColors.lightWhite,
               shape: BoxShape.rectangle,
               borderRadius: BorderRadius.circular(15.r), ),
             child: Image.asset(ImageAssets.profile),),
           SizedBox(height: getVerticalPadding(context) * 1,),
           //rounded button
           CustomRoundedButton(title: "تغيير صورة البروفايل",width: 195.w,height:41 .h,onTap: (){},),
           SizedBox(height: getVerticalPadding(context) * 1,),
//name
           CustomTextField(controller: cubit.nameController,enabled:true,title: AppTranslations.fullName,hintText: AppTranslations.writeFullName,suffixIcon:
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: SvgPicture.asset(AppIcons.profile),
           ), validator: (value) {
           },),
           //phone
           CustomTextField(controller: cubit.phoneController,enabled:true,title: AppTranslations.phone,hintText: AppTranslations.writePhone,suffixIcon:
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: SvgPicture.asset(AppIcons.phone),
           ), validator: (value) {
            // Check if the input matches a valid phone number format
             final phoneRegex = RegExp(r'^(?:\+20|0)\d{10}$');  // Regex for Egyptian phone numbers
             if (value == null || value.isEmpty) {
               return AppTranslations.phoneNumberIsRequired;
             } else if (!phoneRegex.hasMatch(value)) {
               return AppTranslations.pleaseEnterValidPhoneNumber;
             }
             return null; // valid
           },
           ),
           //passs
           CustomTextField(ischange: true,controller: cubit.passController,enabled:true,isPassword: true,title: AppTranslations.pass,hintText: AppTranslations.writePass,suffixIcon: Icon(Icons.add),),
           //custom button
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: CustomButton(title: AppTranslations.savedChanges,onTap: (){
               Navigator.pushNamed(context, Routes.changeLanguage);
             },),
           )
         ],
       ),
     )
   ); },);
  }
}
