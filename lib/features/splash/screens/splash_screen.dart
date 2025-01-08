import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:travel_club/core/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Timer _timer;

  navigateToHome() async {
    _timer = Timer(
      const Duration(seconds: 3),
      () {
        _getStoreUser();
      },
    );
  }

  Future<void> _getStoreUser() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('onBoarding') != null) {
      // TODO
      if (AppConst.isLogged) {
        Navigator.pushReplacementNamed(context, Routes.mainRoute);
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.loginRoute,
          (route) => false,
        );
      }
    } else {
      Navigator.pushReplacementNamed(
        context,
        Routes.onboardingPageScreenRoute,
      );
    }
  }

  late final AppLinks _appLinks;

  @override
  void initState() {
    super.initState();
    _initializeAppLinks();
  }

  Future<void> _initializeAppLinks() async {
    _appLinks = AppLinks();

    // Handle initial deep link
    final initialLink = await _appLinks.getInitialLink();
    if (initialLink != null) {
      _handleDeepLink(initialLink);
    } else {
      navigateToHome();
    }

    // Listen for deep links
    _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        _handleDeepLink(uri);
      }
    }, onError: (err) {
      debugPrint('Error handling deep link: $err');
    });
  }

  void _handleDeepLink(Uri initialDeepLink) {
    print("the link is : ${initialDeepLink.toString()}");
    if (initialDeepLink.toString().contains("transportation")) {
      // Uri uri = Uri.parse(initialDeepLink.toString());
      String id = initialDeepLink.queryParameters['id'] ?? "-1";
      Navigator.pushReplacementNamed(
        context, Routes.detailsbookingTransportation,
        // arguments: id
      );
    } else {
      Navigator.pushReplacementNamed(context, Routes.mainRoute);
    }
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
