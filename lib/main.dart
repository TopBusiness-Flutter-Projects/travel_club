import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_club/injector.dart' as injector;
import 'app.dart';
import 'app_bloc_observer.dart';
import 'core/utils/restart_app_class.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  await injector.setup();
  Bloc.observer = AppBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar', ''), Locale('en', '')],
      path: 'assets/lang',
      saveLocale: true,
      startLocale: const Locale('ar', ''),
      fallbackLocale: const Locale('ar', ''),
      child: const MyAppWithScreenUtil(),
    ),
  );
}

class MyAppWithScreenUtil extends StatelessWidget {
  const MyAppWithScreenUtil({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        // Use MediaQuery to get the current screen size
        final mediaQuery = MediaQuery.of(context);
        final screenWidth = mediaQuery.size.width;
        final screenHeight = mediaQuery.size.height;
        return ScreenUtilInit(
          designSize: Size(screenWidth, screenHeight),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return HotRestartController(
              child: const MyApp(),
            );
          },
        );
      },
    );
  }
}
