import 'package:flutter/cupertino.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/network_image.dart';

class CustomBookedCompanyContainer extends StatelessWidget {
  const CustomBookedCompanyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithShadow(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: CustomNetworkImage(
                  image: AppStrings.testImageUrl,
                  width: 80.w,
                  height: 80.w,
                ),
              ),
              SizedBox(height: 8.h),
              AutoSizeText(
                'Company Name',
                maxLines: 1,
                style: getMediumStyle(fontSize: 13.sp),
              ),
              SizedBox(height: 8.h),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: getWidthSize(context) * 0.3,
                  child: StarRating(
                      rating: 4,
                      allowHalfRating: false,
                      emptyIcon: CupertinoIcons.star_fill,
                      filledIcon: CupertinoIcons.star_fill,
                      

                      onRatingChanged: (rating) {
                        //   => setState(() => this.rating = rating
                      }),
                ),
                SizedBox(width: 8.w),
                Flexible(
                  child: AutoSizeText(
                    "200" + AppTranslations.personRateCompany,
                    maxLines: 2,
                    style:
                        getMediumStyle(fontSize: 13.sp, color: AppColors.grey),
                  ),
                ),
              ])
            ])));
  }
}
