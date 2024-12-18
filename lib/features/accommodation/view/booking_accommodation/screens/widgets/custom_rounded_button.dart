import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_club/core/exports.dart';

class CustomRoundedButton extends StatelessWidget {
   CustomRoundedButton({super.key, this.onTap,this.title});
  void Function()? onTap;
  String ?title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 41.h, // Adjust height to match your design
        width: 150.w, // Adjust width to match your design
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), // Rounded edges
          border: Border.all(
            color: Colors.blue, // Border color
            width: 2, // Border width
          ),
        ),
        child: Center(
          child: Text(
         title ??  AppTranslations.bookNow,
            style: TextStyle(
              color: Colors.blue, // Text color
              fontSize: 18, // Text size
              fontWeight: FontWeight.w500, // Font weight
            ),
          ),
        ),
      ),
    );
  }
}
