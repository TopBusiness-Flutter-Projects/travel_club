
import '../../../../../core/exports.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         CustomBackButton(),
          Spacer(),
          Expanded(child: Text(AppTranslations.details,style: getMediumStyle(color: AppColors.blue,fontSize: 16.sp),)),
          Container(
              width: 44.w, // Adjust size as needed
              height: 44.h,
              decoration: BoxDecoration(
                color: AppColors.lightWhite,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15), // Circular with rounded corners
              ),
              child:Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(AppIcons.share,),
              )
          ),
          SizedBox(width: 8.w,),
          Container(
              width: 44.w, // Adjust size as needed
              height: 44.h,
              decoration: BoxDecoration(
                color: AppColors.lightWhite,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15), // Circular with rounded corners
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(AppIcons.favourites),
              )
          ),
        ],),
    );
  }
}
