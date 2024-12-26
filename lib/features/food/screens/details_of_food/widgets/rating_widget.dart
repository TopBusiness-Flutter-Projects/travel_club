import 'package:flutter_rating/flutter_rating.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/food_cubit.dart';

class RatingWidgetFood extends StatelessWidget {
  const RatingWidgetFood({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(builder: (BuildContext context, state) {
      return    Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomContainerWithShadow(child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      radius: 25.r,
                      backgroundColor: AppColors.grey.withOpacity(.2),
                      backgroundImage: const AssetImage(ImageAssets.profile)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("احمد مختار",style: getSemiBoldStyle(fontSize: 14.sp),),
                              //   Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  StarRating(
                                      rating: 4,
                                      allowHalfRating: false,
                                      onRatingChanged: (rating){
                                        //   => setState(() => this.rating = rating
                                      }),
                                ],
                              ),
                            ]),
                        SizedBox(height: 10.h,),
                        Text("المكان ممتاز والخدمه كان عاليه جدا والاكل جودته محترمه شكرا جدا شيف محمد",style: getRegularStyle(fontSize: 12.sp,color: AppColors.grey),),
                      ],
                    ),
                  ),
                )
              ]),
        )),
      );
    },);
  }
}
