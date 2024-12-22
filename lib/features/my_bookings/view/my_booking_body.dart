import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/my_bookings/view/transportation_booking/widgets/custom_booking_transportation_body.dart';
import 'package:travel_club/features/my_bookings/view/widgets/custom_catogrey_booking.dart';
import '../../home/screens/widgets/custom_appbar.dart';
import '../cubit/my_bookings_cubit.dart';
import '../cubit/my_bookings_state.dart';
import 'accommodation_booking/screens/custom_booking_accommodation_body.dart';
import 'food_booking/screens/custom_booking_food.dart';



class Bookingbody extends StatefulWidget {
  const Bookingbody({
    super.key,
  });

  @override
  State<Bookingbody> createState() => _BookingbodyState();
}

class _BookingbodyState extends State<Bookingbody> {
  @override
  Widget build(BuildContext context) {
    MyBookingsCubit cubit = context.read<MyBookingsCubit>();
    return BlocBuilder<MyBookingsCubit,MyBookingsState >(builder: (context, state) {
      return Column(children: [
        SizedBox(height: getVerticalPadding(context) * 2),
         //app bar
         CustomHomeAppbar(isHome: false, title: 'نونو',),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //list view حجوزات اول حاجه

              Padding(
                  padding:  EdgeInsets.only(top:45.0.h,right: 10.w),
                  child: SizedBox(
                  height: 54.h, // Fixed height for the ListView
                  child: ListView.separated(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                  return CustomBookingSection(index: index,);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10.w);
                  },
                  ),
                  ),
                ),
              //body ...
              if(cubit.categories[cubit.selectedIndex] ==     AppTranslations.accommodationBookings
              )
                AccommodationBookingBody(),
                // SizedBox(height: 30.h,)

               if(cubit.categories[cubit.selectedIndex] == AppTranslations.transportation)
                TransportationBookingBody(),
              if(cubit.categories[cubit.selectedIndex] ==AppTranslations.foodBookings)
                FoodBookingBody()

            ],
          ),
        ),
      ]);
    });
  }
}
