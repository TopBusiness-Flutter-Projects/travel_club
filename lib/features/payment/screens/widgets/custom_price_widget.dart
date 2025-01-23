import 'package:travel_club/core/preferences/preferences.dart';
import 'package:travel_club/core/widgets/custom_terms_and_conditions.dart';
import 'package:travel_club/features/auth/data/models/login_model.dart';
import 'package:travel_club/features/payment/data/models/check_copoune_model.dart';
import 'package:travel_club/features/payment/data/models/check_payment_status_model.dart';
import 'package:travel_club/features/payment/screens/payment_screen.dart';
import 'package:travel_club/features/payment/screens/widgets/custom_copun_widget.dart';
import 'package:travel_club/features/payment/screens/widgets/payment_widget.dart';
import 'package:travel_club/features/payment/screens/done_payment.dart';

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
    required this.reservationId,
  });

  final String? terms;
  final String? totalPrice;
  final String? vat;
  final String totalPriceAfterVat;
  final int reservationId;
  @override
  State<CustomPricesWidget> createState() => _CustomPricesWidgetState();
}

class _CustomPricesWidgetState extends State<CustomPricesWidget> {
  @override
  void initState() {
    context.read<PaymentCubit>().checkCopouneModel = CheckCopouneModel();
    context.read<PaymentCubit>().couponController.clear();
    print("eeeeeeeeee");
    super.initState();
  }

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
            onTap: () async {
              LoginModel loginModel = await Preferences.instance.getUserModel();
              String? token = loginModel.data?.token;
              print(token);
              cubit.getPaymentUrl(
                context,
                reservationId: widget.reservationId,
              );
              
            //   Navigator.pushAndRemoveUntil(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => DonePaymentScreen(
            //             paymentModel: PaymentModel(),
            //           )),
            //   (route) => false,
            // );
            },
          )
        ],
      );
    });
  }
}
