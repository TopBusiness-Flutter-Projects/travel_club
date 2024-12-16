import 'package:travel_club/core/exports.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getHorizontalPadding(context),
          vertical: getVerticalPadding(context)),
      child: Row(children: [
        CircleAvatar(
            backgroundColor: AppColors.primary,
            radius: getWidthSize(context) * 0.07,
            child: Image.asset(ImageAssets.profile,
                color: AppColors.white, width: getWidthSize(context) * 0.1)),
        SizedBox(
          width: getWidthSize(context) * 0.05,
        ),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(AppTranslations.welcome,
                style: getMediumStyle(fontSize: 14.sp, color: AppColors.grey)),
            Text("نهوله",
                style: getSemiBoldStyle(color: AppColors.blue, fontSize: 18.sp))
          ]),
        ),
        SizedBox(
          width: getWidthSize(context) * 0.05,
        ),
        Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Badge(
                  backgroundColor: AppColors.primary,
                  isLabelVisible: true,
                  alignment: AlignmentDirectional.topStart,
                  child: SvgPicture.asset(AppIcons.notification)),
            )),
      ]),
    );
  }
}
