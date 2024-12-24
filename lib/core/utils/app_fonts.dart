import 'package:travel_club/core/exports.dart';

TextStyle _getTextStyle(
    {required double fontSize,
    double? fontHeight,
    required FontWeight fontWeight,
    required Color color}) {
  return TextStyle(
      height: fontHeight,
      fontSize: fontSize,
      fontFamily: AppStrings.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

TextStyle getLineOverStyle({bool isBold = true}) {
  return TextStyle(
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.primary,
    height: 2,
    decorationThickness: 15,
    fontSize: 16.sp,
    fontFamily: AppStrings.fontFamily,
    color: AppColors.primary,
    fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
  );
}

TextStyle getUnderLine({Color? color, double? fontSize,FontWeight ?fontweight }) {
  return TextStyle(
    decoration: TextDecoration.underline,
    decorationColor: color ?? AppColors.secondPrimary,
    // height: 2,
    decorationThickness: 2,

    fontSize: fontSize ?? 18.sp,
    fontFamily: AppStrings.fontFamily,
    color: color ?? AppColors.black,
    fontWeight: fontweight??FontWeight.w600,
  );
}
//get through line
TextStyle getThroughLine({Color? color, double? fontSize,FontWeight ?fontweight }) {
  return TextStyle(
    decoration: TextDecoration.lineThrough,
    decorationColor: color ?? AppColors.secondPrimary,
    // height: 2,
    decorationThickness: 2,

    fontSize: fontSize ?? 18.sp,
    fontFamily: AppStrings.fontFamily,
    color: color ?? AppColors.black,
    fontWeight: fontweight??FontWeight.w600,
  );
}
//textcolor

// light style 300
TextStyle getLightStyle({Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? AppColors.secondPrimary,
      fontWeight: FontWeight.w300,
      fontSize: fontSize ?? 16.sp,
      fontHeight: fontHeight);
}

// regular style 400
TextStyle getRegularStyle(
    {Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? AppColors.secondPrimary,
      fontWeight: FontWeight.w400,
      fontSize: fontSize ?? 18.sp,
      fontHeight: fontHeight);
}

// regular style 500
TextStyle getMediumStyle({Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? AppColors.secondPrimary,
      fontWeight: FontWeight.w500,
      fontSize: fontSize ?? 18.sp,
      fontHeight: fontHeight);
}

// semi bold style 600
TextStyle getSemiBoldStyle(
    {Color? color,
    double? fontHeight,
    double? fontSize,
    FontWeight? fontweight}) {
  return _getTextStyle(
      color: color ?? AppColors.secondPrimary,
      fontWeight: fontweight ?? FontWeight.w600,
      fontSize: fontSize ?? 18.sp,
      fontHeight: fontHeight);
}

// bold style 700
TextStyle getBoldStyle(
    {Color? color,
    double? fontHeight,
    double? fontSize,
    FontWeight? fontweight}) {
  return _getTextStyle(
      color: color ?? AppColors.secondPrimary,
      fontWeight: fontweight ?? FontWeight.w700,
      fontSize: fontSize ?? 18.sp,
      fontHeight: fontHeight);
}

// Extra Bold style 800
TextStyle getExtraStyle({Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? AppColors.secondPrimary,
      fontWeight: FontWeight.w800,
      fontSize: fontSize ?? 18.sp,
      fontHeight: fontHeight);
}
