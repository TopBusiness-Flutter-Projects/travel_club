import '../exports.dart';

class CenterBottomSheet extends StatelessWidget {
   CenterBottomSheet({super.key, this.color});
Color?color;
  @override
  Widget build(BuildContext context) {
    return   Center(
      child: Container(
        width: 79.w,
        height: 4.h,
        decoration: BoxDecoration(
          color:color?? AppColors.samawy, // هنا يمكنك تغيير اللون
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
