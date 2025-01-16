// ignore_for_file: deprecated_member_use

import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/utils/convert_numbers_method.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/features/residence%20module/view/residence_booking/screens/widgets/linear_progress.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_state.dart';

import 'trip_details_first_screen copy.dart';
import 'widgets/custom_copun_widget.dart';
import 'widgets/custom_from_to_details_yellow_container.dart';
import 'widgets/custom_search_result_container.dart';
import 'widgets/payment_widget.dart';

class TripDetailsSecondScreen extends StatefulWidget {
  const TripDetailsSecondScreen({super.key});
  @override
  State<TripDetailsSecondScreen> createState() =>
      _TripDetailsSecondScreenState();
}

class _TripDetailsSecondScreenState extends State<TripDetailsSecondScreen> {
  @override
  Widget build(BuildContext context) {
    TransportationCubit cubit = context.read<TransportationCubit>();
    return BlocBuilder<TransportationCubit, TransportationState>(
        builder: (context, state) {
      return CustomScreen(
          appbarTitle: AppTranslations.tripDetails,
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: LinearProgress(
                            value: 0.5,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.all(getHorizontalPadding(context)),
                          child: CustomFromToDetails(cubit: cubit),
                        ),
                        const CustomSearchResultContainer(),
                        const CustomSelectgedSeatWidget(),
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
                                //copun
                                Text(
                                  AppTranslations.areYouHaveACoupon,
                                  style: getMediumStyle(fontSize: 14.sp),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),

                                CustomTransportationCopunWidget(),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              BlocBuilder<TransportationCubit, TransportationState>(
                  builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getHorizontalPadding(context)),
                  child: CustomButton(
                      title: AppTranslations.completePayment,
                      onTap: () {
                     Navigator.pushNamed(context, Routes.payment);
                      }),
                );
              }),
            ],
          ));
    });
  }
}

class CustomSelectgedSeatWidget extends StatelessWidget {
  const CustomSelectgedSeatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TransportationCubit cubit = context.read<TransportationCubit>();
    return BlocBuilder<TransportationCubit, TransportationState>(
        builder: (context, state) {
      return Padding(
        padding: EdgeInsets.all(getHorizontalPadding(context)),
        child: CustomContainerWithShadow(
          child: Padding(
            padding: EdgeInsets.all(10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppTranslations.numberOfSeats,
                    style: getBoldStyle(fontSize: 14.sp),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Wrap(
                        spacing: 5.w,
                        direction: Axis.horizontal,
                        runSpacing: 5.h,
                        children: [
                          ...List.from(cubit.selectedSeats..sort()).map((seat) {
                            // return Text("data");

                            return CustomSeat(
                              seatNumber: seat.toString(),
                              isEditable: false,
                              cubit: cubit,
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
