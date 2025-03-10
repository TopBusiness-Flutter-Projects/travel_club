import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/features/location/screens/position_map.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/food_cubit.dart';

class AboutWidgetFood extends StatelessWidget {
  const AboutWidgetFood({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (BuildContext context, state) {
        var cubit = context.read<FoodCubit>();
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //map
              PositionMap(
                  lat: double.tryParse(cubit
                              .getRestaurantDetailsModel?.data?.latitude
                              .toString() ??
                          "") ??
                      0,
                  long: double.tryParse(cubit
                              .getRestaurantDetailsModel?.data?.latitude
                              .toString() ??
                          "") ??
                      0),
              SizedBox(height: 30.h),

              Text(
                AppTranslations.about,
                style: getMediumStyle(
                  color: AppColors.secondPrimary,
                  fontSize: 14.sp,
                ),
              ),
              Text(
                cubit.getRestaurantDetailsModel?.data?.about.toString() ?? '',
                style: getMediumStyle(
                  fontSize: 14.sp,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(height: 10.h),
              //communication
              Text(
                AppTranslations.workingHours,
                style: getMediumStyle(
                  color: AppColors.secondPrimary,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 10.h),
              cubit.getRestaurantDetailsModel?.data?.times?.isEmpty ?? false
                  ? Text(
                      "no_working_hours".tr(),
                      style: getMediumStyle(
                          fontSize: 14.sp, color: AppColors.grey),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cubit
                              .getRestaurantDetailsModel?.data?.times?.length ??
                          0,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(
                        "${(cubit.getRestaurantDetailsModel?.data?.times?[index].fromDay ?? '').tr()} ${cubit.getRestaurantDetailsModel?.data?.times?[index].from.toString() ?? ''} - ${cubit.getRestaurantDetailsModel?.data?.times?[index].to.toString() ?? ''}",
                          style: getMediumStyle(
                              fontSize: 14.sp, color: AppColors.grey),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 5.h,
                        );
                      },
                    )
            ],
          ),
        );
      },
    );
  }
}
