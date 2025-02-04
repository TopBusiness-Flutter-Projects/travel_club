import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/center_bottom_sheet.dart';
import '../../cubit/my_bookings_cubit.dart';
import '../../cubit/my_bookings_state.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void showAddRateBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    useSafeArea: true,
    enableDrag: true,
    isScrollControlled: true,
    backgroundColor: Colors.transparent, // Transparent background
    builder: (context) {
      var cubit = context.read<MyReservationsCubit>();
      return Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
          top: 20.h,
        ),
        width: double.infinity,
        height: getHeightSize(context) * 0.9,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            )
          ],
        ),
        child: Column(
          children: [
            10.verticalSpace,
      
            /// **Custom Drag Handle**
            const DragBottomSheet(),
      
            30.verticalSpace,
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(ImageAssets.rate,
                            height: 93.h, width: 93.w),
                        Text(
                          AppTranslations.rateExperince,
                          style: getSemiBoldStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,
      
                    /// **تقييم الأسئلة**
                    _buildRatingSection(
                        AppTranslations.howRateExperienceClean, cubit, 0),
                    _buildRatingSection(
                        AppTranslations.howRateExperiencePlace, cubit, 1),
                    _buildRatingSection(
                        AppTranslations.howRateExperienceRecommend, cubit, 2),
                    _buildRatingSection(
                        '${AppTranslations.howRateExperienceService}${cubit.selectedModule?.name}${AppTranslations.questionMark}',
                        cubit,
                        3,
                        allowHalfRating: true),
      
                    20.verticalSpace,
                    Text(
                      AppTranslations.writeComment,
                      style: getSemiBoldStyle(fontSize: 14.sp),
                    ),
                    5.verticalSpace,
                    const CustomTextField(
                      isMessage: true,
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(title: AppTranslations.sendRate)
          ],
        ),
      );
    },
  );
}

Widget _buildRatingSection(
    String question, MyReservationsCubit cubit, int index,
    {bool allowHalfRating = false}) {
  return Column(
    children: [
      Text(question, style: getSemiBoldStyle(fontSize: 14.sp)),
      10.verticalSpace,
      BlocBuilder<MyReservationsCubit, MyReservationsState>(
        builder: (context, state) {
          return RatingBar.builder(
            initialRating: cubit.rates[index].toDouble(),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: allowHalfRating,
            // ignoreGestures: false,
            // tapOnlyMode: false,
            itemCount: 5,
            itemSize: 24.sp,
            itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
            itemBuilder: (context, _) => Icon(
              CupertinoIcons.star_fill,
              color: AppColors.yellow,
            ),
            onRatingUpdate: (rating) {
              cubit.changeRating(rating, index);
            },
          );
        },
      ),
      20.verticalSpace,
    ],
  );
}

// Widget _buildRatingSection(
//     String question, MyReservationsCubit cubit, int index,
//     {bool allowHalfRating = false}) {
//   return Column(
//     children: [
//       Text(question, style: getSemiBoldStyle(fontSize: 14.sp)),
//       10.verticalSpace,

//       /// **BlocBuilder لضمان إعادة بناء الواجهة عند تغيير القيم**
//       BlocBuilder<MyReservationsCubit, MyReservationsState>(
//         builder: (context, state) {
//           return StarRating(
//             rating: cubit.rates[index],
//             size: 24.sp,
//             allowHalfRating: allowHalfRating,
//             emptyIcon: CupertinoIcons.star_fill,
//             filledIcon: CupertinoIcons.star_fill,
//             onRatingChanged: (rating) {
//               cubit.changeRating(rating, index);
//             },
//           );
//         },
//       ),
//       20.verticalSpace,
//     ],
//   );
// }
