import '../../../core/exports.dart';
import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String code = "156415415";
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: getWidthSize(context),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.pointsBackground),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Column(children: [
                  SizedBox(height: getVerticalPadding(context) * 2),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getHorizontalPadding(context)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomBackButton(),
                          Text(
                            AppTranslations.points,
                            style: getSemiBoldStyle(
                                color: AppColors.white, fontSize: 16.sp),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getHorizontalPadding(context),
                      vertical: getVerticalPadding(context),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppTranslations.myPoints,
                            style: getSemiBoldStyle(
                                color: AppColors.white, fontSize: 16.sp),
                          ),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalPadding(context),
                                vertical: 10.h,
                              ),
                              child: Text(
                                AppTranslations.withdraw,
                                style: getSemiBoldStyle(
                                    fontHeight: 1,
                                    color: AppColors.primary,
                                    fontSize: 16.sp),
                              ),
                            ),
                          )
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getHorizontalPadding(context),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: getHorizontalPadding(context),
                        vertical: 10.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "500 ${AppTranslations.point}",
                              style: getRegularStyle(
                                  fontHeight: 1,
                                  color: AppColors.white,
                                  fontSize: 26.sp),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: AppColors.white,
                            size: 36.sp,
                          ),
                          Flexible(
                            child: Text(
                              "50 ${AppTranslations.pound}",
                              style: getRegularStyle(
                                  fontHeight: 1,
                                  color: AppColors.white,
                                  fontSize: 26.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: getVerticalPadding(context) * 1),
                ]),
              ),
              20.h.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(AppTranslations.lastTransactions,
                    style: getBoldStyle(fontSize: 16.sp)),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.separated(
                    itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("تم استخدام 100 من النقاط لحجز فندق"),
                            10.h.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.calendar,
                                  color: AppColors.grey,
                                  width: 25.w,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "٢٠ يناير ٢٠٢٢",
                                  style: getRegularStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                    separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Divider(),
                        ),
                    itemCount: 8),
              ))
            ],
          ),
        );
      },
    );
  }
}
