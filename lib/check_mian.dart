import 'package:firebase_messaging/firebase_messaging.dart';

import 'core/exports.dart';
import 'features/main_screen/cubit/cubit.dart';
import 'features/main_screen/screens/main_screen.dart';
import 'features/my_bookings/cubit/my_bookings_cubit.dart';
import 'features/notification/screens/notification_screen.dart';
import 'features/splash/screens/splash_screen.dart';

class InitialRouteDecider extends StatefulWidget {
  final String? referenceTable;

  const InitialRouteDecider({Key? key, required this.referenceTable}) : super(key: key);

  @override
  State<InitialRouteDecider> createState() => _InitialRouteDeciderState();
}

class _InitialRouteDeciderState extends State<InitialRouteDecider> {
  late Widget screenToShow;

  @override
  void initState() {
    super.initState();

    final referenceTable = widget.referenceTable;

    if (referenceTable == 'room_reservations') {
      // غيري القيم هنا باستخدام navigatorKey
      Future.delayed(Duration.zero, () {
        // final context = navigatorKey.currentContext;
        context.read<MainCubit>().changePage(1);
        context.read<MyReservationsCubit>().selectedModuleId = 1;
        context.read<MyReservationsCubit>().changeModule(1);
      });

      screenToShow = MainScreen();
    } else if (referenceTable == 'bus_reservations') {
      Future.delayed(Duration.zero, () {
        // final context = navigatorKey.currentContext;
        context.read<MainCubit>().changePage(1);
        context.read<MyReservationsCubit>().selectedModuleId = 2;
        context.read<MyReservationsCubit>().changeModule(2);
      });

      screenToShow = MainScreen();
    } else if (referenceTable == 'organization_reservations') {
      Future.delayed(Duration.zero, () {
        // final context = navigatorKey.currentContext;
        context.read<MainCubit>().changePage(1);
        context.read<MyReservationsCubit>().selectedModuleId = 3;
        context.read<MyReservationsCubit>().changeModule(3);
      });

      screenToShow = MainScreen();
    } else if (referenceTable == 'restaurant_reservations') {
      Future.delayed(Duration.zero, () {
        // final context = navigatorKey.currentContext;
        context.read<MainCubit>().changePage(1);
        context.read<MyReservationsCubit>().selectedModuleId = 4;
        context.read<MyReservationsCubit>().changeModule(4);
      });

      screenToShow = MainScreen();
    } else {
      screenToShow = NotificationScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return screenToShow;
  }
}
