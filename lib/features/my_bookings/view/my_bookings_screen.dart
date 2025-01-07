// ignore_for_file: deprecated_member_use

import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/main_screen/cubit/cubit.dart';
import 'package:travel_club/features/main_screen/cubit/state.dart';

import '../../home/screens/home_body.dart';
import '../../home/screens/widgets/custom_appbar.dart';
import '../../home/screens/widgets/custom_category_section.dart';
import '../../my_account/screens/widgets/profile_not_loging.dart';
import '../cubit/my_bookings_cubit.dart';
import '../cubit/my_bookings_state.dart';
import 'my_booking_body.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});
  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  @override
  Widget build(BuildContext context) {
    MyBookingsCubit cubit = context.read<MyBookingsCubit>();
    return BlocBuilder<MyBookingsCubit, MyBookingsState>(
      builder: (context, state) {
        return
          AppConst.isLogged==false?ProfileNotLoging(title: AppTranslations.myBookings,):

              SizedBox(
          height: getHeightSize(context),
          width: getWidthSize(context),
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  child: Image.asset(
                    ImageAssets.mask,
                    fit: BoxFit.cover,
                    height: getHeightSize(context) * 0.3,
                    width: getWidthSize(context),
                  )),
              SizedBox(
                  height: getHeightSize(context),
                  width: getWidthSize(context),
                  child: const Bookingbody())
            ],
          ),
        );
      },
    );
  }
}
