//small conatiner
import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/features/residence/view/widgets/residence_widgets/accomendation_rating.dart';

import '../../../../../../core/exports.dart';
import '../../../../residence/data/models/lodges_model.dart';

class CustomBookingAccommodationContainerSmall extends StatefulWidget {
  const CustomBookingAccommodationContainerSmall({super.key,required this.lodgeModel});
 final LodgeModel lodgeModel;

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
        
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomContainerWithShadow(
              border: true,
              child: Row(children: [

                //stack image and heart
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                  
                          borderRadius: BorderRadius.circular(20.r),
                          image: DecorationImage(
                              image: NetworkImage(
                                  widget.lodgeModel.media.toString()??""),
                              fit: BoxFit.cover)),
                    ),
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
                      Text(widget.lodgeModel.name.toString(),overflow: TextOverflow.ellipsis,style: getSemiBoldStyle(fontSize: 14.sp),maxLines: 2,),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          StarRating(
                              rating: widget.lodgeModel.rate.toDouble()??1,
                              allowHalfRating: false, size: 14.sp,
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
                      // widget.lodgeModel.==null?SizedBox():
                      // Text(widget.lodgeModel?.discription.toString()??"",style: getMediumStyle(fontSize: 12.sp,color: AppColors.grey),),
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
