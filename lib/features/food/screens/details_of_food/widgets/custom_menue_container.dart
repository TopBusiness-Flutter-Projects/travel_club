import 'package:travel_club/features/entertainment/cubit/entertainment_cubit.dart';

import '../../../../../core/exports.dart';

class CustomMenueContainer extends StatelessWidget {
  const CustomMenueContainer({super.key});

  @override
  Widget build(BuildContext context) {
 return BlocBuilder<EntertainmentCubit, EntertainmentState>(builder: (BuildContext context, state) {    return Padding(
   padding: const EdgeInsets.all(8.0),
   child: CustomContainerWithShadow(
     child:
   Padding(
     padding: const EdgeInsets.all(20.0),
     child: Row(
       children: [
      Image.asset(ImageAssets.foodContainer,height: 61.h,width: 60.w,),
         Flexible(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("مطعم صبحي كابر روض الفرج",style: getSemiBoldStyle(fontSize: 14.sp,),),
                 SvgPicture.asset(AppIcons.addCircle)
               ],
             ),
               SizedBox(height: 5.h,),

               Text("ربع دجاج صدر - طبق سلطة طحينة - ارز بسمتي",style: getRegularStyle(fontSize: 12.sp,color: AppColors.grey),),
             SizedBox(height: 15.h,),
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(" 100"+AppTranslations.currency,style: getSemiBoldStyle(fontSize: 14.sp,color: AppColors.green),),
                 Text("150"+AppTranslations.currency,style: getThroughLine(color: AppColors.grey,fontSize: 14.sp,),),
               ],
             ),
           ],),
         ),

       ],
     ),
   ),),
 ); },);
  }
}
