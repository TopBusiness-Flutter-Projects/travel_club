import 'package:flutter/cupertino.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/network_image.dart';

class CustomCompanyContainer extends StatelessWidget {
  const CustomCompanyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
                context, Routes.transportationBookingDetailsRoute);
          },
          child: CustomContainerWithShadow(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: CustomNetworkImage(
                        image: AppStrings.testImageUrl,
                        width: 80.w,
                        height: 80.w,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            'Company Name',
                            maxLines: 1,
                            style: getMediumStyle(fontSize: 13.sp),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                StarRating(
                                    rating: 4,
                                    allowHalfRating: false,
                                    size: 14.sp,
                                    emptyIcon: CupertinoIcons.star_fill,
                                    filledIcon: CupertinoIcons.star_fill,
                                    onRatingChanged: (rating) {
                                      //   => setState(() => this.rating = rating
                                    }),
                                SizedBox(width: 8.w),
                                Flexible(
                                  child: AutoSizeText(
                                    "200" + AppTranslations.personRateCompany,
                                    maxLines: 2,
                                    style: getMediumStyle(
                                        fontSize: 13.sp, color: AppColors.grey),
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    )
                  ]))),
        ));
  }
}
