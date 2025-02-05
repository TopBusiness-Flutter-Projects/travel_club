import 'package:dotted_line/dotted_line.dart';
import 'package:travel_club/features/my_bookings/cubit/my_bookings_cubit.dart';
import 'package:travel_club/features/my_bookings/cubit/my_bookings_state.dart';
import 'package:travel_club/features/transportation/screens/trip_details_first_screen.dart';

import '../../../../../../core/exports.dart';

class TransportationTicketspricesWidget extends StatelessWidget {
  const TransportationTicketspricesWidget({
    super.key,
    this.isReturn = false,
    required this.goPrice,
    required this.returnPrice,
    required this.goCounter,
    required this.returnCounter,
  });
  final bool isReturn;
  final double goPrice;
  final double returnPrice;
  final int goCounter;
  final int returnCounter;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MyReservationsCubit>();
    return BlocBuilder<MyReservationsCubit, MyReservationsState>(
        builder: (BuildContext context, state) {
      return CustomContainerWithShadow(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: !isReturn
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTicketDetailsWidget(
                      isFirst: true,
                      title: AppTranslations.tickets,
                      value: "${goCounter}",
                    ),
                    CustomTicketDetailsWidget(
                        title: AppTranslations.ticketPrice,
                        value: "${goPrice}"),
                    CustomTicketDetailsWidget(
                      title: AppTranslations.theTotal,
                      value: "${goCounter * goPrice}",
                    )
                  ],
                )
              : Column(
                  children: [
                    if (goCounter != returnCounter) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTicketDetailsWidget(
                            isFirst: true,
                            title: goCounter < returnCounter
                                ? AppTranslations.returnTickets
                                : AppTranslations.goTickets,
                            value:
                                "${cubit.goAndReturnDifference(goCounter: goCounter, returnCounter: returnCounter)}",
                          ),
                          CustomTicketDetailsWidget(
                              title: AppTranslations.ticketPrice,
                              value:
                                  "${goCounter < returnCounter ? returnPrice : goPrice}"),
                          CustomTicketDetailsWidget(
                            title: AppTranslations.theTotal,
                            value:
                                "${cubit.goAndReturnDifference(goCounter: goCounter, returnCounter: returnCounter) * (goCounter < returnCounter ? returnPrice : goPrice)}",
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: DottedLine(
                          dashLength: 5,
                          dashGapLength: 4,
                          lineThickness: 1,
                          dashRadius: 2,
                          dashColor: AppColors.grey,
                        ),
                      )
                    ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTicketDetailsWidget(
                          isFirst: true,
                          title: AppTranslations.goAndReturnTickets,
                          value:
                              "${cubit.getRoundTripsCounter(goCounter: goCounter, returnCounter: returnCounter)}",
                        ),
                        4.horizontalSpace,
                        CustomTicketDetailsWidget(
                            title: AppTranslations.ticketPrice,
                            value:
                                "${(goPrice + returnPrice) - (goPrice + returnPrice) * 10 / 100}"),
                        4.horizontalSpace,
                        CustomTicketDetailsWidget(
                          title: AppTranslations.theTotal,
                          value:
                              "${cubit.getRoundTripsCounter(goCounter: goCounter, returnCounter: returnCounter) * ((goPrice + returnPrice) - (goPrice + returnPrice) * 10 / 100)} ",
                        )
                      ],
                    ),
                  ],
                ),
        ),
      );
    });
  }
}
