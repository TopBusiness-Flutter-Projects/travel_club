import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/app.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/features/location/cubit/location_cubit.dart';
import 'package:travel_club/features/location/cubit/location_state.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/food_cubit.dart';

class CustomContainerFood extends StatefulWidget {
  CustomContainerFood({super.key, this.isDetails, this.isBooking});
  bool? isDetails;
  bool? isBooking = true;

  @override
  State<CustomContainerFood> createState() => _CustomContainerFoodState();
}

class _CustomContainerFoodState extends State<CustomContainerFood> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
        builder: (BuildContext context, state) {
      var cubit = context.read<FoodCubit>();
      return CustomContainerWithShadow(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 5.w,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    cubit.getRestaurantDetailsModel?.data?.name ?? '',
                    style: getSemiBoldStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          StarRating(
                              rating: double.tryParse(cubit
                                          .getRestaurantDetailsModel?.data?.rate
                                          .toString() ??
                                      '0') ??
                                  0,
                              size: 14.sp,
                              allowHalfRating: false,
                              onRatingChanged: (rating) {
                                //   => setState(() => this.rating = rating
                              }),
                        ],
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' ${cubit.getRestaurantDetailsModel?.data?.users.toString()}' +
                                AppTranslations.personRateCompany,
                            style: widget.isDetails == true
                                ? getMediumStyle(
                                    fontSize: 12.sp, color: AppColors.grey)
                                : getUnderLine(
                                    color: AppColors.primary, fontSize: 12.sp),
                            maxLines: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              SvgPicture.asset(AppIcons.point
                              ,color: cubit.getRestaurantDetailsModel
                                                  ?.data?.isOpen ==
                                              1
                                          ? AppColors.green
                                          : AppColors.red,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 7.0, right: 7.0),
                                child: Text(
                                  cubit.getRestaurantDetailsModel?.data
                                              ?.isOpen ==
                                          1
                                      ? "opened".tr()
                                      : "closed".tr(),
                                  style: getMediumStyle(
                                      fontSize: 12.sp,
                                      color: cubit.getRestaurantDetailsModel
                                                  ?.data?.isOpen ==
                                              1
                                          ? AppColors.green
                                          : AppColors.red),
                                ),
                              )
                            ]),
                          ),
                        ],
                      ),
                      Row(                                                                                                                     
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(AppIcons.location),
                            Flexible(child:
                                BlocBuilder<LocationCubit, LocationState>(
                                    builder: (BuildContext context, state) {
                              return Text(
                                context.read<LocationCubit>().address ?? "",
                                maxLines: 2,
                                style: getRegularStyle(fontSize: 12.sp),
                              );
                            })),
                            SizedBox(
                              width: 5.w,
                            ),
                            widget.isBooking == false
                                ? Flexible(child: Container())
                                : Flexible(
                                    child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: CustomButton(
                                      title: AppTranslations.bookTable,
                                      onTap: () {
                                        //cubit.cartItems.isNotEmpty?
                                        checkLoggingStatus(context,
                                                onPressed: () {
                                          Navigator.pushNamed(
                                              context, Routes.bookTable,
                                              arguments: cubit
                                                  .getRestaurantDetailsModel
                                                  ?.data
                                                  ?.id
                                                  .toString());
                                        })
                                            // :
                                            // errorGetBar("add items to cart first")
                                            ;
                                      },
                                    ),
                                  ))
                          ]),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ));
    });
  }
}
