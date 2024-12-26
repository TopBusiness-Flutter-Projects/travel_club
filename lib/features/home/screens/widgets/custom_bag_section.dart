import 'package:flutter/cupertino.dart';
import 'package:travel_club/core/exports.dart';

class CustomBagSection extends StatelessWidget {
  const CustomBagSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppTranslations.bestBags,
                  style: getBoldStyle(fontSize: 16.sp)),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.bags);
                },
                child: Text(
                  AppTranslations.more,
                  style:
                      getUnderLine(color: AppColors.primary, fontSize: 14.sp),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: getHeightSize(context) * 0.01,
        ),
        SizedBox(
            height: getHeightSize(context) * 0.3,
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  CustomBagContainer(isLast: index == 2),
              itemCount: 3,
              scrollDirection: Axis.horizontal,
            ))
      ],
    );
  }
}

class CustomBagContainer extends StatelessWidget {
  const CustomBagContainer({
    this.isLast = false,
    this.isHome = true,
    super.key,
  });
  final bool isLast;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: getHorizontalPadding(context),
          end: isLast ? getHorizontalPadding(context) : 0,
          bottom: getHeightSize(context) * 0.01),
      child: CustomContainerWithShadow(
          width: isHome ? getWidthSize(context) * 0.55 : getWidthSize(context),
          height: isHome ? null : getHeightSize(context) * 0.3,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.network(
                  AppStrings.testImageUrl,
                  fit: BoxFit.cover,
                  width: isHome
                      ? getWidthSize(context) * 0.55
                      : getWidthSize(context),
                  height: getHeightSize(context) * 0.2,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getHorizontalPadding(context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        AppTranslations.newOffers +
                            " " +
                            // AppTranslations.newOffers +
                            // " " +
                            // AppTranslations.newOffers +
                            " ",
                        maxLines: 1,
                        style: getMediumStyle(fontSize: 14.sp),
                      ),
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: AutoSizeText(
                              maxLines: 1,
                              AppTranslations.newOffers,
                              style: getRegularStyle(
                                  color: AppColors.grey, fontSize: 14.sp),
                            ),
                          ),
                          // Icon(
                          //   CupertinoIcons.heart,
                          //   color: AppColors.primary,
                          //   size: 25.sp,
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
