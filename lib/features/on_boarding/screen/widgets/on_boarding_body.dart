import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_skip_row.dart';
import 'package:travel_club/features/auth/widgets/custom_forward.dart';

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
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
                height: getHeightSize(context) * 0.65,
                width: getWidthSize(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: getHeightSize(context) * 0.01),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: CustomSkipRow(
                              onTap: onTap, backgroundColor: AppColors.white),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getHeightSize(context) * 0.01,
                          horizontal: getWidthSize(context) * 0.1),
                      child: Image.asset(
                        image,
                        // height: getHeightSize(context) * 0.,
                        // width: getSize(context) / 1.1,
                      ),
                    ),
                  ],
                )),
          ),
          Container(
            height: getHeightSize(context) * 0.35,
            width: getWidthSize(context),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.r),
                topRight: Radius.circular(18.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getHeightSize(context) * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      AutoSizeText(
                        text,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: getSemiBoldStyle(fontSize: 20.sp),
                      ),
                      Image.asset(ImageAssets.container,
                          height: getHeightSize(context) * 0.05,
                          color: backgroundColor),
                    ],
                  ),
                  CustomForward(
                    onTap: onTap,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
