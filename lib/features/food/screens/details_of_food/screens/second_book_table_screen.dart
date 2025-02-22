import 'package:flutter/cupertino.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/core/widgets/custom_text_form_field.dart';
import 'package:travel_club/features/food/cubit/food_cubit.dart';

import '../../../../../core/exports.dart';
import '../../../../payment/screens/widgets/custom_price_widget.dart';
import '../../../../transportation/screens/widgets/custom_from_to_date.dart';
import 'book_table_screen.dart';

class SecondBookTableScreen extends StatelessWidget {
  const SecondBookTableScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
        builder: (BuildContext context, state) {
      var cubit = context.read<FoodCubit>();
      return CustomScreen(
          appbarTitle: AppTranslations.bookTable,
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "مطعم صبحي كابر روض الفرج",
                          style: getSemiBoldStyle(fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        StaggeredGrid.count(
                          crossAxisCount: 2,
                          children: List.generate(
                            cubit.cartItems.length,
                            (index) => CustomMealContainer(
                              mealModel: cubit.cartItems[index],
                              isSecondBooking: true,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CustomPricesWidget(
                totalPrice: "50",
                totalPriceAfterVat: "40",
                vat: "40",
                terms: "nono",
                reservationId: 1,
              ),
              SizedBox(
                height: 5.h,
              )
            ],
          ));
    });
  }
}
