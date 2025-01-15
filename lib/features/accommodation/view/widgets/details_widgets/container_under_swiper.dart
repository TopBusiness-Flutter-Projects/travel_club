import 'package:flutter/cupertino.dart';
import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/location/screens/position_map.dart';

import '../../../../../core/exports.dart';
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
                        cubit.lodgesDetailsModel.data?.about ?? "",
                        style: getMediumStyle(
                          fontSize: 14.sp,
                          color: AppColors.grey,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      if (cubit.lodgesDetailsModel.data!.rule != null)
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
                                            cubit.lodgesDetailsModel.data!.rule!
                                                .checkIn
                                                .toString(),
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
                                        CupertinoIcons.square_arrow_left,
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
                                            cubit.lodgesDetailsModel.data!.rule!
                                                .checkOut
                                                .toString(),
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
                      if (cubit.lodgesDetailsModel.data!.facilities != null &&
                          cubit.lodgesDetailsModel.data!.facilities!
                              .isNotEmpty) ...[
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
                            itemCount: cubit
                                .lodgesDetailsModel.data!.facilities!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10.0.w),
                                child: Column(
                                  children: [
                                    CustomNetworkImage(
                                        image: cubit.lodgesDetailsModel.data!
                                                .facilities![index].image ??
                                            "",
                                        height: 25.h,
                                        width: 25.h),
                                    SizedBox(height: 10.h),
                                    Text(
                                      cubit.lodgesDetailsModel.data!
                                              .facilities![index].name ??
                                          "",
                                      style: getMediumStyle(fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                      if (cubit.lodgesDetailsModel.data!.latitude != null ||
                          cubit.lodgesDetailsModel.data!.longitude != null)
                        PositionMap(
                          lat: cubit.lodgesDetailsModel.data!.latitude!,
                          long: cubit.lodgesDetailsModel.data!.longitude!,
                        ),
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
