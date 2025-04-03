import 'package:flutter/cupertino.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/core/widgets/custom_fav_widget.dart';
import 'package:travel_club/features/entertainment/cubit/entertainment_cubit.dart';

import '../../../../core/exports.dart';
import '../../data/model/get_orginization_model.dart';

class CustomContainerCompanies extends StatefulWidget {
  const CustomContainerCompanies(
      {super.key, this.isDetails = false, required this.orginizationData});
  final bool isDetails;

  final OrginizationData orginizationData;
  @override
  State<CustomContainerCompanies> createState() =>
      _CustomContainerCompaniesState();
}

class _CustomContainerCompaniesState extends State<CustomContainerCompanies> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<EntertainmentCubit>();
    return BlocBuilder<EntertainmentCubit, EntertainmentState>(
      builder: (BuildContext context, state) {
        return CustomContainerWithShadow(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                ImageAssets.logoImage,
                height: 61.h,
                width: 60.w,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.orginizationData.name.toString(),
                        style: getSemiBoldStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomFavWidget(
                          isFav: widget.orginizationData.isFav ?? false,
                          id: widget.orginizationData.id.toString(),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          StarRating(
                              rating: double.parse(
                                      widget.orginizationData.rate.toString() ==
                                              "null"
                                          ? "0.0"
                                          : widget.orginizationData.rate
                                              .toString()) ??
                                  0.0,
                              size: 14.sp,
                              allowHalfRating: false,
                              emptyIcon: CupertinoIcons.star_fill,
                              filledIcon: CupertinoIcons.star_fill,
                              onRatingChanged: (rating) {
                                //   => setState(() => this.rating = rating
                              }),
                        ],
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Flexible(
                          child: Text(
                        widget.orginizationData.users.toString() +
                            AppTranslations.personRateCompany,
                        style: widget.isDetails == true
                            ? getMediumStyle(
                                fontSize: 12.sp, color: AppColors.grey)
                            : getUnderLine(
                                color: AppColors.primary, fontSize: 12.sp),
                        maxLines: 1,
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            )
          ],
        ));
      },
    );
  }
}
