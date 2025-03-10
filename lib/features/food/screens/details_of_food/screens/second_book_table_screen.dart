import 'package:travel_club/features/food/cubit/food_cubit.dart';

import '../../../../../core/exports.dart';
import '../../../../payment/screens/widgets/custom_price_widget.dart';
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
          body: 
Padding(
              padding: const EdgeInsets.all(12.0),            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cubit.getRestaurantDetailsModel?.data?.name ?? "",
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
                  CustomPricesWidget(
                    totalPrice: cubit.addFoodReservationModel.data?.totalPrice.toString()??"0",
                    totalPriceAfterVat:  cubit.addFoodReservationModel.data?.totalPriceAfterVat.toString()??"0",
                    vat:  cubit.addFoodReservationModel.data?.vat.toString()??"0",
                    terms:cubit.getRestaurantDetailsModel?.data?.rule??"",
                    reservationId:  cubit.addFoodReservationModel.data?.reservationId??0,
                  ),
                  SizedBox(
                    height: 5.h,
                  )
                ],
              ),
            ),
          ));
    });
  }
}
