import 'package:travel_club/core/exports.dart';

class CustomSearchResultContainer extends StatelessWidget {
  const CustomSearchResultContainer({
    super.key,
    this.isOneWay = false,
  });
  final bool isOneWay;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getHorizontalPadding(context),
      ),
      child: CustomContainerWithShadow(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightWhite,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(
                        15), // Circular with rounded corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      AppIcons.bus,
                      height: 49.h,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "جو باص",
                                    style: getSemiBoldStyle(
                                        color: AppColors.black,
                                        fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    " 44 " + AppTranslations.seats,
                                    style: getMediumStyle(
                                        color: AppColors.lbny, fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: isOneWay
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          " 07:00 صباحا ",
                                          style: getBoldStyle(
                                              color: AppColors.primary,
                                              fontSize: 14.sp),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        RichText(
                                          // maxLines: 2,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: "ذهاب",
                                                  style: getRegularStyle(
                                                    fontSize: 14.sp,
                                                  )),
                                              TextSpan(
                                                  text: ' ',
                                                  style: getBoldStyle(
                                                      fontSize: 15.sp,
                                                      color:
                                                          AppColors.primary)),
                                              TextSpan(
                                                text: " 07:00 صباحا ",
                                                style: getBoldStyle(
                                                    color: AppColors.primary,
                                                    fontSize: 14.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height: 5.h,
                                        // ),
                                        RichText(
                                          // maxLines: 2,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: "عودة",
                                                  style: getRegularStyle(
                                                    fontSize: 14.sp,
                                                  )),
                                              TextSpan(
                                                  text: ' ',
                                                  style: getBoldStyle(
                                                      fontSize: 15.sp,
                                                      color:
                                                          AppColors.primary)),
                                              TextSpan(
                                                text: " 07:00 صباحا ",
                                                style: getBoldStyle(
                                                    color: AppColors.primary,
                                                    fontSize: 14.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Flexible(
                        //       child: Text(
                        //         " 44 " + AppTranslations.seats,
                        //         style: getMediumStyle(
                        //             color: AppColors.lbny, fontSize: 14.sp),
                        //       ),
                        //     ),
                        //     Flexible(
                        //       child: Text(
                        //         " 07:00 صباحا ",
                        //         style: getBoldStyle(
                        //             color: AppColors.primary, fontSize: 14.sp),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          AppTranslations.vehicleNumber,
                          style: getSemiBoldStyle(
                              color: AppColors.grey, fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                "ل م ن ٢ ٣ ٦ ٥ ٣",
                                style: getMediumStyle(
                                    color: AppColors.black, fontSize: 14.sp),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "200" + AppTranslations.currency,
                                style: getBoldStyle(
                                    color: AppColors.green, fontSize: 14.sp),
                              ),
                            ),
                          ],
                        )
                      ]),
                )
              ]))),
    );
  }
}
