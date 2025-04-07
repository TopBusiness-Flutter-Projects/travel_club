import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/preferences/preferences.dart';
import 'package:travel_club/injector.dart' as injector;
import 'app.dart';
import 'app_bloc_observer.dart';
import 'core/utils/restart_app_class.dart';
import 'firebase_options.dart';
import 'notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await injector.setup();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await _setupSecureStorage();
  NotificationService notificationService = NotificationService();
  await notificationService.initialize();
  Bloc.observer = AppBlocObserver();
  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://387e1e113ff64816092bc4b77705d7b7@o4509026470133760.ingest.us.sentry.io/4509026478063616';
        options.sendDefaultPii = true;
      },
      appRunner: () => runApp(
        HotRestartController(
          child: SentryWidget(
            child: EasyLocalization(
              supportedLocales: const [
                Locale('en'),
                Locale('ar'),              
                // Locale('de'),
                // Locale('it'),
                // Locale('ko'),
                // Locale('ru'),
                // Locale('es'),
              ],
              path: 'assets/lang',
              saveLocale: true,
              startLocale: const Locale('ar', ''),
              fallbackLocale: const Locale('ar', ''),
              child: const MyAppWithScreenUtil(),
            ),
          ),
        ),
      ),
    );
  } else {    runApp(
    HotRestartController(
        child: EasyLocalization(
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
            // Locale('de'),
            // Locale('it'),
            // Locale('ko'),
            // Locale('ru'),
            // Locale('es'),
          ],
          path: 'assets/lang',
          saveLocale: true,
          startLocale: const Locale('ar', ''),
          fallbackLocale: const Locale('ar', ''),
          child: HotRestartController(child: const MyAppWithScreenUtil()),
        ),
      ),
    );
  }
}

/// **Sets Up Secure Storage**
Future<void> _setupSecureStorage() async {
  prefs = await SharedPreferences.getInstance();
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  IOSOptions _getIOSOptions() =>
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  prefs = await SharedPreferences.getInstance();
  storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
}

class MyAppWithScreenUtil extends StatelessWidget {
  const MyAppWithScreenUtil({super.key});
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return ScreenUtilInit(
          designSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height),
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
