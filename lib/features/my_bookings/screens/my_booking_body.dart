import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_text_form_field.dart';
import 'package:travel_club/features/my_bookings/screens/widgets/custom_catogrey_booking.dart';

import '../../home/cubit/home_cubit.dart';
import '../../home/cubit/home_state.dart';
import '../../home/screens/widgets/custom_appbar.dart';
import '../../home/screens/widgets/custom_bag_section.dart';
import '../../home/screens/widgets/custom_category_section.dart';
import '../../home/screens/widgets/custom_offers_section.dart';
import '../cubit/my_bookings_cubit.dart';
import '../cubit/my_bookings_state.dart';


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
        //list view
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
      Padding(
        padding:  EdgeInsets.only(top:25.0.h,right: 10.w),
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
                //body
                if(cubit.Catogries[cubit.selcetedIndex] == "حجوزات الاقامه")...[
CustomContainerWithShadow(child: Column(
  children: [
    Text("nono"),
    Text("nahola"),
  ],
))                ]else if(cubit.Catogries[cubit.selcetedIndex] == AppTranslations.transportation)...[
                  Text("nahola")
                ]else...[
                  Text("nonoonononono")
                ]
              ],
            ),
          ),
        ),
      ]);
    });
  }
}
