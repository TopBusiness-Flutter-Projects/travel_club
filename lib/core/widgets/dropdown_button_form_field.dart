import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  final List<DropdownMenuItem<dynamic>> items;
  final dynamic value;
  final String? hint;
  final ValueChanged<dynamic>? onChanged;
  final FormFieldValidator<dynamic>? validator;

  const CustomDropdownButtonFormField({
    super.key,
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: DropdownButtonFormField<dynamic>(
        value: value,
        icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.grey1),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.lightWhite2, // لون الخلفية
          hintText: hint ?? "choose".tr(),
         contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r), // حواف دائرية
            borderSide: BorderSide.none, // إزالة الخط السفلي
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: AppColors.lightWhite2, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: AppColors.red, width: 1.5),
          ),
          hintStyle: getRegularStyle(
            color: AppColors.grey1,
            fontSize: 15.sp,
            fontHeight: 2,
          ),
          
          errorStyle: getRegularStyle(color: AppColors.red),
        ),
        items: items,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
