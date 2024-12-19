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
 isScrollControlled: true,
      backgroundColor: AppColors.white,
      builder: (context) {

        return BlocBuilder<MyBookingsCubit,MyBookingsState>(builder: (BuildContext context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10.h,),
                //center bottom sheet
                CenterBottomSheet(),
                //center
                SizedBox(height: 30.h,),
                Center(
                  child: Column(
                    children: [
                      Image.asset(ImageAssets.rate, height: 93.h, width: 93.w),
                      Text(
                        AppTranslations.rateExperince,
                        style: getSemiBoldStyle(fontSize: 20.sp, ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                // 1st Question
                Text(AppTranslations.howRateExperienceService,style: getSemiBoldStyle(fontSize: 14.sp),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    StarRating(
                        rating: 5,
                        allowHalfRating: false,
                        onRatingChanged: (rating){
                          //   => setState(() => this.rating = rating
                        }),
                  ],
                ),                 SizedBox(height: 10),

                // 2nd Question
                Text(AppTranslations.howRateExperienceClean,style: getSemiBoldStyle(fontSize: 14.sp),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    StarRating(
                        rating: 5,
                        allowHalfRating: false,
                        onRatingChanged: (rating){
                          //   => setState(() => this.rating = rating
                        }),
                  ],
                ),
                SizedBox(height: 10),

                // 3rd Question
                Text(AppTranslations.howRateExperienceFood,style: getSemiBoldStyle(fontSize: 14.sp),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    StarRating(
                        rating: 1,
                        allowHalfRating: false,
                        onRatingChanged: (rating){
                          //   => setState(() => this.rating = rating
                        }),
                  ],
                ),                 SizedBox(height: 10),

                // 4th Question
                Text(AppTranslations.howRateExperienceFood,style: getSemiBoldStyle(fontSize: 14.sp),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    StarRating(
                        rating: 3,
                        allowHalfRating: false,
                        onRatingChanged: (rating){
                          //   => setState(() => this.rating = rating
                        }),
                  ],
                ),                 SizedBox(height: 20),

                // textfiled

                CustomTextField(isMessage: true,),

                SizedBox(height: 20),
                Text(AppTranslations.writeComment,style: getSemiBoldStyle(fontSize: 14.sp),),

                // Submit Button
                CustomButton(title: AppTranslations.sendRate)
                //  SizedBox(height: 10),
              ],
            ),
          );
        },);
      });
}

