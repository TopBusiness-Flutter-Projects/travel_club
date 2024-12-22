import 'package:flutter/material.dart';
import 'package:travel_club/core/exports.dart';
import '../../../../core/widgets/center_bottom_sheet.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../cubit/accomendation_cubit.dart';
import 'hotels_widgets/custom_check_box.dart';

class FilterBottomSheet extends StatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var cubit= context.read<AccomendationCubit>();
  return BlocBuilder<AccomendationCubit, AccomendationState>(builder: (BuildContext context, state) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          SizedBox(height: 10.h),
          //custom center bottomshhet
          CenterBottomSheet(),
          SizedBox(height: 20.h),

          Text(
            AppTranslations.resultsFilter,
            style: getSemiBoldStyle(fontSize: 20.sp),
          ),
          SizedBox(height: 30.h),
          //تصنيف النجوم
          Text(
            AppTranslations.rating,
            style:getSemiBoldStyle(fontSize: 14.sp),
          ),
          //rate
          GridView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              mainAxisSpacing: 10, // Vertical spacing
              crossAxisSpacing: 5, // Horizontal spacing
              childAspectRatio: 3, // Aspect ratio for each grid item (adjust for appearance)
            )  , itemBuilder: (BuildContext context, int index) {
            return CustomCheckBox(starsFilter: cubit.starsFilters[index],
    );

          },),
          SizedBox(height: 16.h),
//المرافق
          Text(
            AppTranslations.facilities,
            style:getSemiBoldStyle(fontSize: 14.sp),
          ),
          //facilities
          GridView.builder(
            itemCount: cubit.Facilities.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              mainAxisSpacing: 5, // Vertical spacing
              crossAxisSpacing: 5, // Horizontal spacing
              childAspectRatio: 3, // Aspect ratio for each grid item (adjust for appearance)
            )  , itemBuilder: (BuildContext context, int index) {
            return CustomCheckBox(starsFilter:cubit.Facilities[index],);
          },),
          SizedBox(height: 5.h,),
          //row
          Row(children: [
            Expanded(child: CustomButton(title: AppTranslations.results,onTap: (){},)),

            // SizedBox(
            //   width: 255.w,
            //   height: 42.h,
            //   child: ElevatedButton(onPressed: (){}, child: Text(AppTranslations.results,style: getSemiBoldStyle(color: AppColors.white,fontSize: 12.sp),),style:ElevatedButton.styleFrom(backgroundColor: AppColors.primary,) ,),
            // ),
            SizedBox(width: 4.w,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                 cubit. removeFilter();
                },
                  child: Text(AppTranslations.removeFilter,style: getSemiBoldStyle(color: AppColors.red,fontSize: 14.sp),)),
            )],),
          SizedBox(height: 5.h,),

        ],

      ),
    );
  },);
  }

}


