import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/features/food/cubit/food_cubit.dart';
import 'package:travel_club/features/food/data/models/get_resturant_model.dart';
import 'package:travel_club/features/food/screens/details_of_food/screens/details_food_screen.dart';
import 'package:travel_club/features/food/widgets/small_container_food.dart';

import '../../../core/exports.dart';

class BigContainerFood extends StatelessWidget {
  const BigContainerFood({
    super.key,
    required this.resturantData,
  });

  final ResturantData resturantData;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (BuildContext context, state) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.detailsFoodRoute,
                arguments: DetailsFoodArgs(id: resturantData.id.toString()));
          },
          child: CustomContainerWithShadow(
              color: AppColors.white,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //small container
                      SmallContainerFood(resturantData: resturantData,),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 8.0),
                        child: Container(
                          child: Text(resturantData.name ?? ""),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            StarRating(
                                rating: double.tryParse(
                                        resturantData.rate.toString()) ??
                                    0,
                                size: 14.sp,
                                allowHalfRating: false,
                                emptyIcon: CupertinoIcons.star_fill,
                                filledIcon: CupertinoIcons.star_fill,
                                onRatingChanged: (rating) {
                                  //   => setState(() => this.rating = rating
                                }),
                            10.horizontalSpace,
                            Text(
                              "${resturantData.users} ${AppTranslations.personWhoRatedRestaurant}",
                              style: getMediumStyle(
                                  fontSize: 12.sp, color: AppColors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ]
                ),
              )),
        );
      },
    );
  }
}
