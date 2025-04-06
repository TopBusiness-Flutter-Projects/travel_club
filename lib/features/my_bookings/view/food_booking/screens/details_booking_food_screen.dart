import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/food/data/models/get_menu_meals_model.dart';
import 'package:travel_club/features/my_bookings/cubit/my_bookings_state.dart';
import 'package:travel_club/features/my_bookings/view/widgets/custom_buttons.dart';
import 'package:travel_club/features/payment/screens/widgets/custom_price_widget.dart';

import '../../../cubit/my_bookings_cubit.dart';
import '../../../data/models/food_reservation_details.dart';
import '../../../data/models/food_reservation_model.dart';
import '../widgets/big_container_food.dart';
import '../widgets/member_details.dart';

class FoodDetailsBookingArguments {
  final ReservationFood foodReservationModel;
  FoodDetailsBookingArguments({required this.foodReservationModel});
}

class DetailsBookingFood extends StatefulWidget {
  final FoodDetailsBookingArguments arguments;

  const DetailsBookingFood({super.key, required this.arguments});

  @override
  State<DetailsBookingFood> createState() => _DetailsBookingFoodState();
}

class _DetailsBookingFoodState extends State<DetailsBookingFood> {
  @override
  void initState() {
    context.read<MyReservationsCubit>().foodReservationDetails =
        GetFoodReservationDetailsModel();
    context.read<MyReservationsCubit>().getReservationDetails(
        reservationId: widget.arguments.foodReservationModel.id!);
    // TODO: implement initState
    // context.read<TransportationCubit>().isGoOnly = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MyReservationsCubit>();
    return BlocBuilder<MyReservationsCubit, MyReservationsState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
          appbarTitle: AppTranslations.detailsBooking,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  if (cubit.foodReservationDetails.data?.meals?.isNotEmpty ??
                      false)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StaggeredGrid.count(
                        crossAxisCount: 2,
                        children: List.generate(
                          cubit.foodReservationDetails.data?.meals?.length ?? 0,
                          (index) => CustomMealContainerBooking(
                            mealModel: cubit
                                .foodReservationDetails.data!.meals![index],
                            isSecondBooking: true,
                          ),
                        ),
                      ),
                    ),
                  CustomBookingFoodContainerBig(
                    foodModel: FoodModel(
                        numofnights: widget
                            .arguments.foodReservationModel.process
                            .toString(),
                        price: widget.arguments.foodReservationModel.totalPrice
                            .toString(),
                        title: widget.arguments.foodReservationModel.restaurant
                            .toString(),
                        date: widget.arguments.foodReservationModel.date
                            .toString(),
                        rate: widget.arguments.foodReservationModel.rate,
                        numOfBooking:
                            widget.arguments.foodReservationModel.transactionId,
                        status: true),
                  ), //text

                  //from and to date

                  SizedBox(
                    height: 30.h,
                  ),
                  if (state is FailureGetReservationDetailsState)
                    const Center(
                      child: Text(
                        "server error",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  else if (cubit.foodReservationDetails.data == null)
                    Center(child: CustomLoadingIndicator())
                  else ...[
                    MemberDetails(
                      foodReservationDetails:
                          cubit.foodReservationDetails.data ??
                              FoodReservationDetails(),
                      date:
                          widget.arguments.foodReservationModel.date.toString(),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    if (widget.arguments.foodReservationModel.process == 0)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomPricesWidget(
                          totalPrice: cubit
                              .foodReservationDetails.data!.totalPrice
                              .toString(),
                          totalPriceAfterVat: cubit
                              .foodReservationDetails.data!.totalPriceAfterVat
                              .toString(),
                          vat:
                              cubit.foodReservationDetails.data!.vat.toString(),
                          terms: cubit.foodReservationDetails.data!.rule
                              .toString(),
                          reservationId:
                              cubit.foodReservationDetails.data?.id ?? 0,
                        ),
                      ),
                    if (cubit.foodReservationDetails.data!.canCancel != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CancelReservationButton(
                          reservationid:
                              widget.arguments.foodReservationModel.id ?? 0,
                        ),
                      ),
                    if (widget.arguments.foodReservationModel.process == 2 &&
                        cubit.foodReservationDetails.data?.isRated == false)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RateReservationButton(
                          reservationId:
                              widget.arguments.foodReservationModel.id ?? 0,
                          id: cubit.foodReservationDetails.data?.restaurantId ??
                              0,
                        ),
                      ),
                    SizedBox(
                      height: 40.h,
                    )
                  ]

//button
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: CustomButton(
                  //         color: AppColors.red,
                  //         title: AppTranslations.cancelBooking,
                  //         onTap: () {
                  //           Navigator.pushNamed(context, Routes.payment);
                  //         },
                  //       ),
                  //     ),
                  //     SizedBox(width: 10.w), // Add spacing between buttons
                  //     Expanded(
                  //         child: CustomRoundedButton(
                  //       title: AppTranslations.experienceEvaluation,
                  //       onTap: () {
                  //         showAddRateBottomSheet(context);
                  //         // Navigator.pushNamed(context, Routes.);
                  //       },
                  //     )),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 40.h,
                  // )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomMealContainerBooking extends StatelessWidget {
  const CustomMealContainerBooking({
    super.key,
    this.isSecondBooking = false,
    required this.mealModel,
  });

  final MealModel mealModel;

  final bool isSecondBooking;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: CustomContainerWithShadow(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImage(
              image: mealModel.image ?? "",
              borderRadius: 20.r,
              height: 100.h,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "${mealModel.title ?? ""}" "\n",
                    maxLines: 2,
                    style: getSemiBoldStyle(fontSize: 14.sp, fontHeight: 1),
                  ),
                  AutoSizeText(
                    '${mealModel.priceAfterDiscount} * ${mealModel.count}',
                    maxLines: 2,
                    style: getSemiBoldStyle(fontSize: 14.sp, fontHeight: 1),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  AutoSizeText(
                    "${mealModel.priceAfterDiscount * mealModel.count ?? ""} ${AppTranslations.currency}",
                    maxLines: 1,
                    style: getSemiBoldStyle(
                        fontSize: 13.sp, fontHeight: 1, color: AppColors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
