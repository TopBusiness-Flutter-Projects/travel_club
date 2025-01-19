import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_club/core/exports.dart';

class CustomRoundedButton extends StatelessWidget {
   const CustomRoundedButton({super.key, this.onTap,this.title,this.width,this.height,this.isBooking,this.icon});
 final void Function()? onTap;
 final String ?title;
 final double? width;
 final double? height;
 final bool ?isBooking;
 final IconData ?icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height:height?? 41.h, // Adjust height to match your design
        width: width??150.w, // Adjust width to match your design
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), // Rounded edges
          border: Border.all(
            color: Colors.blue, // Border color
            width: 2, // Border width
          ),
        ),
        child:isBooking==true?Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            Center(child: Icon(icon??Icons.add,color: AppColors.primary,)),
            SizedBox(width: 5.w,),
            Center(
              child: Text(
                title ??  AppTranslations.bookNow,
                style: TextStyle(
                  color: AppColors.primary, // Text color
                  fontSize: 14.sp, // Text size
                  fontWeight: FontWeight.w600, // Font weight
                ),
              ),
            )
            ],
          ),
        ) :Center(
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
