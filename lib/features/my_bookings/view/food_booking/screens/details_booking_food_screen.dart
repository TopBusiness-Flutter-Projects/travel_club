import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/features/my_bookings/cubit/my_bookings_state.dart';
import 'package:travel_club/features/residence/view/residence_booking/widgets/custom_rounded_button.dart';
import '../../../../transportation/cubit/transportation_cubit.dart';
import '../../../cubit/my_bookings_cubit.dart';
import '../../widgets/show_rate_bottom_sheet.dart';
import '../widgets/big_container_food.dart';
import '../widgets/member_details.dart';

class DetailsBookingFood extends StatefulWidget {
  const DetailsBookingFood({super.key});

  @override
  State<DetailsBookingFood> createState() => _DetailsBookingFoodState();
}

class _DetailsBookingFoodState extends State<DetailsBookingFood> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<TransportationCubit>().isGoOnly = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyReservationsCubit, MyReservationsState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
          appbarTitle: AppTranslations.detailsBooking,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomBookingFoodContainerBig(
                    foodModel: FoodModel(
                        numofnights: "4 ليالي ",
                        price: "5000",
                        title: "nono",
                        date: "13/12/2002",
                        rate: 0,
                        numOfBooking: "48721728",
                        status: true),
                  ), //text

                  //from and to date

                  SizedBox(
                    height: 30.h,
                  ),
//members details

                  MemberDetails(),

                  SizedBox(
                    height: 10.h,
                  ),
//button
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: CustomButton(
                  //         color: AppColors.red,
                  //         title: AppTranslations.cancelBooking,
                  //         onTap: () {
                  //           Navigator.pushNamed(context, Routes.payment);
                  //         },
                  //       ),
                  //     ),
                  //     SizedBox(width: 10.w), // Add spacing between buttons
                  //     Expanded(
                  //         child: CustomRoundedButton(
                  //       title: AppTranslations.experienceEvaluation,
                  //       onTap: () {
                  //         showAddRateBottomSheet(context);
                  //         // Navigator.pushNamed(context, Routes.);
                  //       },
                  //     )),
                  //   ],
                  // ),
                  SizedBox(
                    height: 40.h,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
