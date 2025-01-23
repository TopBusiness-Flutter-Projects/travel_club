import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/features/residence/cubit/residence_cubit.dart';
import 'package:travel_club/features/residence/view/screens/lodge_details.dart';

import '../../../../../core/exports.dart';

class LodgeRatesContainerWithPoints extends StatelessWidget {
  const LodgeRatesContainerWithPoints({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ResidenceCubit>();
    return BlocBuilder<ResidenceCubit, ResidenceState>(
      builder: (BuildContext context, state) {
        return Positioned(
          top: getHeightSize(context) * 0.29, // Adjust position from the top
          left: getWidthSize(context) * 0.05, // Adjust position from the left
          right: getWidthSize(context) * 0.05, // Adjust position from the right
          child: SizedBox(
            height: getHeightSize(context) * 0.50,
            child: Column(
              //Swipprt Points
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: cubit.lodgesDetailsModel.data!.media!
                //       .map((element) => element.image ?? "")
                //       .toList()
                //       .asMap()
                //       .entries
                //       .map((entry) {
                //     return Container(
                //       width: 10.0,
                //       height: 10.0,
                //       margin: const EdgeInsets.symmetric(
                //           vertical: 8.0, horizontal: 4.0),
                //       decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //           color: cubit.currentIndex == entry.key
                //               ? AppColors.white
                //               : (AppColors.white).withOpacity(0.4)),
                //     );
                //   }).toList(),
                // ),
                CustomContainerWithShadow(
                  height: getHeightSize(context) * 0.12,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AutoSizeText(
                          cubit.lodgesDetailsModel.data?.name ?? '',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: getSemiBoldStyle(
                            color: AppColors.secondPrimary,
                            fontSize: 14.sp,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    StarRating(
                                      rating: cubit
                                          .lodgesDetailsModel.data?.rate
                                          .toDouble(),
                                      allowHalfRating: true,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                AutoSizeText(
                                  ' ${cubit.lodgesDetailsModel.data?.users}${AppTranslations.personRating}',
                                  style: getUnderLine(
                                    color: AppColors.primary,
                                    fontSize: 12.sp,
                                  ),
                                )
                              ],
                            ),
                            CustomSmallButton(
                              title: AppTranslations.bookNow,
                              onTap: () {
                                checkLoggingStatus(
                                  context,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Routes.bookingResidenceRoute,
                                        arguments:
                                            cubit.lodgesDetailsModel.data?.id!);
                                    // cubit.swiperController.stopAutoplay();
                                    // cubit.swiperController.dispose();
                                  },
                                );
                              },
                              width: getWidthSize(context) / 2.5,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
