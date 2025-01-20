import '../../../../core/exports.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../cubit/payment_cubit.dart';
import '../../cubit/payment_state.dart';
import '../../data/models/check_copoune_model.dart';

class CustomCopunWidget extends StatefulWidget {
  const CustomCopunWidget({super.key, required this.amount});
  final String amount;
  @override
  State<CustomCopunWidget> createState() => _CustomCopunWidgetState();
}

class _CustomCopunWidgetState extends State<CustomCopunWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void initState() {
    context.read<PaymentCubit>().checkCopouneModel = CheckCopouneModel();
    context.read<PaymentCubit>().couponController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PaymentCubit>();
    return BlocBuilder<PaymentCubit, PaymentState>(builder: (context, state) {
      return Form(
        key: _formKey,
        child: CustomContainerWithShadow(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomTextField(
              hintText: AppTranslations.enterCoupon,
              controller: cubit.couponController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppTranslations.enterCoupon;
                }
                return null;
              },
              onChanged: (v) {
                if ( cubit.checkCopouneModel.data != null){
                  cubit.makeModelNull();
                }
               },
              suffixIcon:
              //  cubit.checkCopouneModel.status == null ||
                      cubit.checkCopouneModel.data == null
                  ? Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          cubit.checkCopoune(context, amount: widget.amount);
                        },
                        child: Text(
                          AppTranslations.applay,
                          style: getSemiBoldStyle(
                              fontSize: 14.sp, color: AppColors.primary),
                        ),
                      ),
                    )
                  : Icon(Icons.done),
            ),
          ),
        ),
      );
    });
  }
}
