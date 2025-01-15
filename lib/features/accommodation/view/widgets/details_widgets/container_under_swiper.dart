import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/location/screens/position_map.dart';

import '../../../../../core/exports.dart';
import '../../../../entertainment/screens/details_of_entertainment/widgets/toggle_container.dart';
import '../../../../location/screens/transportation_map.dart';
import '../../../cubit/accomendation_cubit.dart';

class ContainerUnderSwiper extends StatelessWidget {
  const ContainerUnderSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AccomendationCubit>();
    return BlocBuilder<AccomendationCubit, AccomendationState>(
      builder: (BuildContext context, state) {
        return Positioned(
          bottom: 0,
          child: Container(
            height: getHeightSize(context) * 0.59,
            width: getWidthSize(context),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.r),
                topRight: Radius.circular(18.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: getHeightSize(context) * 0.07,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   height: getHeightSize(context) * 0.65,
                      //   width: getWidthSize(context),
                      //   child: CarouselSlider(
                      //     items: cubit.lodgesDetailsModel.data!.media!
                      //         .map((element) => element.image ?? "")
                      //         .toList()
                      //         .map((e) => CustomNetworkImage(
                      //               isDetails: true,
                      //               image: e,
                      //               height: getHeightSize(context) * 0.65,
                      //               width: getWidthSize(context),
                      //             ))
                      //         .toList(),
                      //     options: CarouselOptions(
                      //         onPageChanged: (index, reason) {
                      //           // cubit.changeIndex(index);
                      //         },
                      //         clipBehavior: Clip.none,
                      //         autoPlay: true,
                      //         initialPage: 0,
                      //         viewportFraction: 1,
                      //         enableInfiniteScroll: true,
                      //         reverse: false,
                      //         autoPlayAnimationDuration:
                      //             const Duration(seconds: 1),
                      //         autoPlayCurve: Curves.linear,
                      //         autoPlayInterval: const Duration(seconds: 5),
                      //         scrollDirection: Axis.horizontal),
                      //   ),
                      // ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text(
                        AppTranslations.about,
                        style: getMediumStyle(
                          color: AppColors.secondPrimary,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        cubit.lodgesDetailsModel.data?.about ??"",
                       style: getMediumStyle(
                          fontSize: 14.sp,
                          color: AppColors.grey,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      //curaption icon
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.square_arrow_right,
                                      color: AppColors.green,
                                      size: getWidthSize(context) / 8,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppTranslations.checkinTime,
                                          style:
                                              getMediumStyle(fontSize: 14.sp),
                                        ),
                                        Text(
                                          "12:00 - 20:00",
                                          style: getMediumStyle(
                                              color: AppColors.grey,
                                              fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                            Flexible(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.square_arrow_right,
                                      color: AppColors.red,
                                      size: getWidthSize(context) / 8,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppTranslations.departureTime,
                                          style:
                                              getMediumStyle(fontSize: 14.sp),
                                        ),
                                        Text(
                                          "12:00 - 20:00",
                                          style: getMediumStyle(
                                              color: AppColors.grey,
                                              fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                  ]),
                            )
                          ]),

                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        AppTranslations.whatItOffers,
                        style: getMediumStyle(
                          color: AppColors.secondPrimary,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          itemCount: 20,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                              child: Column(
                                children: [
                                  SvgPicture.asset(AppIcons.profile),
                                  SizedBox(height: 10.h),
                                  Text(
                                    "حمام سباحة",
                                    style: getMediumStyle(fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      PositionMap(lat: 30.245, long: 30.21),
                      SizedBox(height: 60.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
