import 'dart:async';
import 'package:flutter/material.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/utils/assets_manager.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../core/utils/dialogs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Timer _timer;

  _goNext() {
    _getStoreUser();
  }

  _startDelay() async {
    _timer = Timer(
      const Duration(seconds: 8, milliseconds: 500),
      () {
        _goNext();
      },
    );
  }

  Future<void> _getStoreUser() async {
    Navigator.pushReplacementNamed(context, Routes.onboardingPageScreenRoute);

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // if (prefs.getString('onBoarding') != null) {
    //   if (prefs.getString('user') != null) {
    //     Navigator.pushReplacementNamed(context, Routes.mainRoute);
    //   } else {
    //     Navigator.pushNamedAndRemoveUntil(
    //       context,
    //       Routes.loginRoute,
    //       ModalRoute.withName(
    //         Routes.initialRoute,
    //       ),
    //     );
    //   }
    // } else {
    //   Navigator.pushReplacementNamed(
    //     context,
    //     Routes.initialRoute,

    //     ///onBprading
    //   );
    // }
  }

  @override
  void initState() {
    super.initState();
    // context.read<SplashCubit>().getAdsOfApp();

    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                ImageAssets.splashLogo,
                height: getHeightSize(context) * 0.3,
                // width: getWidthSize(context) / 1.2,
              ),
            ),
          ),
        ],
      ),
    );
    //   },
    // );
  }
}
