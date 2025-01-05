import 'package:flutter/cupertino.dart';
import '../../../core/exports.dart';
import '../cubit/food_cubit.dart';

class SmallContainerFood extends StatelessWidget {
   SmallContainerFood({super.key,this.index,this.isFavouriteScreen});
  int? index=0;
  bool ?isFavouriteScreen;
  @override
  Widget build(BuildContext context) {
    var cubit= context.read<FoodCubit>();
   return BlocBuilder<FoodCubit,FoodState>(builder: (BuildContext context, state) {  return
     CustomContainerWithShadow(
       color: AppColors.secondPrimary,
       reduis: 30.r,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Stack(
             clipBehavior: Clip.none,
             children: [
               //image
               ClipRRect(
                   borderRadius: BorderRadius.circular(20),
                   child: Image.network("https://th.bing.com/th/id/OIP.JBxw3Aka6WKjRmKaqg1P8wHaE8?w=1200&h=800&rs=1&pid=ImgDetMain",fit: BoxFit.cover,height: getHeightSize(context)*.2,width: double.infinity,)),
               // cubit.isFavorite==true?
               isFavouriteScreen==false?
               Positioned(
                   top: 4.h,
                   right: 6.w,
                   child: GestureDetector(
                     onTap: (){

                       cubit.changeFavourite(index!);
                     },
                     child: CircleAvatar(
                       backgroundColor:  cubit.isFavoriteTrue==true?AppColors.red: AppColors.lightWhite,
                       child: Icon(
                         CupertinoIcons.heart,
                         color:  cubit.isFavoriteTrue==true?AppColors.white: AppColors.secondPrimary,
                         size: 25.sp,
                       ),
                     ),
                   )
               ):
               Positioned(
                   top: 4.h,
                   right: 6.w,
                   child: GestureDetector(
                     onTap: (){

                       cubit.changeFavourite(index!);
                     },
                     child: CircleAvatar(
                       backgroundColor: AppColors.red,
                       child: Icon(
                         CupertinoIcons.heart,
                         color:  AppColors.white,
                         size: 25.sp,
                       ),
                     ),
                   )
               ),
               //image in bottom
               Positioned(
                   bottom: -20.h,
                   left: 6.w,
                   child: GestureDetector(
                     onTap: (){
                       cubit.changeFavourite(index!);
                     },
                     child: CustomContainerWithShadow(
                       //backgroundColor:  cubit.isFavoriteTrue==true?AppColors.red: AppColors.lightWhite,
                         child: Image.asset(ImageAssets.foodContainer,width: 57.w,height: 57.h,)
                     ),
                   )
               )
               //:Container()
             ],
           ),
         ]
         ,)
     );
     },
   );
  }
}
