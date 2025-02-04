import 'package:travel_club/features/my_bookings/data/models/transportation_reservation_model.dart';
import 'package:travel_club/features/residence/view/residence_booking/widgets/custom_rounded_button.dart';

import '../../../../../core/exports.dart';
import '../../../../transportation/cubit/transportation_cubit.dart';
import '../../../../transportation/cubit/transportation_state.dart';
import '../../../../transportation/screens/trip_details_second_screen.dart';
import '../../../../transportation/screens/widgets/custom_from_to_details_yellow_container.dart';
import '../../../../transportation/screens/widgets/payment_widget.dart';
import '../../widgets/show_rate_bottom_sheet.dart';
import '../widgets/reserved_container.dart';

class DetailsBookingTransportaion extends StatelessWidget {
  const DetailsBookingTransportaion({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TransportationCubit>();
    return BlocBuilder<TransportationCubit, TransportationState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
          appbarTitle: AppTranslations.bookingDetails,
          body: ListView(
            children: [
              CustomTransportationReservedContainer(
               transportationReservation: TransportationReservation(),
                isDetails: false,
              ),
              Padding(
                padding: EdgeInsets.all(getHorizontalPadding(context)),
                child: CustomFromToDetails(
                  fromDate: cubit.isGoOnly ? cubit.singleDate : cubit.fromDate,
                  from: cubit.selectedFromStation!.name ?? '',
                  to: cubit.selectedToStation!.name ?? '',
                  toDate: cubit.isGoOnly ? null : cubit.toDate,
                ),
              ),
              // CustomBusContainer(
              //   busCompanyModel: cubit.getAvailableBusesModel.data![0],
              // ),
              const CustomSelectgedSeatWidget(
                selectedGoSeats: [],
                selectedReturnSeats: [],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getHorizontalPadding(context)),
                child: Padding(
                  padding: EdgeInsets.all(10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //payment
                      Text(
                        AppTranslations.paymentDetails,
                        style: getMediumStyle(fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TransportationPaymentWidget(),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
//button
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              color: AppColors.red,
                              title: AppTranslations.cancelBooking,
                              onTap: () {
                                Navigator.pushNamed(context, Routes.payment);
                              },
                            ),
                          ),
                          SizedBox(width: 10.w), // Add spacing between buttons
                          Expanded(
                              child: CustomRoundedButton(
                            title: AppTranslations.experienceEvaluation,
                            onTap: () {
                              showAddRateBottomSheet(context);
                              // Navigator.pushNamed(context, Routes.);
                            },
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      )
                      // CustomTransportationCopunWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
