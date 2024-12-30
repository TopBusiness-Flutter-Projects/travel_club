import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_button.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({
    super.key,
    required this.body,
    this.appbarTitle,
    this.isBooking,
    this.appBarOnPresses,
    this.onTapp
  });
  final Widget body;
  final String? appbarTitle;
  final bool? isBooking;
  final void Function()? appBarOnPresses;
  final void Function()? onTapp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: getVerticalPadding(context) * 2),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomBackButton(
              onTap: appBarOnPresses,
            ),
            if (appbarTitle != null)
              Text(
                appbarTitle!,
                style:
                    getSemiBoldStyle(color: AppColors.black, fontSize: 16.sp),
              ),
            SizedBox(
              width: 20.w,
            ),
          ]),
        ),
        Expanded(child:body)
      ]),

      bottomNavigationBar:isBooking == true? CustomContainerWithShadow(
        height: 74.h,
          child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Text("5000",style: getSemiBoldStyle(fontSize: 16.sp),),

        CustomButton(title: AppTranslations.bookNow,width: 179.w,onTap: onTapp,)
        ],)):null,
    );
  }
}
