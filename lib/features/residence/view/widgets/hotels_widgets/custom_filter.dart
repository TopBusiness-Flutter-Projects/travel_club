import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_club/core/exports.dart';

import '../show_model_bottom_sheet.dart';
import '../show_order_bottom.dart';

class CustomFilterBar extends StatelessWidget {
   CustomFilterBar({super.key, required this.mapWidget,  this.id});
  final Widget mapWidget ;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
       padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.blueGrey.shade100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // فلتر
          InkWell(
            onTap: (){
              //   void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return FilterBottomSheet(id: id!,);
      },
    );
            },
            child: BuildFilterItem(icon: AppIcons.filter, label: AppTranslations.filter),
          ),
          Container(height:50.h ,width: 1.w,color: Colors.blueGrey.shade100,),
        //  Divider(color: Colors.blueGrey.shade100, thickness: 1,height: ,),
          // ترتيب حسب
          InkWell(
            onTap: (){
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return OrderBottomSheet(id: id,);
                },
              );
            },
            child: BuildFilterItem(icon: AppIcons.order, label: AppTranslations.orderBy),
          ),
          Container(height:50.h ,width: 1.w,color: Colors.blueGrey.shade100,),
          SizedBox(width: 4.w,),
          // خريطة
        mapWidget
        ],
      ),
    );
  }
}

class BuildFilterItem extends StatelessWidget {
  const BuildFilterItem({
    super.key,
    required this.icon,
    required this.label,
  });

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(icon, color: Colors.blueGrey,),
           SizedBox(width: 4.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.blueGrey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}


