import 'package:flutter_svg/svg.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_skip_row.dart';

class CustomOnBoardingBody extends StatelessWidget {
  const CustomOnBoardingBody({
    super.key,
    required this.image,
    required this.backgroundColor,
    required this.text,
    this.onTap,
  });
  final String image;
  final Color backgroundColor;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidthSize(context),
      height: getHeightSize(context),
      color: backgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: getHeightSize(context) * 0.05,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getWidthSize(context) / 22),
            child:
                CustomSkipRow(onTap: onTap, backgroundColor: AppColors.white),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(getWidthSize(context) / 22),
              child: Image.asset(
                image,
                height: getHeightSize(context) * 0.4,
                // width: getSize(context) / 1.1,
              ),
            ),
          ),
          Spacer(),
          Container(
            //  height: getHeightSize(context) * 0.4,
            width: getWidthSize(context),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.r),
                topRight: Radius.circular(18.r),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: getHeightSize(context) * 0.05),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style:
                        getBoldStyle(color: AppColors.black, fontSize: 22.sp),
                  ),
                ),
                SvgPicture.asset(AppIcons.container,
                    height: 100.h, color: backgroundColor),
                SizedBox(height: getHeightSize(context) * 0.05),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
