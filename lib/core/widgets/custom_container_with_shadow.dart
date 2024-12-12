import 'package:travel_club/core/exports.dart';

class CustomContainerWithShadow extends StatelessWidget {
  const CustomContainerWithShadow({
    super.key, required this.child, this.height, this.width,
  });
final Widget child;
final double? height;
final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: child,
    );
  }
}
