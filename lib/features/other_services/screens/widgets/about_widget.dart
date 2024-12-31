import 'package:travel_club/features/entertainment/screens/details_of_entertainment/widgets/custom_contact_container.dart';
import 'package:travel_club/features/location/screens/position_map.dart';
import 'package:travel_club/features/other_services/cubit/other_services_cubit.dart';
import 'package:travel_club/features/other_services/cubit/other_services_state.dart';

import '../../../../../core/exports.dart';

class ServiceAboutWidget extends StatelessWidget {
  const ServiceAboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherServicesCubit, OtherServicesScreenState>(
      builder: (BuildContext context, state) {
        return Padding(
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
                "خسائر اللازمة ومطالبة حدة بل. الآخر الحلفاء أن غزو,وتنامت عدد مع. لقهر معركة لبلجيكا، بـ انه, ربع الأثنان المالصين وتنامت حين ٣٠, ونتج والحزب المذابح كل جوي. أسركارثة المشتّتون بل, وبعض وبداية الصفحة غزو قد, أي بحثتعداد الجنو",
                style: getMediumStyle(
                  fontSize: 14.sp,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(height: 10.h),

              ContactButtonsScreen(),
              SizedBox(height: 10.h),
              //map
              PositionMap(lat: 30.1234567, long: 29.24),
              SizedBox(height: 30.h),
            ],
          ),
        );
      },
    );
  }
}
