import 'package:travel_club/core/exports.dart';

class CustomSkipRow extends StatelessWidget {
  const CustomSkipRow({
    super.key,
    required this.onTap,
    required this.backgroundColor,
  });

  final void Function()? onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CircleAvatar(
        backgroundColor: AppColors.white,
        radius: getHeightSize(context) * 0.05,
        child: Padding(
          padding: EdgeInsets.all(4.h),
          child: Image.asset(
            ImageAssets.appIcon,
          ),
        ),
      ),
      InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Padding(
                padding: EdgeInsets.all(8.h),
                child: Row(
                  children: [
                    Text(
                      AppTranslations.skip,
                      style: getUnderLine(),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.secondPrimary,
                    )
                  ],
                )),
          ))
    ]);
  }
}