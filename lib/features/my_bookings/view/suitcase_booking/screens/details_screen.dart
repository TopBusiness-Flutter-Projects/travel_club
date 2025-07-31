import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/my_bookings/cubit/my_bookings_state.dart';
import 'package:travel_club/features/my_bookings/data/models/suitcase_reservation.dart';
import 'package:travel_club/features/my_bookings/view/suitcase_booking/widgets/big_container.dart';
import 'package:travel_club/features/payment/screens/widgets/custom_price_widget.dart';
import '../../../cubit/my_bookings_cubit.dart';
import '../../widgets/custom_buttons.dart';
import '../widgets/payment_widget.dart';

class SuitCaseDetailsBookingArguments {
  final SuitCaseReservation suitcaseReservationModel;
  SuitCaseDetailsBookingArguments({required this.suitcaseReservationModel});
}

class SuitCaseRessrvationDetails extends StatefulWidget {
  const SuitCaseRessrvationDetails({super.key, required this.arguments});
  final SuitCaseDetailsBookingArguments arguments;

  @override
  State<SuitCaseRessrvationDetails> createState() =>
      _SuitCaseRessrvationDetailsState();
}

class _SuitCaseRessrvationDetailsState
    extends State<SuitCaseRessrvationDetails> {
  @override
  void initState() {
    context.read<MyReservationsCubit>().getSuitcaseReservationDetailsModel =
        null;
    context.read<MyReservationsCubit>().getReservationDetails(
        reservationId: widget.arguments.suitcaseReservationModel.id!);

    super.initState();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyReservationsCubit, MyReservationsState>(
      builder: (BuildContext context, state) {
        var cubit = context.read<MyReservationsCubit>();
        return CustomScreen(
          appbarTitle: AppTranslations.detailsBooking,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  if (cubit.getSuitcaseReservationDetailsModel?.data == null)
                    Padding(
                      padding:
                          EdgeInsets.only(top: getHeightSize(context) * 0.15),
                      child: const Center(
                        child: CustomLoadingIndicator(),
                      ),
                    )
                  else ...[
//payment
  SizedBox(
                    height: 20.h,
                  ),
                  CustomBookingAccommodationContainerBig(
                    suitcaseReservationModel:
                        cubit.getSuitcaseReservationDetailsModel!.data!
                            .suitCaseReservation?? SuitCaseReservation(),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                    if (cubit.getSuitcaseReservationDetailsModel?.data?.suitCaseReservation?.process ==
                        0)
                      CustomPricesWidget(
                        totalPrice: cubit.getSuitcaseReservationDetailsModel
                            ?.data!.totalPrice
                            .toString(),
                        totalPriceAfterVat: cubit
                                .getSuitcaseReservationDetailsModel
                                ?.data!
                                .totalPriceAfterVat
                                ?.toString() ??
                            '',
                        vat: cubit.getSuitcaseReservationDetailsModel?.data!.vat
                            .toString(),
                        terms: cubit
                            .getSuitcaseReservationDetailsModel?.data?.rule
                            .toString(),
                        reservationId: cubit
                                .getSuitcaseReservationDetailsModel?.data?.id ??
                            0,
                      )
                    else ...[
                      SizedBox(
                        height: 20.h,
                      ),
                      ReservationPaymentDetailsContainer(
                        nightes: widget
                            .arguments.suitcaseReservationModel.nights
                            .toString(),
                        totalPrice: cubit.getSuitcaseReservationDetailsModel
                                ?.data!.totalPrice
                                .toString() ??
                            '',
                        totalPriceAfterVat: cubit
                                .getSuitcaseReservationDetailsModel
                                ?.data!
                                .totalPriceAfterVat
                                .toString() ??
                            '',
                        vat: cubit.getSuitcaseReservationDetailsModel?.data!.vat
                                .toString() ??
                            '',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                    if (cubit.getSuitcaseReservationDetailsModel?.data!
                            .canCancel !=
                        null)
                      CancelReservationButton(
                        reservationid:
                            widget.arguments.suitcaseReservationModel.id ?? 0,
                      ),

                    SizedBox(
                      height: 40.h,
                    )
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
