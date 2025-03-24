import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/features/location/screens/position_map.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/entertainment_cubit.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key,required this.about,required this.lat,required this.long});
 final String about;
 final String lat;
 final String long;
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<EntertainmentCubit>();
  return BlocBuilder<EntertainmentCubit, EntertainmentState>(builder: (BuildContext context, state) {
    return    Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppTranslations.about,
            style: getMediumStyle(
              color: AppColors.secondPrimary,
              fontSize: 14.sp,
            ),
          ),
          Text(
            about,
            style: getMediumStyle(
              fontSize: 14.sp,
              color: AppColors.grey,
            ),
          ),
          SizedBox(height: 10.h),
          //communication
          // Text(
          //   AppTranslations.communication,
          //   style: getMediumStyle(
          //     color: AppColors.secondPrimary,
          //     fontSize: 14.sp,
          //   ),
          // ),
       //   ContactButtonsScreen(),
          SizedBox(height: 10.h),
          //map
        PositionMap(lat: double.parse(lat), long: double.parse(long),),
          SizedBox(height: 20.h),
        Text(
          AppTranslations.workingHours,
          style: getMediumStyle(
            color: AppColors.secondPrimary,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 10.h),
      cubit.getOrganizationsDetailsModel  ?.data?.hours?.isEmpty ?? false
            ? Text(
          "no_working_hours".tr(),
          style: getMediumStyle(
              fontSize: 14.sp, color: AppColors.grey),
        )
            : ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount:   cubit.getOrganizationsDetailsModel?.data?.hours?.length ??
              0,
          itemBuilder: (BuildContext context, int index) {
            return Text(
              "${(cubit.getOrganizationsDetailsModel?.data?.hours?[index].fromDay ?? '').tr()} ${cubit.getOrganizationsDetailsModel?.data?.hours?[index].from.toString() ?? ''} - ${cubit.getOrganizationsDetailsModel?.data?.hours?[index].to.toString() ?? ''}",
              style: getMediumStyle(
                  fontSize: 14.sp, color: AppColors.grey),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 5.h,
            );
          },
        ),
          SizedBox(height: 30.h,)
    ],)
    );
  },);
  }
}
