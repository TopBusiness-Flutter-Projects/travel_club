import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:travel_club/core/exports.dart';


class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {    return Center(
    child: Platform.isIOS          ? const CupertinoActivityIndicator(animating: true, radius: 15)
        : CircularProgressIndicator(color: AppColors.primary),    );
  }
}
