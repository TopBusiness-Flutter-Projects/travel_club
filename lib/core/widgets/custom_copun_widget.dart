import 'package:travel_club/features/home/cubit/home_cubit.dart';
import 'package:travel_club/features/home/cubit/home_state.dart';

import '../exports.dart';
import 'custom_text_form_field.dart';

class CustomCopunWidget extends StatefulWidget {
  const CustomCopunWidget({super.key, required this.amount});
final String amount ;
  @override
  State<CustomCopunWidget> createState() => _CustomCopunWidgetState();
}

class _CustomCopunWidgetState extends State<CustomCopunWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void initState() {
    // context.read<HomeCubit>().checkPromoCodeModel = CheckPromoCodeModel();
     context.read<HomeCubit>().couponController.clear();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
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
                  setState(() {});
                  //  cubit.checkPromoCodeModel = CheckPromoCodeModel();
                },

                //  suffixIcon: cubit.checkPromoCodeModel.state == null
                //     ? TextButton(
                //         onPressed: () {
                //           if (!_formKey.currentState!.validate()) {
                //             return;
                //           }
                //           cubit.checkPromoCode(
                //             context,
                //           );
                //         },
                //         child: Text("check".tr(),
                //             style: getBoldStyle(fontSize: 14.sp)))
                //     : cubit.checkPromoCodeModel.data != null
                //         ? Icon(Icons.done)
                //         : Icon(Icons.close),
                suffixIcon:
                    //  cubit.checkPromoCodeModel.state ?
                    Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      cubit.checkCopoune(
                        context,
                        amount:widget. amount
                      );
                    },
                    child: Text(
                      AppTranslations.applay,
                      style: getSemiBoldStyle(
                          fontSize: 14.sp, color: AppColors.primary),
                    ),
                  ),
                )),
          ),
        ),
      );
    });
  }
}
