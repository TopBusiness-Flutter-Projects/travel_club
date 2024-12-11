import 'package:flutter_svg/svg.dart';

import '../../../core/exports.dart';

class CustomForward extends StatelessWidget {
  const CustomForward({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){},
        child: SvgPicture.asset(AppIcons.forward));
  }
}
