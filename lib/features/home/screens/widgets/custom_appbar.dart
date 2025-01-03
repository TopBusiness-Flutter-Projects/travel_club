import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';

class CustomHomeAppbar extends StatelessWidget {
    CustomHomeAppbar({
    super.key,required this.isHome,required this.title
  });
bool isHome;
String ?title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getHorizontalPadding(context),
          vertical: getVerticalPadding(context)),
      child: Row(
          children: [
if(isHome==true)...[
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
    Text(AppTranslations.hi,
    // Text(AppTranslations.welcome,
    style: getMediumStyle(fontSize: 14.sp, color: AppColors.grey)),
    Text(title!,
    style: getSemiBoldStyle(color: AppColors.blue, fontSize: 18.sp))
    ]),
    ),
        ]
            else...[
  Expanded(
    child: Text(title!,
        style: getSemiBoldStyle(color: AppColors.blue, fontSize: 18.sp)),
  ),
        ],
        SizedBox(
          width: getWidthSize(context) * 0.05,
        ),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, Routes.notificationScreen);
          },
          child: Container(
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
        ),
      ]
      ),
    );
  }
}
