import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/my_bookings/cubit/my_bookings_state.dart';
import 'package:travel_club/features/my_bookings/view/residence_booking/widgets/payment_widget.dart';
import 'package:travel_club/features/my_bookings/view/widgets/custom_buttons.dart';
import 'package:travel_club/features/payment/screens/widgets/custom_price_widget.dart';
import 'package:travel_club/features/payment/screens/widgets/payment_widget.dart';

import '../../../cubit/my_bookings_cubit.dart';
import '../../../data/models/get_entertainment_details_reserv.dart';
import '../../../data/models/get_entertainment_reservation_model.dart';
import '../widgets/big_container_entertainment.dart';
import '../widgets/member_details.dart';

class DetailsBookingEntertainment extends StatefulWidget {
  const DetailsBookingEntertainment(
      {super.key, required this.entertainmentModel});
  final ReservationEntertainment entertainmentModel;
  @override
  State<DetailsBookingEntertainment> createState() =>
      _DetailsBookingEntertainmentState();
}

class _DetailsBookingEntertainmentState
    extends State<DetailsBookingEntertainment> {
  @override
  void initState() {
    context
            .read<MyReservationsCubit>()
            .getEntertainmentReservationDetailsModel =
        GetEntertainmentReservationDetailsModel();
    context
        .read<MyReservationsCubit>()
        .getReservationDetails(reservationId: widget.entertainmentModel.id!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MyReservationsCubit>();
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
                        numofnights:
                            widget.entertainmentModel.process.toString(),
                        price: widget.entertainmentModel.totalPrice.toString(),
                        title: widget.entertainmentModel.wayService.toString(),
                        date: widget.entertainmentModel.date.toString(),
                        rate: widget.entertainmentModel.rate,
                        numOfBooking:
                            widget.entertainmentModel.transactionId.toString(),
                        status: true),
                  ), //text

                  //from and to date

                  SizedBox(
                    height: 30.h,
                  ),
                  if (state is FailureGetReservationDetailsState)
                    const Center(
                      child: Text(
                        "server error",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  else if (cubit.getEntertainmentReservationDetailsModel.data ==
                      null)
                    const Center(child: CustomLoadingIndicator())
                  else ...[
                    MemberDetailsEntertainment(
                      reservationEntertainment:
                          cubit.getEntertainmentReservationDetailsModel.data ??
                              EntertainmentData(),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    if (widget.entertainmentModel.process == 0)
                      CustomPricesWidget(
                        totalPrice: cubit
                            .getEntertainmentReservationDetailsModel
                            .data!
                            .totalPrice
                            .toString(),
                        totalPriceAfterVat: cubit
                            .getEntertainmentReservationDetailsModel
                            .data!
                            .totalPriceAfterVat
                            .toString(),
                        vat: cubit
                            .getEntertainmentReservationDetailsModel.data!.vat
                            .toString(),
                        terms: cubit
                            .getEntertainmentReservationDetailsModel.data!.rule,
                        reservationId: cubit
                                .getEntertainmentReservationDetailsModel
                                .data
                                ?.id ??
                            0,
                      )
                    else ...[
                      SizedBox(
                        height: 20.h,
                      ),
                      PaymentDetailsContainer(
                        totalPrice: cubit
                            .getEntertainmentReservationDetailsModel
                            .data!
                            .totalPrice
                            .toString(),
                        totalPriceAfterVat: cubit
                            .getEntertainmentReservationDetailsModel
                            .data!
                            .totalPriceAfterVat
                            .toString(),
                        vat: cubit
                            .getEntertainmentReservationDetailsModel.data!.vat
                            .toString(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                    if (cubit.getEntertainmentReservationDetailsModel.data!
                            .canCancel !=
                        null)
                      CancelReservationButton(
                        reservationid: widget.entertainmentModel.id ?? 0,
                      ),
                    if (widget.entertainmentModel.process == 2 &&
                        cubit.getEntertainmentReservationDetailsModel.data
                                ?.isRated ==
                            false)
                      RateReservationButton(
                        reservationId: widget.entertainmentModel.id ?? 0,
                        id: cubit.getEntertainmentReservationDetailsModel.data
                                ?.organizationId ??
                            0,
                      ),
                  ],
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
