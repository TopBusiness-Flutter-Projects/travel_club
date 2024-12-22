import 'package:flutter_rating/flutter_rating.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/accomendation_cubit.dart';

class ContainerInCenter extends StatelessWidget {
   ContainerInCenter({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<AccomendationCubit>();
   return BlocBuilder<AccomendationCubit, AccomendationState>(builder: (BuildContext context, state) {
     return    Positioned(
       top: getHeightSize(context) * 0.29, // Adjust position from the top
       left: getWidthSize(context) * 0.05, // Adjust position from the left
       right: getWidthSize(context) * 0.05, // Adjust position from the right
       child: SizedBox(
         height: getHeightSize(context) * 0.20,

         child: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: cubit.imageUrls!.asMap().entries.map((entry) {
                 return Container(
                   width: 10.0,
                   height: 10.0,
                   margin: const EdgeInsets.symmetric(
                       vertical: 8.0, horizontal: 4.0),
                   decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color:cubit.currentIndex == entry.key ? (AppColors.primary)
                           .withOpacity( 0.4):AppColors.grey
                   ),
                 );
               }).toList(),
             )    ,        Expanded(
               child: Container(
                 //   height: getHeightSize(context) * 0.25,

                 padding: EdgeInsets.symmetric(horizontal: 10.0),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(18.r),
                   boxShadow: [
                     BoxShadow(
                       color: Colors.black.withOpacity(0.1),
                       blurRadius: 5,
                       offset: Offset(0, 4),
                     ),
                   ],
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     AutoSizeText(
                       "مراسي ريزورت العين السخنه البحر الاحمر",
                       maxLines: 1,
                       textAlign: TextAlign.center,
                       style: getSemiBoldStyle(
                         color: AppColors.secondPrimary,
                         fontSize: 14.sp,
                       ),
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                     Column(children: [
                           Row(
                             children: [
                               StarRating(
                                   rating: 4,
                                   allowHalfRating: false,
                                   onRatingChanged: (rating){
                                     //   => setState(() => this.rating = rating
                                   }),
                             ],
                           ),
                           SizedBox(height: 5.h,),
                           AutoSizeText(
                             "٢٠٠ فرد قام بتقيم الفندق",
                             style: getUnderLine(
                               color: AppColors.primary,
                               fontSize: 12.sp,
                             ),

                           )   ],),
                         //     Spacer(),
                         ElevatedButton(onPressed: (){
                           Navigator.pushNamed(context, Routes.bookingAccomodation );
                         }, child: Text("احجز الان",style: getSemiBoldStyle(color: AppColors.white,fontSize: 14.sp),),style:ElevatedButton.styleFrom(backgroundColor: AppColors.primary),)

                       ],)

                   ],
                 ),
               ),
             ),
           ],
         ),
       ),
     );
   },);
  }
}
