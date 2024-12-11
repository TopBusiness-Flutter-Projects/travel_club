import 'package:easy_localization/easy_localization.dart';

import '../../../core/exports.dart';

class CustomContainer extends StatelessWidget {
   CustomContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 83.w,
      // height:36.h ,
      decoration: BoxDecoration(
        color: AppColors.lightWhite,
        borderRadius: BorderRadius.circular(15.r)
      ),
child: Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
  //grey
  Icon(Icons.arrow_back_ios,color: AppColors.grey,),
      Text(AppTranslations.back,style: getSemiBoldStyle(color: AppColors.grey,fontSize: 14.sp),),

    ],
  ),
),
    );
  }
}
