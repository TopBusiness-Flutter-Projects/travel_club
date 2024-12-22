import 'package:flutter_svg/svg.dart';
import 'package:travel_club/core/exports.dart';

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
  final bool isMessage;
  final bool isPassword;
  final bool ischange;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  //FocusNode myFocusNode = FocusNode();
  const CustomTextField({
    super.key,
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
    this.borderRadius,
    this.enabled = true,
    this.ischange = false,
    this.title
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
      setState(() {
        // color = Colors.black;
      });
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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      if(widget.title!=null)...[
        Text(widget.title!,style: getMediumStyle(color: AppColors.secondPrimary,fontSize: 14.sp),),
        SizedBox(height: 1.h,),
      ],
          SizedBox(
            height: widget.isMessage ? 150.h : null,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h,horizontal:3.0.w ),
              child: TextFormField(
                  enabled: widget.enabled,

                  controller: widget.controller,
                  expands: false,
                  onTap: widget.onTap,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  focusNode: myFocusNode,
                  style: getBoldStyle(),
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
                          color: myFocusNode.hasFocus
                              ? AppColors.primary
                              : AppColors.gray),
                      prefixIcon: widget.prefixIcon,
                      hintText: widget.hintText,
                      hintStyle: getRegularStyle(color: AppColors.secondPrimary, fontSize: 14.sp),

                      prefixIconColor:
                          myFocusNode.hasFocus ? AppColors.primary : AppColors.gray,
                      suffixIconColor:
                          myFocusNode.hasFocus ? AppColors.primary : AppColors.gray,
                      suffixIcon: widget.ischange?
                      InkWell(
                          onTap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Text(AppTranslations.change,style: getUnderLine(fontSize: 14.sp,color: AppColors.primary),),
                          )):
                      widget.isPassword
                          ?  InkWell(
                          onTap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: SvgPicture.asset(AppIcons.key),
                        ))
                          : widget.suffixIcon,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                      // hintStyle: getRegularStyle(color: AppColors.gray, fontSize: 14),
                      errorStyle: getRegularStyle(color: AppColors.red),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.lightWhite, width: 0),
                          borderRadius: BorderRadius.all(
                              Radius.circular(widget.borderRadius ?? 30.r))),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray, width: 1.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(widget.borderRadius ?? 30.r))),
                      // focused border style
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.primary, width: 1.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(widget.borderRadius ?? 30.r))),

                      // error border style
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.red, width: 1.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(widget.borderRadius ?? 30.r))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.red, width: 1.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(widget.borderRadius ?? 30.r))))),
            ),
          ),
        ],
      ),
    );
  }
}
