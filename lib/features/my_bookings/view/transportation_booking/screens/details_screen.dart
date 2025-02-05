import 'package:travel_club/features/my_bookings/cubit/my_bookings_cubit.dart';
import 'package:travel_club/features/my_bookings/cubit/my_bookings_state.dart';
import 'package:travel_club/features/my_bookings/data/models/transportation_reservation_details_model.dart';
import 'package:travel_club/features/my_bookings/data/models/transportation_reservation_model.dart';
import 'package:travel_club/features/my_bookings/view/residence_booking/widgets/payment_widget.dart';
import 'package:travel_club/features/payment/screens/widgets/custom_price_widget.dart';
import 'package:travel_club/features/residence/view/residence_booking/widgets/custom_rounded_button.dart';
import 'package:travel_club/features/transportation/data/models/get_available_busis_model.dart';
import 'package:travel_club/features/transportation/screens/widgets/custom_bus_container.dart';

import '../../../../../core/exports.dart';
import '../../../../transportation/screens/trip_details_second_screen.dart';
import '../../../../transportation/screens/widgets/custom_from_to_details_yellow_container.dart';
import '../../widgets/transportation_tickets_prices_widget.dart';
import '../../widgets/show_rate_bottom_sheet.dart';
import '../widgets/reserved_container.dart';

class DetailsBookingTransportaion extends StatefulWidget {
  const DetailsBookingTransportaion(
      {super.key, required this.transportationReservation});
  final TransportationReservation transportationReservation;

  @override
  State<DetailsBookingTransportaion> createState() =>
      _DetailsBookingTransportaionState();
}

class _DetailsBookingTransportaionState
    extends State<DetailsBookingTransportaion> {
  @override
  void initState() {
    context
            .read<MyReservationsCubit>()
            .getTransportationReservationDetailsModel =
        GeTransportationReservationDetailsModel();
    context.read<MyReservationsCubit>().getReservationDetails(
        reservationId: widget.transportationReservation.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MyReservationsCubit>();
    return BlocBuilder<MyReservationsCubit, MyReservationsState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
          appbarTitle: AppTranslations.bookingDetails,
          body: ListView(
            children: [
              CustomTransportationReservedContainer(
                transportationReservation: widget.transportationReservation,
                isDetails: false,
              ),
              if (cubit.getTransportationReservationDetailsModel.data == null)
                Padding(
                  padding: EdgeInsets.only(top: getHeightSize(context) * 0.15),
                  child: const Center(
                    child: CustomLoadingIndicator(),
                  ),
                )
              else ...[
                Padding(
                  padding: EdgeInsets.all(getHorizontalPadding(context)),
                  child: CustomFromToDetails(
                    fromDate: cubit.getTransportationReservationDetailsModel
                            .data?.departureDate ??
                        '',
                    from: cubit.getTransportationReservationDetailsModel.data
                            ?.fromDepartureCompanyStation ??
                        '',
                    to: cubit.getTransportationReservationDetailsModel.data
                            ?.toDepartureCompanyStation ??
                        '',
                    toDate: cubit.getTransportationReservationDetailsModel.data
                        ?.returnDate,
                  ),
                ),
                CustomBusContainer(
                  isReturn: cubit.getTransportationReservationDetailsModel.data
                          ?.returnDate !=
                      null,
                  busCompanyModel: BusCompanyModel(
                      busModel: BusModel(
                        name: cubit.getTransportationReservationDetailsModel
                                .data?.bus ??
                            '',
                        chairs: cubit.getTransportationReservationDetailsModel
                                .data?.chairs ??
                            4,
                      ),
                      plateNumber: cubit
                              .getTransportationReservationDetailsModel
                              .data
                              ?.plateNumber ??
                          '',
                      selectedGoTime: BusTimeInDeparture(
                          fromTime: cubit
                                  .getTransportationReservationDetailsModel
                                  .data
                                  ?.fromDepartureTime ??
                              '',
                          price: cubit.getTransportationReservationDetailsModel
                                  .data?.fromDepartureTimePrice ??
                              "0"),
                      selectedReturnTime: BusTimeInDeparture(
                          fromTime: cubit
                                  .getTransportationReservationDetailsModel
                                  .data
                                  ?.fromReturnTime ??
                              '',
                          price: cubit.getTransportationReservationDetailsModel
                              .data?.fromReturnTimePrice)),
                ),
                CustomSelectgedSeatWidget(
                  isReturn: cubit.getTransportationReservationDetailsModel.data
                          ?.returnDate !=
                      null,
                  selectedGoSeats: cubit
                          .getTransportationReservationDetailsModel
                          .data
                          ?.departureReservedChairsNumber
                          ?.map((e) => e.number!)
                          .toList() ??
                      [],
                  selectedReturnSeats: cubit
                          .getTransportationReservationDetailsModel
                          .data
                          ?.returnReservedChairsNumber
                          ?.map((e) => e.number!)
                          .toList() ??
                      [],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getHorizontalPadding(context)),
                  child: CustomPricesWidget(
                    isPaid: widget.transportationReservation.process != 0,
                    ticketsWidget: Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: TransportationTicketspricesWidget(
                        isReturn: cubit.getTransportationReservationDetailsModel
                                .data?.returnDate !=
                            null,
                        goCounter: cubit
                                .getTransportationReservationDetailsModel
                                .data
                                ?.departureGuests ??
                            0,
                        returnCounter: cubit
                                .getTransportationReservationDetailsModel
                                .data
                                ?.returnGuests ??
                            0,
                        goPrice: double.parse((cubit
                                    .getTransportationReservationDetailsModel
                                    .data
                                    ?.fromDepartureTimePrice ??
                                0)
                            .toString()),
                        returnPrice: double.parse((cubit
                                    .getTransportationReservationDetailsModel
                                    .data
                                    ?.fromReturnTimePrice ??
                                0)
                            .toString()),
                      ),
                    ),

                    totalPrice: cubit.getTransportationReservationDetailsModel
                        .data!.totalPrice
                        .toString(),
                    totalPriceAfterVat: cubit
                        .getTransportationReservationDetailsModel
                        .data!
                        .totalPriceAfterVat
                        .toString(),
                    vat: cubit
                        .getTransportationReservationDetailsModel.data!.vat
                        .toString(),
                    terms: cubit
                        .getTransportationReservationDetailsModel.data!.rule ,
                    reservationId: widget.transportationReservation.id ?? 0,
                  ),
                ),
                if (cubit.getTransportationReservationDetailsModel.data!
                        .canCancel !=
                    null)
                  CustomButton(
                    isBordered: true,
                    title: AppTranslations.cancelBooking,
                    onTap: () {
                      // cubit.cancelReservation(context,
                      //     reservationId: widget
                      //         .arguments.residenceReservationModel.id!);
                    },
                  ),
                if (widget.transportationReservation.process == 2)
                  CustomButton(
                    isBordered: true,
                    title: AppTranslations.experienceEvaluation,
                    onTap: () {
                      showAddRateBottomSheet(context);
                    
                    },
                  ),
                SizedBox(
                  height: 40.h,
                ),
              ]
            ],
          ),
        );
      },
    );
  }
}
// Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3RyYXZlbC50b3BidXNpbmVzcy5lYmhhcmJvb2suY29tL2FwaS92MS9sb2dpbi9nb29nbGUiLCJpYXQiOjE3Mzg1Njc1MTksImV4cCI6MTc3MDEwMzUxOSwibmJmIjoxNzM4NTY3NTE5LCJqdGkiOiJwaHFqcHFWRXYxMmNLTTN6Iiwic3ViIjoiMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjciLCJhdXRoX3V1aWQiOiI4NzdmOTg3OS0wMGQ4LTQzZmEtODQ1Mi1kNzAxODZhMjBhMTMifQ.uQm5iQv2-ggcafk4gRiHKvxl5OO3aBzTyi13sSIoohw
