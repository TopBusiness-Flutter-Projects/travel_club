import 'package:dotted_line/dotted_line.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/utils/convert_numbers_method.dart';

class ReservationPaymentDetailsContainer extends StatelessWidget {
  const ReservationPaymentDetailsContainer({
    super.key,
    required this.totalPrice,
    required this.vat,
    required this.totalPriceAfterVat,
     this.nightes,
  });

  final String totalPrice;
  final String vat;
  final String totalPriceAfterVat;
  final String? nightes;

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithShadow(
        child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          if (nightes != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${AppTranslations.priceFor}$nightes ${AppTranslations.nights} ",
                style:
                    getMediumStyle(fontSize: 14.sp, color: AppColors.primary),
              ),
              CustomContainerWithShadow(
                reduis: 7,
                isShadow: false,
                color: AppColors.green.withOpacity(.12),
                width: 100.w,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
                  child: Center(
                      child: Text(
                    AppTranslations.paymentHasBeenMade,
                    style:
                        getMediumStyle(fontSize: 14.sp, color: AppColors.green),
                    maxLines: 1,
                  )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomPriceRow(
            price: formatNumber(double.parse(totalPrice)),
            title: AppTranslations.bookingPrice,
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomPriceRow(
            price: formatNumber(double.parse(vat)),
            title: AppTranslations.vat,
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
            height: 10.h,
          ),
          CustomPriceRow(
            price: formatNumber((double.parse(totalPrice) + double.parse(vat))),
            title: AppTranslations.totalPrice,
            isLineOver: (double.parse(totalPrice) + double.parse(vat)) >
                double.parse(totalPriceAfterVat),
          ),
          if ((double.parse(totalPrice) + double.parse(vat)) <
              double.parse(totalPriceAfterVat)) ...[
            SizedBox(
              height: 10.h,
            ),
            CustomPriceRow(
              price: formatNumber(double.parse(totalPriceAfterVat)),
              title: AppTranslations.afterDiscount,
            ),
          ]
        ],
      ),
    ));
  }
}

class CustomPriceRow extends StatelessWidget {
  const CustomPriceRow({
    super.key,
    required this.price,
    required this.title,
    this.isLineOver = false,
  });

  final String price;
  final String title;
  final bool isLineOver;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: getRegularStyle(fontSize: 14.sp, color: AppColors.grey),
        ),
        Text("$price ${AppTranslations.currency}",
            style: isLineOver
                ? getThroughLine(fontSize: 14.sp, color: AppColors.green)
                : getBoldStyle(fontSize: 14.sp, color: AppColors.green)),
      ],
    );
  }
}
