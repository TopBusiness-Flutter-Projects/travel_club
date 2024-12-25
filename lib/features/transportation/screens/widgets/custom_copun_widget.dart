import '../../../../../../core/exports.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class CustomTransportationCopunWidget extends StatelessWidget {
  const CustomTransportationCopunWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithShadow(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomTextField(
          hintText: AppTranslations.enterCoupon,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                AppTranslations.applay,
                style:
                    getSemiBoldStyle(fontSize: 14.sp, color: AppColors.primary),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
