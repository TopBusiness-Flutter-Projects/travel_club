import 'package:travel_club/core/exports.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({
    super.key,
    required this.body,
    this.title,
    this.onPressed,
  });
  final Widget body;
  final String? title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Row(children: [
          IconButton(
            onPressed: onPressed ??
                () {
                  Navigator.pop(context);
                },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.primary,
            ),
          )
        ]),
        Expanded(child: SingleChildScrollView(child: body))
      ]),
    );
  }
}
