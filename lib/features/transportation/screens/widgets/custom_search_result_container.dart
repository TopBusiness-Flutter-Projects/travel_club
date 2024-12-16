import 'package:travel_club/core/exports.dart';

class CustomSearchResultContainer extends StatelessWidget {
  const CustomSearchResultContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getHorizontalPadding(context),
      ),
      child: CustomContainerWithShadow(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            Text(
                              " اتوبيس",
                              style: getSemiBoldStyle(
                                  color: AppColors.black, fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    " 44 " + AppTranslations.seats,
                                    style: getMediumStyle(
                                        color: AppColors.lbny,
                                        fontSize: 14.sp),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    " 07:00 صباحا ",
                                    style: getBoldStyle(
                                        color: AppColors.primary,
                                        fontSize: 14.sp),
                                  ),
                                ),
                              ],
                            ),
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
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "ل م ن ٢ ٣ ٦ ٥ ٣",
                                    style: getMediumStyle(
                                        color: AppColors.black,
                                        fontSize: 14.sp),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "200" + AppTranslations.currency,
                                    style: getBoldStyle(
                                        color: AppColors.green,
                                        fontSize: 14.sp),
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
