import 'package:flutter/cupertino.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/features/food/cubit/food_cubit.dart';
import 'package:travel_club/features/food/widgets/small_container_food.dart';

import '../../../core/exports.dart';

class BigContainerFood extends StatelessWidget {
   BigContainerFood({super.key,this.index=0,this.isFavouriteScreen,this.name,this.rate,this.users,this.logo});
int index;
bool ?isFavouriteScreen;
String ?name;
String ?rate;
String ?users;
String ?logo;
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
                 SmallContainerFood(index:index,isFavouriteScreen: isFavouriteScreen),
                 //
                 SizedBox(height: 10.h,),
                 Padding(
                   padding: const EdgeInsets.only(right: 8.0),
                   child: Container(child: Text(name!),),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(right: 8.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,

                     children: [
                       StarRating(
                           rating:double.tryParse(rate.toString())??0 , size: 14.sp,
                           allowHalfRating: false, emptyIcon: CupertinoIcons.star_fill,
                      filledIcon: CupertinoIcons.star_fill,
                           onRatingChanged: (rating){
                             //   => setState(() => this.rating = rating
                           }),
                       Text(users!+AppTranslations.personWhoRatedRestaurant,style: getMediumStyle(fontSize: 12.sp,color: AppColors.grey),),
                     ],
                   ),
                 ),
                 SizedBox(height: 10.h,),
               ]),
         )),
     ); },);
  }
}
