import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/services.dart';
import 'package:travel_club/core/exports.dart';

Future<void> showExitDialog(BuildContext context) async {
   AwesomeDialog(
    context: context,
                     
        
            // dialogType: DialogType.noHeader, // Change to CUSTOM to use custom header
  customHeader: Image.asset(
    ImageAssets.logoImage,
    height: 50.h,
    width: 50.h,
  ),

    animType: AnimType.topSlide,
    padding: EdgeInsets.all(10.w),
    title: AppTranslations.areYouSureClose,
    btnOkText: AppTranslations.exit,
    btnOkOnPress: () {
      Navigator.of(context).pop();
      SystemNavigator.pop();
    },
    btnCancelOnPress: () {},
    btnCancelText: AppTranslations.cancel,
  ).show();
  //  showDialog<void>(
  //   context: context,
  //   barrierDismissible: false,
  //   builder: (BuildContext context) {
  //     return AlertDialog(
  //       title: Text(AppTranslations.areYouSureClose),
  //       content: Text(AppTranslations.appClose),
  //       actions: <Widget>[
  //         TextButton(
  //           child: Text(AppTranslations.cancel),
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //         ),
  //         TextButton(
  //           child: Text(AppTranslations.exit),
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //             SystemNavigator.pop();
  //           },
  //         ),
  //       ],
  //     );
  //   },
  // );
}
