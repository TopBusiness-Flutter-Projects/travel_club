import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/widgets/no_data_widget.dart';
import 'package:travel_club/features/food/screens/details_of_food/widgets/rating_widget.dart';
import 'package:travel_club/features/food/screens/details_of_food/widgets/sub_toggle_buttons.dart';
import 'package:travel_club/features/food/screens/details_of_food/widgets/toggle_container.dart';
import '../../../../../../core/exports.dart';
import '../../../cubit/food_cubit.dart';
import 'about_widget.dart';
import 'custom_menue_container.dart';

class ContainerUnderSwiperFood extends StatelessWidget {
  const ContainerUnderSwiperFood({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FoodCubit>();
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (BuildContext context, state) {
        return Positioned(
          bottom: 0,
          child: Container(
            height: getHeightSize(context) * 0.59,
            width: getWidthSize(context),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.r),
                topRight: Radius.circular(18.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: getHeightSize(context) * 0.17,
              ),
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //togle
                  ToggleButtonsFood(),
                  //sub
                  if (cubit.selectedIndexMenue == 0) ...[
                    SubToggleButtonsFood(),
                    cubit.categoryMenuModel.data == null ||
                            cubit.categoryMenuModel.data?.length == 0
                        ? SizedBox(
                            height: 0.h,
                          )
                        : cubit.getMenuMealsModel.data == null
                            ? Padding(
                                padding: EdgeInsets.only(top: 50.h),
                                child: const CustomLoadingIndicator(),
                              )
                            : cubit.getMenuMealsModel.data?.isEmpty ?? true
                                ? Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 50.h),
                                      child:
                                          NoDataWidget(title: "no_data".tr()),
                                    ),
                                  )
                                : ListView.separated(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount:
                                        cubit.getMenuMealsModel.data?.length ??
                                            0,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CustomMenueContainer(
                                        mealModel: cubit
                                            .getMenuMealsModel.data![index],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(height: 10.h);
                                    },
                                  ),
                  ]
                  //about
                  else if (cubit.selectedIndexMenue == 1) ...[
                    SizedBox(
                      height: 9.h,
                    ),
                    const AboutWidgetFood(
                   
                    ),
                    // ListView.separated(
                    //   shrinkWrap: true,
                    //   physics: BouncingScrollPhysics(),
                    //   itemCount: 5, itemBuilder: (BuildContext context, int index) {
                    //   return CustomMenueContainer();
                    //         }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 10.h); },),
                    SizedBox(
                      height: 100.h,
                    )
                  ]
                  // rating()
                  else ...[
                    SizedBox(
                      height: 9.h,
                    ),
                    cubit.getRestaurantDetailsModel == null
                        ? const Center(
                            child: CustomLoadingIndicator(),
                          )
                        : cubit.getRestaurantDetailsModel!.data!.rates
                                    ?.isNotEmpty ??
                                false
                            ? Expanded(
                                child: Center(
                                    child: NoDataWidget(
                                title: "no_data".tr(),
                              )))
                            : ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: cubit.getRestaurantDetailsModel!
                                        .data!.rates?.length ??
                                    0,
                                itemBuilder: (BuildContext context, int index) {
                                  return RatingWidgetFood(
                                    rates: cubit.getRestaurantDetailsModel!
                                        .data!.rates![index],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 10.h,
                                  );
                                },
                              ),
                    SizedBox(
                      height: 100.h,
                    )
                  ]
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
