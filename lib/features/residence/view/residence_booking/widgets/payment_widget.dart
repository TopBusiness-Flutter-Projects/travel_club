import 'package:dotted_line/dotted_line.dart';

import '../../../../../core/exports.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget(
      {super.key,
      this.isDetailsBooking = false,
      this.price,
      this.vat,
      this.totalPrice});
  final bool isDetailsBooking;
  final String? price;
  final String? vat;
  final String? totalPrice;
  @override
  Widget build(BuildContext context) {
    return CustomContainerWithShadow(
        child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          if (isDetailsBooking) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppTranslations.priceFor + "4 ليالي ",
                  style:
                      getMediumStyle(fontSize: 14.sp, color: AppColors.primary),
                ),
                CustomContainerWithShadow(
                  reduis: 7,
                  isShadow: false,
                  color: AppColors.green.withOpacity(.12),
                  width: 100.w,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 7),
                    child: Center(
                        child: Text(
                      AppTranslations.paymentHasBeenMade,
                      style: getMediumStyle(
                          fontSize: 14.sp, color: AppColors.green),
                      maxLines: 1,
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
          //row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppTranslations.bookingPrice,
                style: getRegularStyle(fontSize: 14.sp, color: AppColors.grey),
              ),
              Text("$price  ${AppTranslations.currency}",
                  style: getSemiBoldStyle(
                      fontSize: 14.sp, color: AppColors.green)),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppTranslations.vat,
                style: getRegularStyle(fontSize: 14.sp, color: AppColors.grey),
              ),
              Text("${vat}" " " "${AppTranslations.currency}",
                  style: getSemiBoldStyle(
                      fontSize: 14.sp, color: AppColors.green)),
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
                AppTranslations.totalPrice,
                style: getRegularStyle(fontSize: 14.sp, color: AppColors.grey),
              ),
              Text("$totalPrice ${AppTranslations.currency}",
                  style: getBoldStyle(fontSize: 14.sp, color: AppColors.green)),
            ],
          ),
        ],
      ),
    ));
  }
}
