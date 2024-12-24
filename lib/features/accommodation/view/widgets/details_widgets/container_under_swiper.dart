import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/exports.dart';
import '../../../../entertainment/screens/details_of_entertainment/widgets/toggle_container.dart';
import '../../../cubit/accomendation_cubit.dart';

class ContainerUnderSwiper  extends StatelessWidget {
  const ContainerUnderSwiper({super.key});

  @override
  Widget build(BuildContext context) {
  return BlocBuilder<AccomendationCubit, AccomendationState>(builder: (BuildContext context, state) {
     return     Positioned(
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
           padding:  EdgeInsets.only(top:                  getHeightSize(context) * 0.133,
           ),
           child: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 8.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   // ToggleButtonScreen(),
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
                   Text(
                    AppTranslations.whatItOffers,
                     style: getMediumStyle(
                       color: AppColors.secondPrimary,
                       fontSize: 14.sp,
                     ),
                   ),
                   SizedBox(height: 10.h),
                   SizedBox(
                     height: 80,
                     child: ListView.builder(
                       itemCount: 20,
                       scrollDirection: Axis.horizontal,
                       itemBuilder: (BuildContext context, int index) {
                         return Padding(
                           padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
                           child: Column(
                             children: [
                               SvgPicture.asset(AppIcons.profile),
                               SizedBox(height: 10.h),
                               Text(
                                 "حمام سباحة",
                                 style: getMediumStyle(fontSize: 12.sp),
                               ),
                             ],
                           ),
                         );
                       },
                     ),
                   ),
                   Text(
                     "الموقع علي الخريطة",
                     style: getMediumStyle(
                       fontSize: 14.sp,
                     ),
                   ),
                   SizedBox(height: 10.h),
                   Container(
                     width: double.infinity,
                     decoration: BoxDecoration(
                       color: AppColors.red,
                       borderRadius: BorderRadius.all(
                         Radius.circular(30.r),
                       ),
                     ),
                     child: Image.asset(
                       ImageAssets.map,
                       width: double.infinity,
                       fit: BoxFit.cover,
                     ),
                   ),
                   SizedBox(height: 30.h),
                 ],
               ),
             ),
           ),
         ),
       ),
     );
   },);
  }
}
