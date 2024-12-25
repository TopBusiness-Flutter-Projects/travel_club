import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/features/food/cubit/food_cubit.dart';
import 'package:travel_club/features/food/widgets/small_container_food.dart';

import '../../../core/exports.dart';

class BigContainerFood extends StatelessWidget {
   BigContainerFood({super.key,this.index=0});
int index;
  @override
  Widget build(BuildContext context) {
   return BlocBuilder<FoodCubit,FoodState>(builder: (BuildContext context, state) {  return
     InkWell(
       onTap: (){
         Navigator.pushNamed(context, Routes.detailsFoodRoute);
       },
       child: CustomContainerWithShadow(
         color: AppColors.white,
         child: Padding(
           padding: const EdgeInsets.all(0.0),
           child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 //small container
                 SmallContainerFood(index:index),
                 //
                 SizedBox(height: 10.h,),
                 Padding(
                   padding: const EdgeInsets.only(right: 8.0),
                   child: Container(child: Text("nahola"),),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(right: 8.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,

                     children: [
                       StarRating(
                           rating: 5,
                           allowHalfRating: false,
                           onRatingChanged: (rating){
                             //   => setState(() => this.rating = rating
                           }),
                       Text("٢٠٠"+AppTranslations.personWhoRatedRestaurant,style: getMediumStyle(fontSize: 12.sp,color: AppColors.grey),),
                     ],
                   ),
                 ),
                 SizedBox(height: 10.h,),
               ]),
         )),
     ); },);
  }
}
