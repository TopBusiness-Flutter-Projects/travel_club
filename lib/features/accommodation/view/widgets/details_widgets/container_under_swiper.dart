import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/exports.dart';
import '../../../../entertainment/screens/details_of_entertainment/widgets/toggle_container.dart';
import '../../../../location/screens/transportation_map.dart';
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
           padding:  EdgeInsets.only(top:                  getHeightSize(context) * 0.07,
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
                   SizedBox(height: 10.h),
                   Text(
                    " خسائر اللازمة ومطالبة حدة بل. الآخر الحلفاء أن غزو, إجلاءوتنامت عدد مع. لقهر معركة لبلجيكا، بـ انه, ربع الأثنان ا                في, اقتصّت المحور حدة و. هذه ما طرفاً عالمية استسلام,الصين وتنامت حين ٣٠, ونتج والحزب المذابح كل جوي. أسركارثة المشتّتون بل, وبعض وبداية الصفحة غزو قد, أي بتعداد الجنوب.",
                     style: getMediumStyle(
                       fontSize: 14.sp,
                       color: AppColors.grey,
                     ),
                   ),
                   SizedBox(height: 20.h),
                   //curaption icon
                   Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [

                         Flexible(
                           child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Icon(
                                   CupertinoIcons.square_arrow_right,
                                   color: AppColors.green,
                                   size: getWidthSize(context) / 8,
                                 ),
                                 SizedBox(
                                   width: 5.w,
                                 ),
                                 Column(
                                   crossAxisAlignment:
                                   CrossAxisAlignment.start,
                                   children: [
                                     Text(
                                       AppTranslations.checkinTime,
                                       style:
                                       getMediumStyle(fontSize: 14.sp),
                                     ),
                                     Text(
                                       "12:00 - 20:00",
                                       style: getMediumStyle(
                                           color: AppColors.grey,
                                           fontSize: 14.sp),
                                     ),
                                   ],
                                 ),
                               ]),
                         ),
                         Flexible(
                           child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Icon(
                                   CupertinoIcons.square_arrow_left,
                                   color: AppColors.green,
                                   size: getWidthSize(context) / 8,
                                 ),
                                 SizedBox(
                                   width: 5.w,
                                 ),
                                 Column(
                                   crossAxisAlignment:
                                   CrossAxisAlignment.start,
                                   children: [
                                     Text(
                                       AppTranslations.departureTime,
                                       style:
                                       getMediumStyle(fontSize: 14.sp),
                                     ),
                                     Text(
                                       "12:00 - 20:00",
                                       style: getMediumStyle(
                                           color: AppColors.red,
                                           fontSize: 14.sp),
                                     ),
                                   ],
                                 ),
                               ]),
                         )
                       ]),

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
                   //map
                   ClipRRect(
                     borderRadius: BorderRadius.all(
                       Radius.circular(10.r),
                     ),
                     child: Container(
                       width: double.infinity,
                       height: getHeightSize(context) * 0.3,
                       decoration: BoxDecoration(
                         color: AppColors.red,
                         borderRadius: BorderRadius.all(
                           Radius.circular(10.r),
                         ),
                       ),
                       child: Stack(
                         children: [
                           SizedBox(
                               width: double.infinity,
                               height: getHeightSize(context) * 0.3,
                               child: TransportationMap()),
                           PositionedDirectional(
                             bottom: 10.0,
                             end: 10.0,
                             child: Container(
                               width: getWidthSize(context) * 0.7,
                               decoration: BoxDecoration(
                                 color: AppColors.white,
                                 borderRadius: BorderRadius.circular(10.r),
                               ),
                               // alignment: Alignment.center,
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text(
                                   "٢٠ شارع الملك الصالح / الح / العين السخنه /مصر",
                                   style: getMediumStyle(
                                     fontSize: 14.sp,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                   SizedBox(height: 60.h),
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
