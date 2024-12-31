import 'package:flutter/cupertino.dart';
import 'package:travel_club/features/entertainment/cubit/entertainment_cubit.dart';
import 'package:travel_club/features/food/cubit/food_cubit.dart';

import '../../../../../core/exports.dart';

class CustomMenueContainer extends StatelessWidget {
  const CustomMenueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (BuildContext context, state) {
        var cubit = context.read<FoodCubit>();

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomContainerWithShadow(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    ImageAssets.foodContainer,
                    height: 61.h,
                    width: 60.w,
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
                                "وجبة الدجاج المحموجبة الدجاج المحموجبة الدجاج المحمر",
                                style: getSemiBoldStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    cubit.addOrRemoveMenuCart(true);
                                  },
                                  child: Icon(
                                    CupertinoIcons.add_circled,
                                    color: AppColors.primary,
                                    size: 20.sp,
                                  ),
                                ),
                                if (cubit.itemsQty > 0) ...[
                                  Text(
                                    " ${cubit.itemsQty} ",
                                    style: getSemiBoldStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.primary),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      cubit.addOrRemoveMenuCart(false);
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
