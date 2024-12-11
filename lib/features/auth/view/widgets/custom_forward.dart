import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/exports.dart';


class CustomForward extends StatelessWidget {
  const CustomForward({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: EasyLocalization.of(context)!.locale.languageCode != 'ar'
            ? RotatedBox(
                quarterTurns: 2,
                child: Image.asset(
                  ImageAssets.forward,
                  height: getHeightSize(context) * 0.1,
                ),
              )
            : Image.asset(
                ImageAssets.forward,
                height: getHeightSize(context) * 0.1,
              ));
  }
}
