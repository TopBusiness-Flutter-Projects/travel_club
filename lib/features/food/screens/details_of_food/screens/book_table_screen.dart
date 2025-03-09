import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/core/widgets/custom_text_form_field.dart';
import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/food/cubit/food_cubit.dart';
import 'package:travel_club/features/food/data/models/get_menu_meals_model.dart';

import '../../../../../core/exports.dart';
import '../../../../transportation/screens/widgets/custom_from_to_date.dart';

class BookTableScreen extends StatelessWidget {
   BookTableScreen({super.key, required this.id});
  String id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
        builder: (BuildContext context, state) {
      var cubit = context.read<FoodCubit>();
      return CustomScreen(
          appbarTitle: AppTranslations.bookTable,
          body: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
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
                              (index) => CustomMealContainer(mealModel: cubit.cartItems[index],),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            AppTranslations.selectBookingDate,
                            style: getMediumStyle(fontSize: 14.sp),
                          ),
                          SizedBox(height: getHeightSize(context)/90),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 4.0.w),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.lightWhite2,
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(18.h),
                                  child: DatePickerField(
                                    selectedDate: cubit.singleDate,
                                    isSingle: true,
                                    onTap: () {
                                      cubit.onSelectedDateSingle(context: context);
                                    },
                                  ),
                                )),
                          ),
                          SizedBox(height: getHeightSize(context)/90),

                          Text(
                            AppTranslations.numberOfAttendees,
                            style: getMediumStyle(fontSize: 14.sp),
                          ),
                          CustomTextField(
                            controller: cubit.countUsers,
                            hintText: "٤ اشخاص",
                          ),
                          SizedBox(height: getHeightSize(context)/90),

                          Text(
                            AppTranslations.nameOwner,
                            style: getMediumStyle(fontSize: 14.sp),
                          ),
                          CustomTextField(
                            controller: cubit.nameUser,
                            hintText: "احمد مختار علي",
                          ),
                          SizedBox(height: getHeightSize(context)/90),

                          Text(
                            AppTranslations.numberOfPhoneContact,
                            style: getMediumStyle(fontSize: 14.sp),
                          ),
                          CustomTextField(
                            controller: cubit.phoneUser,

                            hintText: "٠١١٢٦٠٥٣٤٥٢",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomButton(
                      title: AppTranslations.bookTable,
                      onTap: () {
                        cubit.addRestaurantReservation(context, id);

                        // Navigator.pushNamed(context, Routes.secondBookingFood,
                        //     arguments: true);
                      }),
                ),
              ],
            ),
          ));
    });
  }
}

class CustomMealContainer extends StatelessWidget {
  const CustomMealContainer({
    super.key,
    this.isSecondBooking = false,
    required this.mealModel,
  });

  final MealModel mealModel;

  final bool isSecondBooking;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
        builder: (BuildContext context, state) {
      var cubit = context.read<FoodCubit>();
      return Padding(
        padding: const EdgeInsets.all(3.0),
        child: CustomContainerWithShadow(
          child: Column(
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
                      "${mealModel.title ?? ""}" + "\n",
                      maxLines: 2,
                      style: getSemiBoldStyle(fontSize: 14.sp, fontHeight: 1),
                    ),
                    AutoSizeText(
                      "${mealModel.priceAfterDiscount ?? ""}" +
                          " " +
                          AppTranslations.currency,
                      maxLines: 1,
                      style: getSemiBoldStyle(
                          fontSize: 13.sp,
                          fontHeight: 1,
                          color: AppColors.green),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    isSecondBooking
                        ? AutoSizeText(
                            "عدد" + " " + '${mealModel.userQty}',
                            maxLines: 2,
                            style: getSemiBoldStyle(
                                fontSize: 14.sp, fontHeight: 1),
                          )
                        : Row(
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
                                  size: 30.sp,
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
                                    size: 30.sp,
                                  ),
                                ),
                              ],
                            ],
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
