import 'package:dotted_line/dotted_line.dart';
import 'package:travel_club/core/utils/convert_numbers_method.dart';
import 'package:travel_club/features/payment/cubit/payment_cubit.dart';
import 'package:travel_club/features/payment/cubit/payment_state.dart';

import '../../../../core/exports.dart';

class PaymentDetailsContainer extends StatelessWidget {
  const PaymentDetailsContainer({
    super.key,
    this.totalPrice,
    this.nights,
    this.vat,
    this.totalPriceAfterVat,
    this.afterDiscountPrice,
    this.isTickets = false,
    this.mealsName,
  });

  final String? nights;
  final String? totalPrice;
  final String? vat;
  final String? totalPriceAfterVat;
  final String? afterDiscountPrice;
  final bool isTickets;
  final String? mealsName;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PaymentCubit>();
    return BlocBuilder<PaymentCubit, PaymentState>(builder: (context, state) {
      return CustomContainerWithShadow(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (mealsName.toString() != "null") ...[
              CustomPriceRow(
                price: formatNumber(double.parse(mealsName!)),
                title: "سعر الوجبات",
              ),
              SizedBox(
                height: 15.h,
              )
            ],
            if (nights != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "${AppTranslations.priceFor} $nights ${AppTranslations.nights} ",
                  style: getMediumStyle(fontSize: 14.sp, color: AppColors.primary),
                ),
              ),
            CustomPriceRow(
              price: formatNumber(double.parse(totalPrice!)),
              title: isTickets
                  ? AppTranslations.ticketsPrice
                  : AppTranslations.bookingPrice,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomPriceRow(
              price: formatNumber(double.parse(vat!)),
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
              price: formatNumber(double.parse(totalPriceAfterVat!)),
              title: AppTranslations.totalPrice,
              isLineOver: cubit.checkCopouneModel.data != null,
            ),
            if (cubit.checkCopouneModel.data != null) ...[
              SizedBox(
                height: 10.h,
              ),
              CustomPriceRow(
                price: formatNumber(
                    double.parse(cubit.checkCopouneModel.data.toString())),
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
