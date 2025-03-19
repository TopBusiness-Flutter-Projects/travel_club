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
          SizedBox(height: 30.h),
        ],),
    );
  },);
  }
}
