import 'package:dotted_line/dotted_line.dart';

import '../../../../../../core/exports.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return                 CustomContainerWithShadow(child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppTranslations.bookingPrice,style: getRegularStyle(fontSize: 14.sp,color: AppColors.grey),),
              Text("5000",style: getSemiBoldStyle(fontSize: 14.sp,color: AppColors.green)),
            ],),
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("سعر الحجز",style: getRegularStyle(fontSize: 14.sp,color: AppColors.grey),),
              Text("5000",style: getSemiBoldStyle(fontSize: 14.sp,color: AppColors.green)),
            ],),
          SizedBox(height: 10.h,),

          DottedLine(
            dashLength: 5,
            dashGapLength: 4,
            lineThickness: 1,
            dashRadius: 2,
            dashColor: AppColors.grey,
          ),
          SizedBox(height: 10.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppTranslations.bookingPrice,style: getRegularStyle(fontSize: 14.sp,color: AppColors.grey),),
              Text("5000",style: getSemiBoldStyle(fontSize: 14.sp,color: AppColors.green)),
            ],),
        ],
      ),
    )
    );

  }
}
