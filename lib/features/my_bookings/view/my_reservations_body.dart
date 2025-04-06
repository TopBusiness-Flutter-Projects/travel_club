import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/home/cubit/home_cubit.dart';
import 'package:travel_club/features/my_bookings/view/transportation_booking/screens/transportation_body.dart';
import 'package:travel_club/features/my_bookings/view/widgets/custom_catogrey_reseration.dart';
import '../../home/cubit/home_state.dart';
import '../../home/screens/widgets/custom_appbar.dart';
import '../cubit/my_bookings_cubit.dart';
import '../cubit/my_bookings_state.dart';
import 'residence_booking/screens/residence_body.dart';
import 'entertainment_booking/screens/custom_booking_entertainment.dart';
import 'food_booking/screens/custom_booking_food.dart';

class ReservationsBody extends StatefulWidget {
  const ReservationsBody({
    super.key,
  });

  @override
  State<ReservationsBody> createState() => _ReservationsBodyState();
}

class _ReservationsBodyState extends State<ReservationsBody> {
  @override
  void initState() {
    if (context.read<HomeCubit>().homeModel.data == null) {
      context.read<HomeCubit>().getHomeData();
    }
    context.read<MyReservationsCubit>().getMyReservation(moduleId: context.read<MyReservationsCubit>().selectedModuleId );
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
              BlocBuilder<HomeCubit, HomeState>(
                builder: (BuildContext context, state) {
                  var cubit = context.read<HomeCubit>();
                  return Padding(
                    padding: EdgeInsets.only(top: 20.0.h, right: 10.w),
                    child: SizedBox(
                      height: 54.h, // Fixed height for the ListView
                      child: ListView.separated(
                        itemCount: cubit.homeModel.data!.modules!.length - 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomReservationSection(
                         
                            module: cubit.homeModel.data?.modules?[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 10.w);
                        },
                      ),
                    ),
                  );
                },
              ),
              //body ...
              if (cubit.selectedModuleId == 1) ...[
         if (state is ErrorReservationBooking)
Expanded(child: Center(child: Text(state.error.toString())))
         //  Text("Error In Server please try again in another time")
           else if (state is LoadingReservationBooking || cubit.residenceReservationModel == null)
                     Expanded(child: Center(child: CustomLoadingIndicator()))

              else
           ResidenceReservedBody(),
                SizedBox(
                  height: 90.h,
                )
              ],

              if (cubit.selectedModuleId == 2)
                if (state is ErrorReservationBooking)
                  Expanded(child: Center(child: Text(state.error.toString())))
                //  Text("Error In Server please try again in another time")
                else if (state is LoadingReservationBooking || cubit.residenceReservationModel == null)
                  Expanded(child: Center(child: CustomLoadingIndicator()))

                else
                TransportationReservedBody(),
              if (cubit.selectedModuleId == 3) ...[
                if (state is ErrorReservationBooking)
                  Expanded(child: Center(child: Text(state.error.toString())))
                //  Text("Error In Server please try again in another time")
                else if (state is LoadingReservationBooking || cubit.residenceReservationModel == null)
                  Expanded(child: Center(child: CustomLoadingIndicator()))

                else
                FoodBookingBody(),
                SizedBox(
                  height: 90.h,
                )
              ],
              if (cubit.selectedModuleId == 4) ...[
                if (state is ErrorReservationBooking)
                  Expanded(child: Center(child: Text(state.error.toString())))
                //  Text("Error In Server please try again in another time")
                else if (state is LoadingReservationBooking || cubit.residenceReservationModel == null)
                  Expanded(child: Center(child: CustomLoadingIndicator()))

                else
                EntertainmentBookingBody(),
                SizedBox(
                  height: 90.h,
                )
              ],
              if (cubit.selectedModuleId == 5) ...[
                if (state is ErrorReservationBooking)
                  Expanded(child: Center(child: Text(state.error.toString())))
                //  Text("Error In Server please try again in another time")
                else if (state is LoadingReservationBooking || cubit.residenceReservationModel == null)
                  Expanded(child: Center(child: CustomLoadingIndicator()))

                else
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
