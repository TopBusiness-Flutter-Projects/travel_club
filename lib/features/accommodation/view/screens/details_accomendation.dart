import 'package:flutter/cupertino.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/features/location/screens/transportation_map.dart';

import '../../../../core/exports.dart';
import '../../cubit/accomendation_cubit.dart';
import '../widgets/details_widgets/custom_appbar_row.dart';
import '../widgets/details_widgets/custom_swiper.dart';

class DetailsAccommendation extends StatelessWidget {
  const DetailsAccommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AccomendationCubit, AccomendationState>(
          builder: (BuildContext context, state) {
        var cubit = context.read<AccomendationCubit>();
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: getHeightSize(context) * 0.45,
              floating: true,
              leading: SizedBox(
                  // width: 100.0,
                  // height: 0.0,
                  ),
              pinned: true,
              // snap: false,
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                // Calculate the app bar height to determine if it is expanded
                final bool isExpanded =
                    constraints.maxHeight > getHeightSize(context) * 0.2;

                return FlexibleSpaceBar(
                  title: !isExpanded
                      ? SizedBox(
                          width: getWidthSize(context) * 0.90,
                          child: Center(child: CustomRow()))
                      : null,
                  centerTitle: true,
                  background: Container(
                    color: AppColors.white,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        // Swiper for images
                        CustomSwiper(
                          height: getHeightSize(context) * 0.4,
                        ),
                        Positioned(
                          top: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: CustomRow(),
                        ),
                        Positioned(
                            bottom: 0,
                            child: SizedBox(
                              // height: getHeightSize(context) * 0.15,
                              width: getWidthSize(context) * 0.90,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: cubit.imageUrls
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      return Container(
                                        width: 10.0,
                                        height: 10.0,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 4.0),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                cubit.currentIndex == entry.key
                                                    ? AppColors.white
                                                    : (AppColors.white)
                                                        .withOpacity(0.4)),
                                      );
                                    }).toList(),
                                  ),
                                  CenterWidgetBooking(),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              }),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                  top: getHeightSize(context) * 0.033,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ToggleButtonScreen(),
                      Text(
                        AppTranslations.about,
                        style: getMediumStyle(
                          color: AppColors.secondPrimary,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        """خسائر اللازمة ومطالبة حدة بل. الآخر الحلفاء أن غزو, إجلاء 
                            وتنامت عدد مع. لقهر معركة لبلجيكا، بـ انه, ربع الأثنان المقيتة
                            في, اقتصّت المحور حدة و. هذه ما طرفاً عالمية استسلام,
                            الصين وتنامت حين ٣٠, ونتج والحزب المذابح كل جوي. أسر
                            كارثة المشتّتون بل, وبعض وبداية الصفحة غزو قد, أي بحث
                            تعداد الجنوب.""",
                        style: getMediumStyle(
                          fontSize: 14.sp,
                          color: AppColors.grey,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        AppTranslations.whatItOffers,
                        style: getMediumStyle(
                          color: AppColors.secondPrimary,
                          fontSize: 14.sp,
                        ),
                      ),

                      SizedBox(height: 10.h),
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
                                      CupertinoIcons.square_arrow_left,
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
                                          AppTranslations.departureTime,
                                          style:
                                              getMediumStyle(fontSize: 14.sp),
                                        ),
                                        Text(
                                          "12:00 - 20:00",
                                          style: getMediumStyle(
                                              color: AppColors.red,
                                              fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                  ]),
                            )
                          ]),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 85.h,
                        child: ListView.builder(
                          itemCount: 20,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.profile,
                                    width: 40.w,
                                    height: 40.h,
                                  ),
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
                      Text(
                        "الموقع علي الخريطة",
                        style: getMediumStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: getHeightSize(context) * 0.3,
                          decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                          ),
                          child: Stack(
                            children: [
                              SizedBox(
                                  width: double.infinity,
                                  height: getHeightSize(context) * 0.3,
                                  child: TransportationMap()),
                              PositionedDirectional(
                                bottom: 10.0,
                                end: 10.0,
                                child: Container(
                                  width: getWidthSize(context) * 0.7,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  // alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "٢٠ شارع الملك الصالح / الح / العين السخنه /مصر",
                                      style: getMediumStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: getHeightSize(context) * 0.2),
                    ],
                  ),
                ),
              ),
            ),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     (BuildContext context, int index) {
            //       return Container(
            //         width: double.infinity,
            //         height: getHeightSize(context) * 0.3,
            //         decoration: BoxDecoration(
            //           color: AppColors.red,
            //           borderRadius: BorderRadius.all(
            //             Radius.circular(30.r),
            //           ),
            //         ),
            //         child: ClipRRect(
            //             borderRadius: BorderRadius.all(
            //               Radius.circular(30.r),
            //             ),
            //             child: TransportationMap()),
            //       );
            //     },
            //     childCount: 1,
            //   ),
            // ),
          ],
        );
      }),
    );
  }
}

class CenterWidgetBooking extends StatelessWidget {
  const CenterWidgetBooking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithShadow(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "شركة سيكرت ترافيل",
            style: getSemiBoldStyle(
              fontSize: 14.sp,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        StarRating(
                            rating: 4,
                            allowHalfRating: false,
                            onRatingChanged: (rating) {
                              //   => setState(() => this.rating = rating
                            }),
                      ],
                    ),
                    Text(
                      "200" + AppTranslations.personRateCompany,
                      style: getUnderLine(
                          color: AppColors.primary, fontSize: 12.sp),
                      maxLines: 1,
                    )
                  ],
                ),
              ),
              CustomButton(
                width: getWidthSize(context) / 2.5,
                title: AppTranslations.bookNow,
                onTap: () {
                  Navigator.pushNamed(context, Routes.bookingAccomodation);
                },
              )
            ],
          ),
        ],
      ),
    ));
  }
}
