import 'package:flutter/cupertino.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';

import '../../cubit/transportation_state.dart';

class CustomCompanyContainer extends StatefulWidget {
   CustomCompanyContainer({
    super.key,this.isFavouriteScreen
  });
bool? isFavouriteScreen=false;
  @override
  State<CustomCompanyContainer> createState() => _CustomCompanyContainerState();
}

class _CustomCompanyContainerState extends State<CustomCompanyContainer> {
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<TransportationCubit>();
  return BlocBuilder<TransportationCubit, TransportationState>(builder: (BuildContext context, state) {
    return    Padding(
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              'Company Name',
                              maxLines: 1,
                              style: getMediumStyle(fontSize: 13.sp),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    cubit.isFavoriteTrue = !(cubit.isFavoriteTrue ?? false);
                                  });

                                },
                                child:
                                widget.isFavouriteScreen==true? Icon(CupertinoIcons.heart_fill,color: AppColors.red,size: 25,):
                                CircleAvatar(
                                  backgroundColor:  cubit.isFavoriteTrue==true?AppColors.red: AppColors.lightWhite,
                                  child: Icon(
                                    CupertinoIcons.heart,
                                    color: cubit.isFavoriteTrue==true?AppColors.white: AppColors.secondPrimary,
                                    size: 25.sp,
                                  ),
                                ),
                              ),
                            )
                          ],
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
      )); },);
  }
}
