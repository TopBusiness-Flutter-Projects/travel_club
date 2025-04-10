import 'dart:io';

import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/core/widgets/custom_text_form_field.dart';
import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/custom_upload_image/cubit/upload_image_cubit.dart';
import 'package:travel_club/features/custom_upload_image/cubit/upload_image_state.dart';
import 'package:travel_club/features/residence/view/residence_booking/widgets/custom_rounded_button.dart';

import '../../../core/exports.dart';
import '../../../core/widgets/custom_screen.dart';
import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  void initState() {
    context.read<UploadImageCubit>().profileImage = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formInfo = GlobalKey<FormState>();

    var cubit = context.read<AccountCubit>();
    var imageCubit = context.read<UploadImageCubit>();

    return BlocBuilder<AccountCubit, AccountState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
            appbarTitle: AppTranslations.personalData,
            body: SingleChildScrollView(
              child: Form(
                key: formInfo,
                child: Column(
                  children: [
                    SizedBox(
                      height: getVerticalPadding(context) * 1,
                    ),
                    //image
                    BlocBuilder<UploadImageCubit, UploadImageState>(
                        builder: (context, state) {
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: imageCubit.profileImage != null
                                ? Image.file(
                                    File(imageCubit.profileImage!.path),
                                    width: 105.w,
                                    height: 105.w,
                                    fit: BoxFit.cover,
                                  )
                                : CustomNetworkImage(
                                    image: cubit.loginModel.data?.image ?? "",
                                    width: 105.w,
                                    height: 105.w,
                                    isUser: true,
                                  ),
                          ),
                          if (imageCubit.profileImage != null)
                            Positioned(
                              top: -15,
                              right: -15,
                              child: InkWell(
                                child: Icon(Icons.delete,
                                    size: 35.w, color: Colors.red),
                                onTap: () {
                                  imageCubit.removeImage();
                                },
                              ),
                            ),
                        ],
                      );
                    }),
                    SizedBox(
                      height: getVerticalPadding(context) * 1,
                    ),
                    //rounded button
                    GestureDetector(
                      onTap: () {
                        imageCubit.showImageSourceDialog(context);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: AppColors.white,
                            border: Border.all(
                              color: AppColors.primary,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 5.h),
                          child: Text(
                            AppTranslations.changeImage,
                            style: getRegularStyle(
                              color: AppColors.primary,
                              fontSize: 14.sp,
                            ),
                          )),
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
                    if (cubit.loginModel.data?.isSocial == 1)

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
                        onTap: () {
                          if (formInfo.currentState!.validate()) {
                            cubit.updateUserData(context,
                                imagePath: imageCubit.profileImage?.path);
                          }
                        },
                      ),
                    ),
                    if (cubit.loginModel.data?.isSocial == 1)
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.updatePassword);
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
