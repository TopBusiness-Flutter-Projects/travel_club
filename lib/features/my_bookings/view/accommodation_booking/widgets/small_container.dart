//small conatiner
import 'package:flutter_rating/flutter_rating.dart';

import '../../../../../../core/exports.dart';
import '../../../../accommodation/view/widgets/acommendation_widgets/accomendation_rating.dart';

class CustomBookingAccommodationContainerSmall extends StatefulWidget {
  CustomBookingAccommodationContainerSmall({super.key,required this.hotelsModel});
  HotelsModel? hotelsModel;

  @override
  State<CustomBookingAccommodationContainerSmall> createState() => _CustomBookingAccommodationContainerSmallState();
}

class _CustomBookingAccommodationContainerSmallState extends State<CustomBookingAccommodationContainerSmall> {
  double rating = 1; // Default rating

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child:GestureDetector(
          onTap: widget.hotelsModel?.onTap ,
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
                                widget.hotelsModel?.image.toString()??""),
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
                      Text(widget.hotelsModel?.title.toString()??"",overflow: TextOverflow.ellipsis,style: getSemiBoldStyle(fontSize: 14.sp),maxLines: 2,),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          StarRating(
                              rating: widget.hotelsModel?.rate.toDouble()??1,
                              allowHalfRating: false,
                              // onRatingChanged: (rating){
                              //   setState(() {
                              //     this.rating = rating;
                              //   });
                                //   => setState(() => this.rating = rating
                                // setState(() => this.rating = rating));
                              //}
              onRatingChanged: (newRating) {
        setState(() {
        this.rating = newRating;
        });
        },
                              ),
                        ],
                      ),
                      SizedBox(height: 2.h,),
                      widget.hotelsModel?.discription==null?SizedBox():
                      Text(widget.hotelsModel?.discription.toString()??"",style: getMediumStyle(fontSize: 12.sp,color: AppColors.grey),),
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