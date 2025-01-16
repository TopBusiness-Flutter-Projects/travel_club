import 'dart:io';

import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/core/widgets/custom_text_form_field.dart';
import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/custom_upload_image/cubit/upload_image_cubit.dart';
import 'package:travel_club/features/custom_upload_image/cubit/upload_image_state.dart';
import 'package:travel_club/features/residence/view/residence_booking/screens/widgets/custom_rounded_button.dart';

import '../../../core/exports.dart';
import '../../../core/widgets/custom_screen.dart';
import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AccountCubit>();
    var imageCubit = context.read<UploadImageCubit>();

    return BlocBuilder<AccountCubit, AccountState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
            appbarTitle: AppTranslations.personalData,
            body: SingleChildScrollView(
              child: Form(
                key: cubit.formInfo,
                child: Column(
                  children: [
                    SizedBox(
                      height: getVerticalPadding(context) * 1,
                    ),
                    //image
                    BlocBuilder<UploadImageCubit, UploadImageState>(
                        builder: (context, state) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: imageCubit.profileImage != null
                            ? Image.file(
                                File(imageCubit.profileImage!.path),
                                width: 75.w,
                                height: 75.h,
                                fit: BoxFit.cover,
                              )
                            : CustomNetworkImage(
                            image:  cubit.loginModel.data?.image ?? "",
                              width: 75.w,
                              height: 75.h,
                              isUser: true,
                              
                            ),
                      );
                    }),
                    SizedBox(
                      height: getVerticalPadding(context) * 1,
                    ),
                    //rounded button
                    CustomRoundedButton(
                      title: AppTranslations.changeImage,
                      width: 195.w,
                      height: 41.h,
                      onTap: () {
                        imageCubit.showImageSourceDialog(context);
                      },
                    ),
                    SizedBox(
                      height: getVerticalPadding(context) * 1,
                    ),
                    //name
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
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    //phone
                    CustomTextField(
                      controller: cubit.phoneController,
                      enabled: false,
                      title: AppTranslations.phone,
                      hintText: AppTranslations.writePhone,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(AppIcons.phone),
                      ),
                    ),

                    //custom button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        title: AppTranslations.savedChanges,
                        onTap: () {},
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.updatePassword);
                      },
                      child: Text(
                        AppTranslations.changePassword,
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
            ));
      },
    );
  }
}
