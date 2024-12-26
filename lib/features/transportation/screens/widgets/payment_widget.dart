import 'package:dotted_line/dotted_line.dart';

import '../../../../../../core/exports.dart';

class TransportationPaymentWidget extends StatelessWidget {
  const TransportationPaymentWidget({super.key, this.isDetailsBooking = false});
  final bool isDetailsBooking;
  @override
  Widget build(BuildContext context) {
    return CustomContainerWithShadow(
        child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppTranslations.ticketPrice,
                style: getRegularStyle(fontSize: 14.sp, color: AppColors.grey),
              ),
              Flexible(
                child: Text("500  ${AppTranslations.currency}",
                    style: getSemiBoldStyle(
                        fontSize: 14.sp, color: AppColors.green)),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppTranslations.quantity,
                style: getRegularStyle(fontSize: 14.sp, color: AppColors.grey),
              ),
              Flexible(
                child: Text("5  ${AppTranslations.ticket}",
                    style: getSemiBoldStyle(
                        fontSize: 14.sp, color: AppColors.primary)),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          DottedLine(
            dashLength: 5,
            dashGapLength: 4,
            lineThickness: 1,
            dashRadius: 2,
            dashColor: AppColors.grey,
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppTranslations.total,
                style: getRegularStyle(fontSize: 14.sp, color: AppColors.grey),
              ),
              Flexible(
                child: Text("500 ${AppTranslations.currency}",
                    style:
                        getBoldStyle(fontSize: 14.sp, color: AppColors.green)),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
