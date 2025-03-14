//big conatiner

import 'package:travel_club/features/my_bookings/view/food_booking/widgets/small_container_food.dart';

import '../../../../../../core/exports.dart';
import '../../../cubit/my_bookings_cubit.dart';
import '../../../cubit/my_bookings_state.dart';

class FoodModel {
  String? title;
  int? rate;
  String? date;
  String? price;
  String? numofnights;
  bool? status;
  String? numOfBooking;
  void Function()? onTap;

  FoodModel({
    this.numofnights,
    this.onTap,
    this.title,
    this.rate,
    this.status = true,
    this.date,
    this.price,
    this.numOfBooking,
  });
}

//big conatiner
class CustomBookingFoodContainerBig extends StatelessWidget {
  CustomBookingFoodContainerBig({super.key, required this.foodModel});
  final FoodModel foodModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyReservationsCubit, MyReservationsState>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomContainerWithShadow(
              child: Column(
            children: [
              //custom container

              CustomBookingFoodContainerSmall(
                foodModel: FoodModel(
                  title:foodModel.title,
                  rate: foodModel.rate,
                  date: foodModel.date,
                  price: foodModel.price,
                  numOfBooking:foodModel.numOfBooking,
                  numofnights: foodModel.numofnights,
                ),
              ),
              //Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if(foodModel.numOfBooking!=null)...[
                            Text(
                              AppTranslations.numberBooking,
                              style: getRegularStyle(color: AppColors.grey),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              foodModel.numOfBooking.toString(),
                              style: getMediumStyle(),
                            ),
                          ],

                          SizedBox(
                            height: 5.h,
                          ),
                          Center(
                            child: CustomContainerWithShadow(
                              reduis: 7,
                              isShadow: false,
                              color: foodModel.status == true
                                  ? AppColors.green.withOpacity(.12)
                                  : AppColors.red.withOpacity(.12),
                              width: 100.w,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6.0, vertical: 7),
                                child: Center(
                                    child: Text(
                                  foodModel.status == true
                                      ? AppTranslations.bookingSuccess
                                      : AppTranslations.cancelBooking,
                                  style: getMediumStyle(
                                      fontSize: 14.sp,
                                      color: foodModel.status == true
                                          ? AppColors.green
                                          : AppColors.red),
                                  maxLines: 1,
                                )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.calendar,
                                color: AppColors.secondPrimary,
                              ),
                              Text(
                                foodModel.date.toString() ?? "",
                                style: getRegularStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            AppTranslations.bookingPrice,
                            style: getRegularStyle(
                                fontSize: 14.sp, color: AppColors.grey),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            foodModel.price.toString() +
                                " " +
                                AppTranslations.currency,
                            style: getSemiBoldStyle(
                                fontSize: 14.sp, color: AppColors.primary),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                        ]),
                  )
                ],
              ),
              //SizedBox
              SizedBox(
                height: 5.h,
              )
            ],
          )),
        );
      },
    );
  }
}
