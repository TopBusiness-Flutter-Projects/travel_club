import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/widgets/custom_terms_and_conditions.dart';
import 'package:travel_club/features/payment/data/models/check_copoune_model.dart';
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
    required this.reservationId,
    this.ticketsWidget,
    this.isPaid = false,
    this.mealsName,
  });

  final String? terms;
  final String? totalPrice;
  final String? vat;
  final String totalPriceAfterVat;
  final int reservationId;
  final Widget? ticketsWidget;
  final bool isPaid;
  final String? mealsName;
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
          widget.ticketsWidget ??
              SizedBox(
                height: 0,
              ),
          PaymentDetailsContainer(
            isTickets: widget.ticketsWidget != null,
            totalPrice: widget.totalPrice,
            vat: widget.vat,
            totalPriceAfterVat: widget.totalPriceAfterVat,
            mealsName: widget.mealsName,
          ),
          if (!widget.isPaid) ...[
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
            Opacity(
              opacity: widget.terms == null
                  ? 1
                  : cubit.isChecked
                      ? 1
                      : 0.4,
              child: CustomButton(
                title: AppTranslations.completePayment,
                onTap: widget.terms == null
                    ? () async {
                        checkPointsDialog(context,
                            cubit: cubit,
                            reservationId: widget.reservationId,
                                price:cubit.checkCopouneModel.data != null? cubit.checkCopouneModel.data.toString(): widget.totalPriceAfterVat);
                      }
                    : cubit.isChecked
                        ? () async {
                            checkPointsDialog(context,
                                cubit: cubit,
                                reservationId: widget.reservationId,
                                price:cubit.checkCopouneModel.data != null? cubit.checkCopouneModel.data.toString(): widget.totalPriceAfterVat);
                          }
                        : null,
              ),
            )
          ]
        ],
      );
    });
  }
}

void checkPointsDialog(BuildContext context,
    {required int reservationId,
    required PaymentCubit cubit,
    required String price}) {
  if (cubit.checkPoints(context, price: price)) {
    AwesomeDialog(
        closeIcon: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close)),
        showCloseIcon: true,
        dialogBackgroundColor: AppColors.white,
        context: context,
        customHeader: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            ImageAssets.logoImage,
          ),
        ),
        animType: AnimType.topSlide,
        //   showCloseIcon: true,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(10.h),
              child: Text(
                textAlign: TextAlign.center,
             "${"use".tr()}${cubit.moneyEquals(context, price: price)}${"from_points".tr()}",
                style: getMediumStyle(fontSize: 16.sp),
              ),
            ),
            Row(children: [
              Expanded(
                child: CustomButton(
                  title: "yes".tr(),
                  isBordered: true,
                  onTap: () {
                    Navigator.pop(context);
                    cubit.payWithPoints(
                      context,
                      reservationId: reservationId,
                    );
                  },
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                child: CustomButton(
                  title: "payment".tr(),
                  onTap: () {
                    Navigator.pop(context);
                    cubit.getPaymentUrl(
                      context,
                      reservationId: reservationId,
                    );
                  },
                ),
              ),
            ])
          ],
        )).show();
  } else {
    cubit.getPaymentUrl(
      context,
      reservationId: reservationId,
    );
  }
}
