import '../../../../core/exports.dart';

class CustomBackButton extends StatelessWidget {
   CustomBackButton({super.key,this.onTap});
 void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
      onTap??  Navigator.pop(context);
      },
      child: Container(
        width: 44.w, // Adjust size as needed
        height: 44.h,
        decoration: BoxDecoration(
          color: AppColors.lightWhite,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15), // Circular with rounded corners
        ),
        child: Icon(
          Icons.arrow_back_ios, // Icon similar to the image
          color: Colors.grey, // Match the color of the arrow
          size: 18.sp, // Adjust size as needed
        ),
      ),
    );
  }
}
