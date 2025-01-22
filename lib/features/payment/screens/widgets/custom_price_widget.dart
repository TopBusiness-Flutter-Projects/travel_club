import 'package:travel_club/core/widgets/custom_terms_and_conditions.dart';
import 'package:travel_club/features/payment/screens/payment_screen.dart';
import 'package:travel_club/features/payment/screens/widgets/custom_copun_widget.dart';
import 'package:travel_club/features/payment/screens/widgets/payment_widget.dart';

import '../../../../core/exports.dart';
import '../../cubit/payment_cubit.dart';
import '../../cubit/payment_state.dart';

class CustomPricesWidget extends StatefulWidget {
  const CustomPricesWidget({
    super.key,
    this.totalPrice,
    this.vat,
    required this.totalPriceAfterVat,
    this.terms,
  });

  final String? terms;
  final String? totalPrice;
  final String? vat;
  final String totalPriceAfterVat;
  @override
  State<CustomPricesWidget> createState() => _CustomPricesWidgetState();
}

class _CustomPricesWidgetState extends State<CustomPricesWidget> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PaymentCubit>();
    return BlocBuilder<PaymentCubit, PaymentState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //payment
          Text(
            AppTranslations.paymentDetails,
            style: getMediumStyle(fontSize: 14.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
          PaymentDetailsContainer(
            totalPrice: widget.totalPrice,
            vat: widget.vat,
            totalPriceAfterVat: widget.totalPriceAfterVat,
          ),
          SizedBox(
            height: 20.h,
          ),
//copun
          Text(
            AppTranslations.areYouHaveACoupon,
            style: getMediumStyle(fontSize: 14.sp),
          ),
          SizedBox(
            height: 10.h,
          ),

          CustomCopunWidget(
            amount: widget.totalPriceAfterVat,
          ),
          if (widget.terms != null)
            CustomAcceptTerms(
              terms: widget.terms!,
            ),

//button
          CustomButton(
            title: AppTranslations.completePayment,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentWebViewScreen(
                        url:
                            "https://accept.paymob.com/api/ecommerce/payment-links/unrestricted?token=LRR2K0txRzhsSC9BR3VVMHlmVEQyS1JLZz09X2FQSkZJaEhiYTErUWdFSDBjbXFScHc9PQ"),
                  ));
              // Navigator.pushNamed(context, Routes.payment);
            },
          )
        ],
      );
    });
  }
}
