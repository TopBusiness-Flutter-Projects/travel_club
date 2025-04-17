import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/preferences/preferences.dart';

import 'features/entertainment/screens/details_of_entertainment/screens/details_entertainment.dart';
import 'features/food/screens/details_of_food/screens/details_food_screen.dart';
import 'features/main_screen/cubit/cubit.dart';
import 'features/my_bookings/cubit/my_bookings_cubit.dart';
import 'features/residence/view/screens/lodge_details.dart';
import 'features/residence/view/screens/lodges_screen.dart';
RemoteMessage? initialMessageRcieved;
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();
  /// Global Key for Navigation
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  /// Firebase Messaging Instance
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  /// Local Notifications Plugin
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  int _notificationCounter = 0;



  /// **Initialize Notifications**
  Future<void> initialize() async {
    await _initializeFirebaseMessaging();
    await _initializeLocalNotifications();
  }

  /// **Firebase Messaging Initialization**
  Future<void> _initializeFirebaseMessaging() async {
    // Handle when app is completely closed and opened via notification
    // RemoteMessage? initialMessage = await _messaging.getInitialMessage();
    // if (initialMessage != null) {
    //   isWithNotification = true;
    //   notificationType = initialMessage.data['reference_table'] ?? "";
    //   notificationId = initialMessage.data['id'] ?? "-1";
    // }
    RemoteMessage? initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      initialMessageRcieved = initialMessage;
      // notificationType = initialMessage.data['reference_table'] ?? "";
      // notificationId = initialMessage.data['reference_id'] ?? "";
      //! open
    }

    // Handle notification click when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log("recieved onMessageOpenedApp ${message.data.toString()}");
      if(message.data['reference_table'] == "places"){
        navigatorKey.currentState?.pushNamed( Routes.hotelsScreen,
            arguments: LodgesScreenArguments(
                placeId:int.tryParse(message.data['reference_id']) ??0,
                title: message.data['reference_name']));
      }
      else
        if(message.data['reference_table'] == "lodges"){
        navigatorKey.currentState?.pushNamed( Routes.lodgeDetailsRoute,
            arguments: LodgeDetailsArguments(lodgeId: int.tryParse(message.data['reference_id']) ?? 0));
      }
      else if(message.data['reference_table'] == "offers"||message.data['reference_table'] == "suitcases"){
      //   navigatorKey .read<MainCubit>().changePage(0);
        navigatorKey.currentState?.pushNamed(Routes.mainRoute);
      //   navigatorKey.currentState?.pushNamed( Routes.lodgeDetailsRoute,
      //       arguments:
      //       LodgeDetailsArguments(lodgeId: int.tryParse(message.data['reference_id']) ?? 0));
      }
      else if(message.data['reference_table'] == "restaurants"){
        navigatorKey.currentState?.pushNamed( Routes.detailsFoodRoute,
            arguments: DetailsFoodArgs(id: message.data['reference_id'].toString()));
      }
      else if(message.data['reference_table']== "companies"){
        navigatorKey.currentState?.pushNamed(
            Routes.detailsEntertainment,
            arguments:EntertainmentDetailsArgs(
              id:  int.tryParse(message.data['reference_id']) ?? 0,
            )
        );
      }
      else if(message.data['reference_table'] == "organizations"){
        navigatorKey.currentState?.pushNamed(
            Routes.detailsEntertainment,
            arguments:EntertainmentDetailsArgs(
              id:  message.data['reference_id']?? 0,
            )
        );
      }
        else if(message.data['reference_table']=="room_reservations"){
          // log(data.referenceId.toString());
          navigatorKey.currentContext?.read<MainCubit>().changePage(1);
          navigatorKey.currentContext?.read<MyReservationsCubit>() . selectedModuleId=1;
          navigatorKey.currentContext?.read<MyReservationsCubit>() . changeModule(1);
          navigatorKey.currentState?.pushNamedAndRemoveUntil(
            Routes.mainRoute,
                (route) => false,
          );
        }  else if(message.data['reference_table']=="bus_reservations"){
          // log(data.referenceId.toString());
          navigatorKey.currentContext?.read<MainCubit>().changePage(1);
          navigatorKey.currentContext?.read<MyReservationsCubit>() . selectedModuleId=2;
          navigatorKey.currentContext?.read<MyReservationsCubit>() . changeModule(2);
          navigatorKey.currentState?.pushNamedAndRemoveUntil(
            Routes.mainRoute,
                (route) => false,
          );
        }else if(message.data['reference_table']=="organization_reservations"){
          // log(data.referenceId.toString());
          navigatorKey.currentContext?.read<MainCubit>().changePage(1);
          navigatorKey.currentContext?.read<MyReservationsCubit>() . selectedModuleId=3;
          navigatorKey.currentContext?.read<MyReservationsCubit>() . changeModule(3);
          navigatorKey.currentState?.pushNamedAndRemoveUntil(
            Routes.mainRoute,
                (route) => false,
          );
        }else if(message.data['reference_table']=="restaurant_reservations"){
          // log(data.referenceId.toString());
          navigatorKey.currentContext?.read<MainCubit>().changePage(1);
          navigatorKey.currentContext?.read<MyReservationsCubit>() . selectedModuleId=4;
          navigatorKey.currentContext?.read<MyReservationsCubit>() . changeModule(4);
          navigatorKey.currentState?.pushNamedAndRemoveUntil(
            Routes.mainRoute,
                (route) => false,
          );
        }
      // else if(message.data['reference_table']=="bus_reservations"){
      //   log(data.referenceId.toString());
      //   context.read<MainCubit>().changePage(1);
      //   context.read<MyReservationsCubit>() . selectedModuleId=2;
      //   context.read<MyReservationsCubit>() . changeModule(2);
      //   Navigator.pushNamedAndRemoveUntil(
      //     context,
      //     Routes.mainRoute,
      //         (route) => false,
      //   );
      // } else if(message.data['reference_table']=="organization_reservations"){
      //   log(data.referenceId.toString());
      //   context.read<MainCubit>().changePage(1);
      //   context.read<MyReservationsCubit>() . selectedModuleId=3;
      //   context.read<MyReservationsCubit>() . changeModule(3);
      //   Navigator.pushNamedAndRemoveUntil(
      //     context,
      //     Routes.mainRoute,
      //         (route) => false,
      //   );
      // } else if(message.data['reference_table']=="restaurant_reservations"){
      //   context.read<MainCubit>().changePage(1);
      //   context.read<MyReservationsCubit>() . selectedModuleId=4;
      //   context.read<MyReservationsCubit>() . changeModule(4);
      //   Navigator.pushNamedAndRemoveUntil(
      //     context,
      //     Routes.mainRoute,
      //         (route) => false,
      //   );
      // }
      else{
        navigatorKey.currentState?.pushNamed(Routes.notificationScreen);

      }

    });
    // Request notification permissions
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((message) {
      log("recieved onMessage ${message.data.toString()}");
      _showLocalNotification(
        title: message.notification?.title ?? '',
        body: message.notification?.body ?? '',
        payload: jsonEncode(message.data), // message.data.toString(),
      );
    });

    await _getToken();

}

  /// **Handles Background Notifications**
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("Background Message Received: ${message.notification?.title}");
  }

  /// **Fetches and Stores FCM Token**
  Future<void> _getToken() async {
    try {
      String token = await _messaging.getToken() ?? '';
      print("FCM Token: $token");
      Preferences.instance.setNotificationToken(value: token);
    } catch (e) {
      print("Error getting token: $e");
    }
  }

  /// **Local Notifications Initialization**
  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (details) {
        final payload = details.payload;
        log('Notification payload: $payload');

        try {
          if (payload != null) {
            Map<String, dynamic> message;
            // try {
            message = jsonDecode(payload);
            // } catch (e) {
            //   final cleanPayload =
            //       payload.replaceAll('{', '').replaceAll('}', '');
            //   final pairs = cleanPayload.split(',');

            //   message = {};
            //   for (var pair in pairs) {
            //     final keyValue = pair.split(':');
            //     if (keyValue.length == 2) {
            //       final key = keyValue[0].trim();
            //       final value = keyValue[1].trim();
            //       message[key] = value;
            //     }
            //   }
            // }

            log('Notification message after parsing: $message');

        if(message['reference_table'] == "places"){
          navigatorKey.currentState?.pushNamed( Routes.hotelsScreen,
              arguments: LodgesScreenArguments(
                  placeId:int.tryParse(message['reference_id']) ??0,
                  title: message['reference_name']));

        }
        else
          if(message['reference_table'] == "lodges"){
          print("lodes");
          navigatorKey.currentState?.pushNamed( Routes.lodgeDetailsRoute,
              arguments:
              LodgeDetailsArguments(lodgeId: int.tryParse(message['reference_id']) ?? 0));
        }
        else if(message['reference_table'] == "offers"||message['reference_table'] == "suitcases"){
          // navigatorKey .read<MainCubit>().changePage(0);
          navigatorKey.currentState?.pushNamed( Routes.lodgeDetailsRoute,
              arguments:
              LodgeDetailsArguments(lodgeId: int.tryParse(message['reference_id']) ?? 0));
        }    else if(message['reference_table']=="room_reservations"){
            // log(data.referenceId.toString());
            navigatorKey.currentContext?.read<MainCubit>().changePage(1);
            navigatorKey.currentContext?.read<MyReservationsCubit>() . selectedModuleId=1;
            navigatorKey.currentContext?.read<MyReservationsCubit>() . changeModule(1);
            navigatorKey.currentState?.pushNamedAndRemoveUntil(
              Routes.mainRoute,
                  (route) => false,
            );
          }  else if(message['reference_table']=="bus_reservations"){
            // log(data.referenceId.toString());
            navigatorKey.currentContext?.read<MainCubit>().changePage(1);
            navigatorKey.currentContext?.read<MyReservationsCubit>() . selectedModuleId=2;
            navigatorKey.currentContext?.read<MyReservationsCubit>() . changeModule(2);
            navigatorKey.currentState?.pushNamedAndRemoveUntil(
              Routes.mainRoute,
                  (route) => false,
            );
          }else if(message['reference_table']=="organization_reservations"){
            // log(data.referenceId.toString());
            navigatorKey.currentContext?.read<MainCubit>().changePage(1);
            navigatorKey.currentContext?.read<MyReservationsCubit>() . selectedModuleId=3;
            navigatorKey.currentContext?.read<MyReservationsCubit>() . changeModule(3);
            navigatorKey.currentState?.pushNamedAndRemoveUntil(
              Routes.mainRoute,
                  (route) => false,
            );
          }else if(message['reference_table']=="restaurant_reservations"){
            // log(data.referenceId.toString());
            navigatorKey.currentContext?.read<MainCubit>().changePage(1);
            navigatorKey.currentContext?.read<MyReservationsCubit>() . selectedModuleId=4;
            navigatorKey.currentContext?.read<MyReservationsCubit>() . changeModule(4);
            navigatorKey.currentState?.pushNamedAndRemoveUntil(
              Routes.mainRoute,
                  (route) => false,
            );
          }
        else if(message['reference_table'] == "restaurants"){
          navigatorKey.currentState?.pushNamed( Routes.detailsFoodRoute,
              arguments: DetailsFoodArgs(id: message['reference_id'].toString()));
        }
        else if(message['reference_table']== "companies"){
          navigatorKey.currentState?.pushNamed(
               Routes.detailsEntertainment,
              arguments:EntertainmentDetailsArgs(
                id:  int.tryParse(message['reference_id']) ?? 0,
              )


          );
        }

        else if(message['reference_table'] == "organizations"){
          navigatorKey.currentState?.pushNamed(
              Routes.detailsEntertainment,
              arguments:EntertainmentDetailsArgs(
                id:  message['reference_id']?? 0,
              )
          );
        }
        else {
              navigatorKey.currentState?.pushNamed(Routes.notificationScreen);
            }
          }
        } catch (e) {
          log('Error parsing notification payload: $e');
          // Fallback action
          navigatorKey.currentState?.pushNamed(Routes.notificationScreen);
        }
      },
    );

    if (Platform.isAndroid) {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }

    if (Platform.isIOS) {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    }
  }

  /// **Shows a Local Notification**
  Future<void> _showLocalNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'your_channel_id_v2',
      'your_channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('happy_sound'),
      icon: '@mipmap/ic_launcher',
      ticker: 'ticker',
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _flutterLocalNotificationsPlugin.show(
      _notificationCounter++,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }
}
