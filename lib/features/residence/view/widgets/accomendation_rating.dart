import 'package:flutter/cupertino.dart';
import 'package:flutter_rating/flutter_rating.dart';

import '../../../../core/exports.dart';
import '../../cubit/residence_cubit.dart';
class HotelsModel {
  final String title;
  final String discription;
  final String image;
  final int rate;
  final void Function()? onTap;

  HotelsModel(  {required this.title,required this.rate,required this.discription, required this.image, this.onTap});
}
class AccomendationRating extends StatelessWidget {
   AccomendationRating({super.key,required this.hotelsModel});
  HotelsModel? hotelsModel;
  @override
  Widget build(BuildContext context) {
   return BlocBuilder<ResidenceCubit, ResidenceState>(builder: (BuildContext context, state) {  return   Padding(
     padding: const EdgeInsets.all(0.0),
     child: Expanded(
       //  height: getHeightSize(context) * 0.9,
         child: ListView.separated(
             physics: BouncingScrollPhysics(),
             shrinkWrap: true,
             // scrollDirection: Axis.horizontal,
             itemCount: 6,
             separatorBuilder: (context, index) => SizedBox(
               width: 10.w,
               height: 1.h,
             ),
             itemBuilder: (context, index) => Padding(
                 padding: const EdgeInsets.symmetric(vertical: 8.0),
                 child:CustomContainerWithShadow(
                   child: Row(children: [
                     //stack image and heart
                     Stack(
                       children: [
                         Container(
                           height: getHeightSize(context) * 0.23,
                           width: getWidthSize(context) * 0.4,
                           decoration: BoxDecoration(
                               color: AppColors.white,

                               borderRadius: BorderRadius.circular(20.r),
                               image: DecorationImage(
                                   image: NetworkImage(
                                       hotelsModel?.image.toString()??""),
                                   fit: BoxFit.cover)),
                         ),
                         Positioned(
                             top: 4.h,
                             right: 6.w,
                             child:
                             CircleAvatar(
                               backgroundColor: AppColors.lightWhite,
                               child: Icon(
                                 CupertinoIcons.heart,
                                 color: AppColors.secondPrimary,
                                 size: 25.sp,
                               ),
                             )
                         )
                       ],
                     ),
                     //  SizedBox(width: 5.w,),
                     //
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             SizedBox(height: 10.h,),
                             Text(hotelsModel?.title.toString()??"",overflow: TextOverflow.ellipsis,style: getSemiBoldStyle(fontSize: 14.sp),maxLines: 2,),

                             SizedBox(height: 20.h,),
                             Row(
                               children: [
                                 StarRating(
                                     rating: hotelsModel?.rate?.toDouble()??1,
                                     allowHalfRating: false,
                                     onRatingChanged: (rating){
                                       //   => setState(() => this.rating = rating
                                     }),
                               ],
                             ),
                             SizedBox(height: 1.h,),

                             Text(hotelsModel?.discription.toString()??"",style: getMediumStyle(fontSize: 12.sp,color: AppColors.grey),),
                           ],
                         ),
                       ),
                     )
                   ],),
                 )
             )
         )
     ),
   ); },);
  }
}
