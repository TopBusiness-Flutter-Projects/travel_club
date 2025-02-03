import 'package:flutter/cupertino.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/transportation/data/models/get_companies_model.dart';

class CustomBookedCompanyContainer extends StatelessWidget {
  const CustomBookedCompanyContainer({
    super.key,
    required this.companyModel,
  });
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return CustomContainerWithShadow(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: CustomNetworkImage(
                  image: companyModel.image ?? '',
                  width: 80.w,
                  height: 80.w,
                ),
              ),
              SizedBox(height: 8.h),
              AutoSizeText(
                companyModel.name ?? "",
                maxLines: 1,
                style: getMediumStyle(fontSize: 13.sp),
              ),
              SizedBox(height: 8.h),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  child: StarRating(
                    rating: double.parse((companyModel.rate ?? 0).toString()),
                    allowHalfRating: false,
                    size: 14.sp,
                    emptyIcon: CupertinoIcons.star_fill,
                    filledIcon: CupertinoIcons.star_fill,
                  ),
                ),
                SizedBox(width: 8.w),
                Flexible(
                  child: AutoSizeText(
                    "${companyModel.users}${AppTranslations.personRateCompany}",
                    maxLines: 2,
                    style:
                        getMediumStyle(fontSize: 13.sp, color: AppColors.grey),
                  ),
                ),
              ])
            ])));
  }
}
