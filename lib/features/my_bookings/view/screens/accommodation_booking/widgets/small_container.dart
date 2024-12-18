//small conatiner
import 'package:flutter_rating/flutter_rating.dart';

import '../../../../../../core/exports.dart';
import '../../../../../accommodation/view/widgets/acommendation_widgets/accomendation_rating.dart';

class CustomBookingAccommodationContainerSmall extends StatelessWidget {
  CustomBookingAccommodationContainerSmall({super.key,required this.hotelsModel});
  HotelsModel? hotelsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child:GestureDetector(
          onTap: hotelsModel?.onTap ,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomContainerWithShadow(
              border: true,
              child: Row(children: [

                //stack image and heart
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                        color: AppColors.white,

                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                            image: NetworkImage(
                                hotelsModel?.image.toString()??""),
                            fit: BoxFit.cover)),
                  ),
                ),

                //  SizedBox(width: 5.w,),
                //
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(height: 10.h,),
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
                      SizedBox(height: 2.h,),
                      hotelsModel?.discription==null?SizedBox():
                      Text(hotelsModel?.discription.toString()??"",style: getMediumStyle(fontSize: 12.sp,color: AppColors.grey),),
                    ],
                  ),
                )
              ],),
            ),
          ),
        )
    );
  }
}