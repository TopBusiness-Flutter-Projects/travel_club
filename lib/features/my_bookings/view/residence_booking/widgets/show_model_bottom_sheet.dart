import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/core/widgets/custom_text_form_field.dart';
import '../../../../../../core/widgets/center_bottom_sheet.dart';
import '../../../cubit/my_bookings_cubit.dart';
import '../../../cubit/my_bookings_state.dart';

void showModelBottomSheetRatting(context) {
  showModalBottomSheet(
      context: context,
      useSafeArea: true,
      // showDragHandle: true,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      builder: (context) {
        var cubit = context.read<MyReservationsCubit>();
        return BlocBuilder<MyReservationsCubit, MyReservationsState>(
          builder: (BuildContext context, state) {
            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
                top: 20.h,
              ),
              child: SizedBox(
                height: getHeightSize(context) * 0.9,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    //center bottom sheet
                    CenterBottomSheet(),
                    //center
                    SizedBox(
                      height: 30.h,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  Image.asset(ImageAssets.rate,
                                      height: 93.h, width: 93.w),
                                  Text(
                                    AppTranslations.rateExperince,
                                    style: getSemiBoldStyle(
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),

                            // 1st Question
                            Text(
                              AppTranslations.howRateExperienceService,
                              style: getSemiBoldStyle(fontSize: 14.sp),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StarRating(
                                    rating: cubit.rates[0],
                                    size: 14.sp,
                                    allowHalfRating: false,
                                    onRatingChanged: (rating) {
                                      cubit.changeRating(rating, 0);
                                      //   => setState(() => this.rating = rating
                                    }),
                              ],
                            ),
                            SizedBox(height: 10),

                            // 2nd Question
                            Text(
                              AppTranslations.howRateExperienceClean,
                              style: getSemiBoldStyle(fontSize: 14.sp),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StarRating(
                                    rating: cubit.rates[1],
                                    size: 14.sp,
                                    allowHalfRating: false,
                                    onRatingChanged: (rating) {
                                      cubit.changeRating(rating, 1);

                                      //   => setState(() => this.rating = rating
                                    }),
                              ],
                            ),
                            SizedBox(height: 10),

                            // 3rd Question
                            Text(
                              AppTranslations.howRateExperienceFood,
                              style: getSemiBoldStyle(fontSize: 14.sp),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StarRating(
                                    rating: cubit.rates[2],
                                    size: 14.sp,
                                    allowHalfRating: false,
                                    onRatingChanged: (rating) {
                                      cubit.changeRating(rating, 2);

                                      //   => setState(() => this.rating = rating
                                    }),
                              ],
                            ),
                            SizedBox(height: 10),

                            // 4th Question
                            Text(
                              AppTranslations.howRateExperienceFood,
                              style: getSemiBoldStyle(fontSize: 14.sp),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StarRating(
                                    rating: cubit.rates[3],
                                    allowHalfRating: false,
                                    size: 14.sp,
                                    onRatingChanged: (rating) {
                                      cubit.changeRating(rating, 3);

                                      //   => setState(() => this.rating = rating
                                    }),
                              ],
                            ),
                            SizedBox(height: 20),

                            // textfiled

                            CustomTextField(
                              isMessage: true,
                            ),

                            SizedBox(height: 20),
                            Text(
                              AppTranslations.writeComment,
                              style: getSemiBoldStyle(fontSize: 14.sp),
                            ),

                            // Submit Button

                            //  SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    CustomButton(title: AppTranslations.sendRate)
                  ],
                ),
              ),
            );
          },
        );
      });
}
