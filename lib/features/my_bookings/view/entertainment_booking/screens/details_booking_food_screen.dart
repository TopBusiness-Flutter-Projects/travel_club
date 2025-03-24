import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/features/my_bookings/cubit/my_bookings_state.dart';
import 'package:travel_club/features/residence/view/residence_booking/widgets/custom_rounded_button.dart';
import '../../../../transportation/cubit/transportation_cubit.dart';
import '../../../cubit/my_bookings_cubit.dart';
import '../../../data/models/get_entertainment_details_reserv.dart';
import '../../../data/models/get_entertainment_reservation_model.dart';
import '../../widgets/show_rate_bottom_sheet.dart';
import '../widgets/big_container_entertainment.dart';
import '../widgets/member_details.dart';

class DetailsBookingEntertainment extends StatefulWidget {
  const DetailsBookingEntertainment({super.key,required this.entertainmentModel});
 final ReservationEntertainment entertainmentModel;
  @override
  State<DetailsBookingEntertainment> createState() =>
      _DetailsBookingEntertainmentState();
}

class _DetailsBookingEntertainmentState
    extends State<DetailsBookingEntertainment> {
  @override
  void initState() {
    context.read<MyReservationsCubit>().getEntertainmentReservationDetailsModel =
        GetEntertainmentReservationDetailsModel();
    context.read<MyReservationsCubit>().getReservationDetails(
        reservationId: widget.entertainmentModel.id!);
    // TODO: implement initState
    // context.read<TransportationCubit>().isGoOnly = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<MyReservationsCubit>();
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
                  CustomBookingEntertainmentContainerBig(
                    entertainmentModel: EntertainmentModel(
                        numofnights:widget. entertainmentModel.process.toString(),
                        price:widget.entertainmentModel.totalPrice.toString(),
                        title:widget.entertainmentModel.wayService.toString(),
                        date: widget.entertainmentModel.date.toString(),
                        rate: widget.entertainmentModel.rate,
                        numOfBooking: widget.entertainmentModel.transactionId.toString() ,
                        status:true
                    ),
                  ), //text

                  //from and to date

                  SizedBox(
                    height: 30.h,
                  ),
//members details
cubit.getEntertainmentReservationDetailsModel.data==null?Center(child: CustomLoadingIndicator()):
                   MemberDetailsEntertainment(reservationEntertainment: cubit.getEntertainmentReservationDetailsModel.data??EntertainmentData(),),

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
