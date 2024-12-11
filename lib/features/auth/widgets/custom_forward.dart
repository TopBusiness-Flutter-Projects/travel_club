import 'package:flutter_svg/svg.dart';

import '../../../core/exports.dart';

class CustomForward extends StatelessWidget {
  const CustomForward({super.key,this.onTap});
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onTap,
        child: SvgPicture.asset(AppIcons.forward));
  }
}
