import 'package:travel_club/features/location/screens/position_map.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/food_cubit.dart';

class AboutWidgetFood extends StatelessWidget {
  const AboutWidgetFood({super.key});

  @override
  Widget build(BuildContext context) {
  return BlocBuilder<FoodCubit, FoodState>(builder: (BuildContext context, state) {
    return    Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //map
            PositionMap(lat: 30.1234567, long: 29.24),
          SizedBox(height: 30.h),

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
            AppTranslations.workingHours,
            style: getMediumStyle(
              color: AppColors.secondPrimary,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 10.h),
ListView.separated(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  itemCount: 5, itemBuilder: (BuildContext context, int index) {
return Text("السبت من ٩ ص : ٩ م",style: getMediumStyle(fontSize: 14.sp,color: AppColors.grey),);
}, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 5.h,) ;},)
        ],),
    );
  },);
  }
}
