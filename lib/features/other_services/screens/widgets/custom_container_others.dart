import 'package:flutter/cupertino.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/features/entertainment/cubit/entertainment_cubit.dart';

import '../../../../core/exports.dart';

class CustomContainerOthers extends StatefulWidget {
  CustomContainerOthers({super.key,this.isDetails,this.isFavouriteScreen});
  bool ?isDetails;
  bool ?isFavouriteScreen;

  @override
  State<CustomContainerOthers> createState() => _CustomContainerOthersState();
}

class _CustomContainerOthersState extends State<CustomContainerOthers> {
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<EntertainmentCubit>();
    return BlocBuilder<EntertainmentCubit, EntertainmentState>(builder: (BuildContext context, state) {  return CustomContainerWithShadow(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(ImageAssets.logoImage,height: 61.h,width: 60.w,),
            ),
            SizedBox(width:5.w,),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("شركة سيكرت ترافيل",style: getSemiBoldStyle(fontSize: 14.sp,),),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Icon(Icons.favorite_border_outlined,color: AppColors.secondPrimary,),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: GestureDetector(
                      //     onTap: (){
                      //       setState(() {
                      //         cubit.isFavoriteTrue = !(cubit.isFavoriteTrue ?? false);
                      //       });
                      //
                      //     },
                      //     child:
                      //     widget.isFavouriteScreen==true? Icon(CupertinoIcons.heart_fill,color: AppColors.red,size: 25,):
                      //     CircleAvatar(
                      //       backgroundColor:  cubit.isFavoriteTrue==true?AppColors.red: AppColors.lightWhite,
                      //       child: Icon(
                      //         CupertinoIcons.heart,
                      //         color: cubit.isFavoriteTrue==true?AppColors.white: AppColors.secondPrimary,
                      //         size: 25.sp,
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Row(
                        children: [
                          StarRating(
                              rating: 4, size: 14.sp,
                             emptyIcon: CupertinoIcons.star_fill,
                      filledIcon: CupertinoIcons.star_fill,  allowHalfRating: false,
                              onRatingChanged: (rating){
                                //   => setState(() => this.rating = rating
                              }),
                        ],
                      ),
                      SizedBox(width: 5.w,),
                      Flexible(child: Text("200"+AppTranslations.personRateCompany,style:
                      widget.isDetails==true?
                      getMediumStyle(fontSize: 12.sp,color: AppColors.grey):
                      getUnderLine(color: AppColors.primary,fontSize: 12.sp),maxLines: 1,))
                    ],),
                  SizedBox(height: 20.h,),
                ],),
            )
          ]
          ,
        )
    ); },);
  }
}
