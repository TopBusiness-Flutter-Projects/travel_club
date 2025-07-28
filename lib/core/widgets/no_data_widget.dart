import 'package:easy_localization/easy_localization.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_club/core/exports.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key, required this.title}) : super(key: key);

  //final VoidCallback onclick;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: onclick,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            ImageAssets.noData,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
          Text(
            title.tr(),
            style: getMediumStyle(
              fontSize: 18.sp,
              color: AppColors.black,
            ),
          ),
       
          SizedBox(height: 30, width: MediaQuery.of(context).size.width),
          //    Icon(Icons.replay_circle_filled_rounded, color: AppColors.primary,size: 35,),
        ],
      ),
    );
  }
}
