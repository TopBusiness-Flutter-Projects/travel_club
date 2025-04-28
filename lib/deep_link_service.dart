// import 'dart:developer';
// import 'package:app_links/app_links.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:travel_club/config/routes/app_routes.dart';
// import 'package:travel_club/core/exports.dart';
// import 'package:travel_club/features/entertainment/screens/details_of_entertainment/screens/details_entertainment.dart';
// import 'package:travel_club/features/food/screens/details_of_food/screens/details_food_screen.dart';
// import 'package:travel_club/features/other_services/screens/single_service_details.dart';
// import 'package:travel_club/features/residence/view/screens/lodge_details.dart';
// import 'package:travel_club/notification_service.dart';

// String? deepLink ;
// String? linkId;
// class DeepLinkService {
//   static final DeepLinkService _instance = DeepLinkService._internal();
//   factory DeepLinkService() => _instance;
//   DeepLinkService._internal();
 
//   late final AppLinks _appLinks;

 
//   Future<void> initialize() async {
//     await  _initializeAppLinks();


//   }
//  Future<void> _initializeAppLinks() async {
//     _appLinks = AppLinks();
//     final initialLink = await _appLinks.getInitialLink();
//     if (initialLink != null) {
//       _handleDeepLink(initialLink);
//     } 
//     _appLinks.uriLinkStream.listen((Uri? uri) {
//       if (uri != null) {
//         _handleDeepLink(uri);
//       }
//     }, onError: (err) {
//       log('Error handling deep link: $err');
//     });
//   }
//    void _handleDeepLink(Uri initialDeepLink) {
//     successGetBar("the link is : ${initialDeepLink.toString()}");
//     if (initialDeepLink.toString().contains("lodge") &&
//         initialDeepLink.queryParameters['id'] != null) {
//           deepLink = "lodge";
//           linkId = initialDeepLink.queryParameters['id'];
//       // String? id = initialDeepLink.queryParameters['id'];
//       // id == null
//       //     ?  navigatorKey.currentState?.pushNamedAndRemoveUntil( Routes.mainRoute, (route) => false)
//       //     :  navigatorKey.currentState?.pushNamedAndRemoveUntil( Routes.lodgeDetailsRoute, (route) => false,
//       //         arguments: LodgeDetailsArguments(
//       //             lodgeId: int.parse(id), isDeeplink: true));
//     } else if (initialDeepLink.toString().contains("entertainment") &&
//         initialDeepLink.queryParameters['id'] != null) {
//       String? id = initialDeepLink.queryParameters['id'];
//       id == null
//           ?  navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.mainRoute, (route) => false)
//           :  navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.detailsEntertainment, (route) => false,
//               arguments: EntertainmentDetailsArgs(
//                   id: int.parse(id), isDeeplink: true));
//     } else if (initialDeepLink.toString().contains("restaurant") &&
//         initialDeepLink.queryParameters['id'] != null) {
//       String? id = initialDeepLink.queryParameters['id'];
//          id == null
//           ?
//             navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.mainRoute, (route) => false)
//           :  navigatorKey.currentState?.pushReplacementNamed( Routes.detailsFoodRoute,
//               arguments: DetailsFoodArgs(id:id, isDeeplink: true));
//       // id == null
//       //     ? Navigator.pushReplacementNamed(context, Routes.mainRoute)
//       //     : Navigator.pushReplacementNamed(context, Routes.detailsFoodRoute,
//       //         arguments: DetailsFoodArgs(id: id, isDeeplink: true));
//     } else if (initialDeepLink.toString().contains("otherservice") &&
//         initialDeepLink.queryParameters['id'] != null) {
//       String? id = initialDeepLink.queryParameters['id'];
//       id == null
//           ?  navigatorKey.currentState?.pushNamedAndRemoveUntil( Routes.mainRoute, (route) => false)
//           :  navigatorKey.currentState?.pushNamedAndRemoveUntil( Routes.detailsOtherServices, (route) => false,
//               arguments: ServicesDetailsArguments( 
//                   id: int.parse(id), isDeeplink: true) );
//     } else {
//       navigatorKey.currentState?.pushNamedAndRemoveUntil( Routes.mainRoute, (route) => false);
//     }
//   }

// }
