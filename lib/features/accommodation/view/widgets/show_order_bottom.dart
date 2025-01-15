import 'package:flutter/material.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import '../../../../core/widgets/center_bottom_sheet.dart';
import '../../cubit/accomendation_cubit.dart';
import 'hotels_widgets/custom_check_box.dart';

class OrderBottomSheet extends StatefulWidget {
  const OrderBottomSheet({super.key, required this.id});
 final int ?id;
  @override
  _OrderBottomSheetState createState() => _OrderBottomSheetState();
}

class _OrderBottomSheetState extends State<OrderBottomSheet> {
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
              AppTranslations.orderBy,
              style: getSemiBoldStyle(fontSize: 20.sp),
            ),
            SizedBox(height: 30.h),
            //تصنيف النجوم

            //rate
            GridView.builder(
              itemCount: cubit.ordersFilters.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                mainAxisSpacing: 10, // Vertical spacing
                crossAxisSpacing: 5, // Horizontal spacing
                childAspectRatio: 3, // Aspect ratio for each grid item (adjust for appearance)
              )  , itemBuilder: (BuildContext context, int index) {
              return CustomOrderedCheckBox(starsFilter: cubit.ordersFilters[index],);
            },),
            SizedBox(height: 16.h),


            //row
            CustomButton(title: AppTranslations.orderResults,onTap: (){
             // cubit.ordersFilters.firstWhere((e) => e.isChecked==true).isChecked=false;
              cubit.getLodges(context: context,id:widget.id!);
              Navigator.pop(context);
            },),
        //    Center(child: ElevatedButton(onPressed: (){}, child: Text(AppTranslations.results,style: getSemiBoldStyle(color: AppColors.white,fontSize: 12.sp),),style:ElevatedButton.styleFrom(backgroundColor: AppColors.primary,) ,)),
            SizedBox(height: 5.h,),

          ],

        ),
      );
    },);
  }

}


