import 'package:flutter/material.dart';
import 'package:travel_club/core/exports.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/get_size.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.title,
     this.color, this.width, this.textColor, this.borderColor,
  });
  final void Function()? onTap;
  final String title;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getWidthSize(context) / 32),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(getWidthSize(context) / 12),
        child: Container(
          width:width?? double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.all(getWidthSize(context) / 32),
          decoration: BoxDecoration(
            color:color ??AppColors.primary,
            border: Border.all(color: borderColor ?? color??AppColors.primary),
            borderRadius: BorderRadius.circular(getWidthSize(context) / 12),
          ),
          child: Text(
            title,
            style:getSemiBoldStyle(color: textColor?? AppColors.white,fontSize: 14.sp)
          ),
        ),
      ),
    );
  }
}
