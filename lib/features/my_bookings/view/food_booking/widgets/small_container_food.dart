//small conatiner
import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/features/my_bookings/view/food_booking/widgets/big_container_food.dart';

import '../../../../../../core/exports.dart';
import '../../../../accommodation/view/widgets/acommendation_widgets/accomendation_rating.dart';

class CustomBookingFoodContainerSmall extends StatelessWidget {
  CustomBookingFoodContainerSmall({super.key, required this.foodModel});
  FoodModel? foodModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          onTap: foodModel?.onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomContainerWithShadow(
              border: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(height: 10.h,),
                      Text(
                        foodModel?.title.toString() ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: getSemiBoldStyle(fontSize: 14.sp),
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          StarRating(
                              rating: foodModel?.rate?.toDouble() ?? 1,
                              allowHalfRating: false,
                              onRatingChanged: (rating) {
                                //   => setState(() => this.rating = rating
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      // foodModel?.discription==null?SizedBox():
                      // Text(foodModel?.discription.toString()??"",style: getMediumStyle(fontSize: 12.sp,color: AppColors.grey),),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
