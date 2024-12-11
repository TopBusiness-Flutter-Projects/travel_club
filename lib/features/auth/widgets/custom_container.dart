import 'package:easy_localization/easy_localization.dart';

import '../../../core/exports.dart';

class CustomContainer extends StatelessWidget {
   CustomContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightWhite
      ),
child: Row(
  children: [
//grey
Icon(Icons.arrow_back_ios),
    Text("back".tr(),style: getSemiBoldStyle(color: AppColors.grey),),

  ],
),
    );
  }
}
