import 'package:travel_club/features/location/screens/position_map.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/entertainment_cubit.dart';
import 'custom_contact_container.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

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
            """خسائر اللازمة ومطالبة حدة بل. الآخر الحلفاء أن غزو, إجلاء 
                            وتنامت عدد مع. لقهر معركة لبلجيكا، بـ انه, ربع الأثنان المقيتة
                            في, اقتصّت المحور حدة و. هذه ما طرفاً عالمية استسلام,
                            الصين وتنامت حين ٣٠, ونتج والحزب المذابح كل جوي. أسر
                            كارثة المشتّتون بل, وبعض وبداية الصفحة غزو قد, أي بحث
                            تعداد الجنوب.""",
            style: getMediumStyle(
              fontSize: 14.sp,
              color: AppColors.grey,
            ),
          ),
          SizedBox(height: 10.h),
          //communication
          Text(
            AppTranslations.communication,
            style: getMediumStyle(
              color: AppColors.secondPrimary,
              fontSize: 14.sp,
            ),
          ),
          ContactButtonsScreen(),
          SizedBox(height: 10.h),
          //map
        PositionMap(lat: 30.1234567, long: 29.24),
          SizedBox(height: 30.h),
        ],),
    );
  },);
  }
}
