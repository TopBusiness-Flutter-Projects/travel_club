import 'package:travel_club/core/exports.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({
    super.key,
    required this.body,
    this.appbarTitle,
    this.appBarOnPresses,
  });
  final Widget body;
  final String? appbarTitle;
  final void Function()? appBarOnPresses;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Row(children: [
          CustomBackButton(
            onTap: appBarOnPresses,
          ),
          if (appbarTitle != null)
            Text(
              appbarTitle!,
              style: getSemiBoldStyle(color: AppColors.black, fontSize: 16.sp),
            ),
          SizedBox(
            width: 20.w,
          ),
        ]),
        Expanded(child: SingleChildScrollView(child: body))
      ]),
    );
  }
}
