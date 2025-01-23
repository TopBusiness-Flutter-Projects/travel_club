import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/home/cubit/home_cubit.dart';
import 'package:travel_club/features/my_bookings/view/transportation_booking/widgets/custom_booking_transportation_body.dart';
import 'package:travel_club/features/my_bookings/view/widgets/custom_catogrey_reseration.dart';
import '../../home/cubit/home_state.dart';
import '../../home/screens/widgets/custom_appbar.dart';
import '../cubit/my_bookings_cubit.dart';
import '../cubit/my_bookings_state.dart';
import 'residence_booking/screens/custom_booking_accommodation_body.dart';
import 'entertainment_booking/screens/custom_booking_food.dart';
import 'food_booking/screens/custom_booking_food.dart';

class ReservationsBody extends StatefulWidget {
  const ReservationsBody({
    super.key,
  });

  @override
  State<ReservationsBody> createState() => _ReservationsBodyState();
}

class _ReservationsBodyState extends State<ReservationsBody> {
  void initState() {
    if (context.read<HomeCubit>().homeModel.data == null) {
      context.read<HomeCubit>().getHomeData();
    } if (context.read<MyReservationsCubit>().selectedIndex == 1) {
      context.read<MyReservationsCubit>().getMyBookingReservation();
    }else if(context.read<MyReservationsCubit>().selectedIndex == 2){
      //context.read<MyReservationsCubit>().getTransportationReservation();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    MyReservationsCubit cubit = context.read<MyReservationsCubit>();
    return BlocBuilder<MyReservationsCubit, MyReservationsState>(
        builder: (context, state) {
      return Column(children: [
        SizedBox(height: getVerticalPadding(context) * 2),
        //app bar
        CustomHomeAppbar(
          isHome: false,
          title: AppTranslations.myBookings,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //list view حجوزات اول حاجه
           BlocBuilder<HomeCubit, HomeState>(builder: (BuildContext context, state) {
             var cubit = context.read<HomeCubit>();
             return
             Padding(
             padding: EdgeInsets.only(top: 20.0.h, right: 10.w),
             child: SizedBox(
               height: 54.h, // Fixed height for the ListView
               child: ListView.separated(
                 itemCount:
                 cubit.homeModel.data!.modules!.length,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (BuildContext context, int index) {
                   return CustomReservationSection(
                    // index: index,
                     module: cubit.homeModel.data!.modules![index],
                   );
                 },
                 separatorBuilder: (BuildContext context, int index) {
                   return SizedBox(width: 10.w);
                 },
               ),
             ),
           );
             },),
              //body ...
              if (cubit.selectedIndex ==1) ...[
                AccommodationBookingBody(),
                SizedBox(
                  height: 90.h,
                )
              ],

               if (cubit.selectedIndex ==2)
                TransportationBookingBody(),
              if (cubit.selectedIndex ==3) ...[
                FoodBookingBody(),
                SizedBox(
                  height: 90.h,
                )
              ],
              if (cubit.selectedIndex ==4) ...[
                EntertainmentBookingBody(),
                SizedBox(
                  height: 90.h,
                )
              ],
              if (cubit.selectedIndex ==5) ...[
                EntertainmentBookingBody(),
                SizedBox(
                  height: 90.h,
                )
              ]
            ],
          ),
        ),
      ]);
    });
  }
}
