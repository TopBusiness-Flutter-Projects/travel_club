import 'package:dotted_line/dotted_line.dart';
import 'package:travel_club/features/payment/cubit/payment_cubit.dart';
import 'package:travel_club/features/payment/cubit/payment_state.dart';

import '../../../../core/exports.dart';

class PaymentDetailsContainer extends StatelessWidget {
  const PaymentDetailsContainer(
      {super.key,
      this.isDetailsBooking = false,
      this.totalPrice,
      this.vat,
      this.totalPriceAfterVat,
      this.afterDiscountPrice});
  final bool isDetailsBooking;
  final String? totalPrice;
  final String? vat;
  final String? totalPriceAfterVat;
  final String? afterDiscountPrice;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PaymentCubit>();
    return BlocBuilder<PaymentCubit, PaymentState>(builder: (context, state) {
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
                    "${AppTranslations.priceFor}4 ليالي ",
                    style: getMediumStyle(
                        fontSize: 14.sp, color: AppColors.primary),
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
            CustomPriceRow(
              price: totalPrice!,
              title: AppTranslations.bookingPrice,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomPriceRow(
              price: vat!,
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
              price: totalPriceAfterVat!,
              title: AppTranslations.totalPrice,
              isLineOver: cubit.checkCopouneModel.data != null,
            ),
            if (cubit.checkCopouneModel.data != null) ...[
              SizedBox(
                height: 10.h,
              ),
              CustomPriceRow(
                price: cubit.checkCopouneModel.data.toString(),
                title: AppTranslations.afterDiscount,
              ),
            ]
          ],
        ),
      ));
    });
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
