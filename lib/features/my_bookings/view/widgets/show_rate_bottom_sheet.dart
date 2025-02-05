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

void showAddRateBottomSheet(BuildContext context , {required int reservationId}) {
  context.read<MyReservationsCubit>().rateCommentController.clear();

  // Create a ScrollController to handle scrolling
  final ScrollController scrollController = ScrollController();

  showModalBottomSheet(
    context: context,
    useSafeArea: true,
    enableDrag: true,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      var cubit = context.read<MyReservationsCubit>();
      GlobalKey<FormState> formKey = GlobalKey<FormState>();

      return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.9,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20.h,
                    ),
                    child: Column(
                      children: [
                        10.verticalSpace,
                        const DragBottomSheet(),
                        30.verticalSpace,
                      ],
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: const ClampingScrollPhysics(),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Form(
                          key: formKey,
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
                              _buildRatingSection(
                                  AppTranslations.howRateExperienceClean,
                                  cubit,
                                  0),
                              _buildRatingSection(
                                  AppTranslations.howRateExperiencePlace,
                                  cubit,
                                  1),
                              _buildRatingSection(
                                  AppTranslations.howRateExperienceRecommend,
                                  cubit,
                                  2),
                              _buildRatingSection(
                                  '${AppTranslations.howRateExperienceService}${cubit.selectedModule?.name}${AppTranslations.questionMark}',
                                  cubit,
                                  3,
                                  allowHalfRating: true),
                              15.verticalSpace,
                              Text(
                                AppTranslations.writeComment,
                                style: getSemiBoldStyle(fontSize: 14.sp),
                              ),
                              5.verticalSpace,
                              Focus(
                                onFocusChange: (hasFocus) {
                                  if (hasFocus) {
                                    // Scroll to the bottom when TextField gains focus
                                    Future.delayed(
                                        const Duration(milliseconds: 300), () {
                                      scrollController.animateTo(
                                        scrollController
                                            .position.maxScrollExtent,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeOut,
                                      );
                                    });
                                  }
                                },
                                child: CustomTextField(
                                  isMessage: true,
                                  controller: cubit.rateCommentController,
                                  validator: (v) {
                                    if ((v == null || v.isEmpty) &&
                                        cubit.selectedModuleId == 3) {
                                      return AppTranslations.writeComment;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: CustomButton(
                      title: AppTranslations.sendRate,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          print(
                              "cubit.selectedModuleId: ${cubit.selectedModuleId}");
                          cubit.addRate(context , reservationId:reservationId );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

// void showAddRateBottomSheet(BuildContext context) {
//   context.read<MyReservationsCubit>().rateCommentController.clear();
//   showModalBottomSheet(
//     context: context,
//     useSafeArea: true,
//     enableDrag: true,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent, // Transparent background
//     builder: (context) {
//       var cubit = context.read<MyReservationsCubit>();
//       GlobalKey<FormState> formKey = GlobalKey<FormState>();
//       return Container(
//         padding: EdgeInsets.only(
//           left: 20,
//           right: 20,
//           bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
//           top: 20.h,
//         ),
//         width: double.infinity,
//         height: getHeightSize(context) * 0.9,
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.2),
//               blurRadius: 10,
//               spreadRadius: 2,
//             )
//           ],
//         ),
//         child: Form(
//           // Move Form higher in the widget tree
//           key: formKey,
//           child: Column(
//             children: [
//               10.verticalSpace,

//               /// **Custom Drag Handle**
//               const DragBottomSheet(),

//               30.verticalSpace,
//               Flexible(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Column(
//                         children: [
//                           Image.asset(ImageAssets.rate,
//                               height: 93.h, width: 93.w),
//                           Text(
//                             AppTranslations.rateExperince,
//                             style: getSemiBoldStyle(
//                               fontSize: 20.sp,
//                             ),
//                           ),
//                         ],
//                       ),
//                       20.verticalSpace,

//                       /// **تقييم الأسئلة**
//                       _buildRatingSection(
//                           AppTranslations.howRateExperienceClean, cubit, 0),
//                       _buildRatingSection(
//                           AppTranslations.howRateExperiencePlace, cubit, 1),
//                       _buildRatingSection(
//                           AppTranslations.howRateExperienceRecommend, cubit, 2),
//                       _buildRatingSection(
//                           '${AppTranslations.howRateExperienceService}${cubit.selectedModule?.name}${AppTranslations.questionMark}',
//                           cubit,
//                           3,
//                           allowHalfRating: true),

//                       20.verticalSpace,
//                       Text(
//                         AppTranslations.writeComment,
//                         style: getSemiBoldStyle(fontSize: 14.sp),
//                       ),
//                       5.verticalSpace,
//                       CustomTextField(
//                         isMessage: true,
//                         // controller: cubit.rateCommentController,
//                         // validator: (v) {
//                         //   if ((v == null || v.isEmpty) &&
//                         //       cubit.selectedModuleId == 3) {
//                         //     return AppTranslations.writeComment;
//                         //   }
//                         //   return null;
//                         // },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               CustomButton(
//                   title: AppTranslations.sendRate,
//                   onTap: () {
//                     if (formKey.currentState!.validate()) {
//                       print(
//                           "cubit.selectedModuleId: ${cubit.selectedModuleId}");
//                       //cubit.addRate(context);
//                     }
//                   })
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

Widget _buildRatingSection(
    String question, MyReservationsCubit cubit, int index,
    {bool allowHalfRating = true}) {
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
