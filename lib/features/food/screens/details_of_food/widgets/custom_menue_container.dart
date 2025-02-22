import 'package:flutter/cupertino.dart';
import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/food/cubit/food_cubit.dart';
import 'package:travel_club/features/food/data/models/get_menu_meals_model.dart';

import '../../../../../core/exports.dart';

class CustomMenueContainer extends StatelessWidget {
  const CustomMenueContainer({super.key, required this.mealModel});
  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (BuildContext context, state) {
        var cubit = context.read<FoodCubit>();

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomContainerWithShadow(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomNetworkImage(
                    image: mealModel.image ?? "",
                    borderRadius: 20.r,
                    height: 61.h,
                    width: 61.h,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                mealModel.title ?? "",
                                style: getSemiBoldStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    cubit.addOrRemoveFromBasket(
                                      context,
                                      isAdd: true,
                                      product: mealModel,
                                    );
                                  },
                                  child: Icon(
                                    CupertinoIcons.add_circled,
                                    color: AppColors.primary,
                                    size: 20.sp,
                                  ),
                                ),
                                if (mealModel.userQty > 0) ...[
                                  Text(
                                    " ${mealModel.userQty} ",
                                    style: getSemiBoldStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.primary),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      cubit.addOrRemoveFromBasket(
                                        context,
                                        isAdd: false,
                                        product: mealModel,
                                      );
                                    },
                                    child: Icon(
                                      CupertinoIcons.minus_circled,
                                      color: AppColors.primary,
                                      size: 20.sp,
                                    ),
                                  ),
                                ],
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "ربع دجاج صدر - طبق سلطة طحينة - ارز بسمتي",
                          style: getRegularStyle(
                              fontSize: 12.sp, color: AppColors.grey),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                " 1000" + AppTranslations.currency,
                                style: getSemiBoldStyle(
                                    fontSize: 13.sp, color: AppColors.green),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "1520" + AppTranslations.currency,
                                style: getThroughLine(
                                  color: AppColors.grey,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
