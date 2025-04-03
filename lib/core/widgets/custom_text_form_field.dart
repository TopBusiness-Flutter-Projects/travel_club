import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:travel_club/core/exports.dart';
import 'package:intl_phone_field/intl_phone_field.dart' as intl;

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? initialValue;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? borderRadius;
  final bool? enabled;
  final String? title;
  final String? hintText;
  final List<String>? autoFillHints;
  final bool isMessage;
  final bool isPassword;
  final bool ischange;
  final bool autoFocus;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isPhoneNumber;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String, String)? onPhoneChanged;
// إضافة المتغير
  const CustomTextField(
      {super.key,
      this.labelText,
      this.hintText,
      this.prefixIcon,
      this.validator,
      this.suffixIcon,
      this.keyboardType = TextInputType.text,
      this.isMessage = false,
      this.controller,
      this.initialValue,
      this.onChanged,
      this.onTap,
      this.isPassword = false,
      this.onSubmitted,
        this.autoFillHints,
      this.borderRadius,
      this.enabled = true,
      this.ischange = false,
      this.title,
      this.autoFocus = false,
      this.isPhoneNumber = false,
      this.onPhoneChanged,
      this.inputFormatters // إضافة المتغير
      });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode myFocusNode = FocusNode();
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) ...[
            Text(
              widget.title!,
              style: getMediumStyle(
                  color: AppColors.secondPrimary, fontSize: 14.sp),
            ),
            SizedBox(height: 1.h),
          ],
          // إذا كان هو حقل رقم الهاتف
          if (widget.isPhoneNumber)
            _buildPhoneField(context)
          else
            // إذا لم يكن حقل رقم الهاتف، استخدم الحقل العادي
            _buildRegularField(context),
        ],
      ),
    );
  }

  // الحقل المخصص لرقم الهاتف باستخدام مكتبة intl_phone_number_input
  Widget _buildPhoneField(BuildContext context) {
    return Directionality(
      textDirection:
          //trans.EasyLocalization.of(context)!.locale.languageCode == 'en'?
          TextDirection.ltr,
      // TextDirection.rtl,

      //     ? TextAlign.right
      //     : TextAlign.left, TextDirection.ltr,
      child: intl.IntlPhoneField(
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.enabled!
              ? AppColors.lightWhite2
              : AppColors.gray.withOpacity(0.5),
          labelText: widget.labelText,
          labelStyle: getRegularStyle(
            fontHeight: 1.5,
            color: myFocusNode.hasFocus ? AppColors.primary : AppColors.gray,
          ),
          // prefixIcon: widget.prefixIcon,
          //    hintText: widget.hintText,

          // prefixText: widget.hintText,
          // prefixStyle: TextStyle(color: AppColors.white) ,
          //suffixText: widget.hintText,
          // alignLabelWithHint: true,
          hintTextDirection: TextDirection.ltr,
          alignLabelWithHint: true,
          hintStyle:
              getRegularStyle(color: AppColors.secondPrimary, fontSize: 14.sp),
          prefixIconColor:
              myFocusNode.hasFocus ? AppColors.primary : AppColors.gray,
          suffixIconColor:
              myFocusNode.hasFocus ? AppColors.primary : AppColors.gray,
          suffixIcon: widget.ischange
              ? InkWell(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Text(
                      AppTranslations.change,
                      style: getUnderLine(
                          fontSize: 14.sp, color: AppColors.primary),
                    ),
                  ),
                )
              : widget.isPassword
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: SvgPicture.asset(AppIcons.key),
                      ),
                    )
                  : widget.suffixIcon,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          errorStyle: getRegularStyle(color: AppColors.red),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightWhite, width: 0),
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius ?? 30.r)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.gray, width: 1.5),
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius ?? 30.r)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 1.5),
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius ?? 30.r)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red, width: 1.5),
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius ?? 30.r)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red, width: 1.5),
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius ?? 30.r)),
          ),
        ),

        //   languageCode: 'ar',
        //    initialCountryCode: 'EG', // Change to Egypt or desired default
        // countries: const ['EG', 'SA', 'AE'], // Add relevant country codes
        //  dropdownIcon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
        flagsButtonPadding: const EdgeInsets.only(left: 10),
        dropdownTextStyle: TextStyle(fontSize: getWidthSize(context) / 24),
        // textAlign: TextAlign.left,
        dropdownIconPosition: intl.IconPosition.trailing,
        onChanged: (phone) {
          if (widget.onPhoneChanged != null) {
            widget.onPhoneChanged!(phone.countryCode, phone.number);
          }
        },
      ),
    );
  }

  // الحقل العادي المستخدم لبقية البيانات
  Widget _buildRegularField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 3.0.w),
      child: TextFormField(
        enabled: widget.enabled,
        autofillHints:widget.autoFillHints??[AutofillHints.password, AutofillHints.email,AutofillHints.telephoneNumber],
        controller: widget.controller,
        onTap: widget.onTap,
        inputFormatters: widget.inputFormatters,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        focusNode: myFocusNode,
        autofocus: widget.autoFocus,
        style: getBoldStyle(fontSize: 13.sp),
        onChanged: widget.onChanged,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        maxLines: widget.isMessage ? 5 : 1,
        minLines: widget.isMessage ? 5 : 1,
        onFieldSubmitted: widget.onSubmitted,
        initialValue: widget.initialValue,
        obscureText: widget.isPassword ? !showPassword : false,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.enabled!
              ? AppColors.lightWhite2
              : AppColors.gray.withOpacity(0.5),
          labelText: widget.labelText,
          labelStyle: getRegularStyle(
            fontHeight: 1.5,
            color: myFocusNode.hasFocus ? AppColors.primary : AppColors.gray,
          ),
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText,
          hintStyle:
              getRegularStyle(color: AppColors.secondPrimary, fontSize: 14.sp),
          prefixIconColor:
              myFocusNode.hasFocus ? AppColors.primary : AppColors.gray,
          suffixIconColor:
              myFocusNode.hasFocus ? AppColors.primary : AppColors.gray,
          suffixIcon: widget.ischange
              ? InkWell(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Text(
                      AppTranslations.change,
                      style: getUnderLine(
                          fontSize: 14.sp, color: AppColors.primary),
                    ),
                  ),
                )
              : widget.isPassword
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: SvgPicture.asset(AppIcons.key),
                      ),
                    )
                  : widget.suffixIcon,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          errorStyle: getRegularStyle(color: AppColors.red),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightWhite, width: 0),
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius ?? 30.r)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.gray, width: 1.5),
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius ?? 30.r)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 1.5),
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius ?? 30.r)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red, width: 1.5),
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius ?? 30.r)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red, width: 1.5),
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius ?? 30.r)),
          ),
        ),
      ),
    );
  }
}

class CustomPhoneFormField extends StatelessWidget {
  const CustomPhoneFormField({
    super.key,
    this.onCountryChanged,
    this.onChanged,
    this.controller,
    this.title,
    this.enabled = true,
    this.initialValue,
  });

  final void Function(Country)? onCountryChanged;
  final void Function(PhoneNumber)? onChanged;
  final TextEditingController? controller;
  final bool? enabled;
  final String? initialValue;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: getMediumStyle(
                  color: AppColors.secondPrimary, fontSize: 14.sp),
            ),
            SizedBox(height: 1.h),
          ],
          Directionality(
            textDirection: TextDirection.ltr,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 3.0.w),
              child: IntlPhoneField(
                controller: controller,
                showCountryFlag: true,
                // invalidNumberMessage: "dasdas",
                dropdownTextStyle: getBoldStyle(fontSize: 13.sp),

                // validator: (value) {
                //   if (value == null ) {
                //     return 'enter your phone';
                //   }
                //   return null;
                // },

                keyboardType: TextInputType.number,
                disableLengthCheck: false,
                showDropdownIcon: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: enabled!
                      ? AppColors.lightWhite2
                      : AppColors.gray.withOpacity(0.5),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  errorStyle:
                      getRegularStyle(color: AppColors.red, fontSize: 13.sp),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.lightWhite, width: 0),
                    borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.gray, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.primary, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  ),
                ),
                onCountryChanged: onCountryChanged,
                style: getBoldStyle(fontSize: 13.sp),
                initialValue: initialValue ?? '+20',
                // initialCountryCode: 'EG', // Saudi Arabia country code
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
