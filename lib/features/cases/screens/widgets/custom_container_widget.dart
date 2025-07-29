import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/cases/data/model/get_suitcase.dart';
import 'package:travel_club/features/cases/screens/case_details_screen.dart';
import 'package:travel_club/features/home/data/models/home_model.dart';

class CustomBagContainer extends StatelessWidget {
  CustomBagContainer({
    this.isLast = false,
    this.isHome = true,
    this.suitcase,
    super.key,
  });
  final bool isLast;
  final bool isHome;
  SuitCaseData? suitcase;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: getHorizontalPadding(context),
          end: isLast ? getHorizontalPadding(context) : 0,
          bottom: getHeightSize(context) * 0.01),
      child: GestureDetector(
        onTap: () {
          if (suitcase != null) {
            Navigator.pushNamed(
              context,
              Routes.caseDescriptionScreenRoute,
              arguments: CaseDetailsArguments(suitcase!.id.toString()),
            );
          }
        },
        child: CustomContainerWithShadow(
            width:
                isHome ? getWidthSize(context) * 0.55 : getWidthSize(context),
            height: isHome ? null : getHeightSize(context) * 0.3,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: CustomNetworkImage(
                    width: isHome
                        ? getWidthSize(context) * 0.55
                        : getWidthSize(context),
                    height: getHeightSize(context) * 0.2,
                    image: suitcase?.image.toString() ?? "",
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
                          suitcase?.title.toString() ?? "",
                          maxLines: 1,
                          style: getMediumStyle(fontSize: 14.sp),
                        ),
                        Row(
                          children: [
                            if (suitcase?.discount != null &&
                                suitcase!.discount! > 0)
                              Flexible(
                                child: AutoSizeText(
                                  maxLines: 1,
                                  "${(suitcase?.price ?? 0)}  ",
                                  style: getLineOverStyle(isBold: false),
                                ),
                              ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: AutoSizeText(
                                maxLines: 1,
                                "${(suitcase?.priceAfterDiscount ?? 0)} ${AppTranslations.currency}",
                                style: getRegularStyle(
                                    color: AppColors.primary, fontSize: 14.sp),
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
      ),
    );
  }
}
