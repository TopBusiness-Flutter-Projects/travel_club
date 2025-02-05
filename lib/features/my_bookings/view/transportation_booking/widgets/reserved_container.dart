//big conatiner

import 'package:travel_club/features/my_bookings/data/models/transportation_reservation_model.dart';
import 'package:travel_club/features/my_bookings/view/transportation_booking/widgets/small_container.dart';
import '../../../../../../core/exports.dart';

class CustomTransportationReservedContainer extends StatelessWidget {
  const CustomTransportationReservedContainer(
      {super.key,
      this.isDetails = true,
      required this.transportationReservation});

  final bool isDetails;
  final TransportationReservation transportationReservation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.detailsbookingTransportation,
              arguments: transportationReservation);
        },
        child: CustomContainerWithShadow(
            child: Column(
          children: [
            //custom container small
            CustomBookingTransportationContainerSmall(
              isDetails: isDetails,
              transportationReservation: transportationReservation,
            ),
            //Row under container
            Row(
              crossAxisAlignment:
                  transportationReservation.transactionId != null
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (transportationReservation.transactionId !=
                            null) ...[
                          Text(
                            AppTranslations.numberBooking,
                            style: getRegularStyle(
                                color: AppColors.grey, fontSize: 16.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            transportationReservation.transactionId.toString(),
                            style: getMediumStyle(fontSize: 16.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          )
                        ],
                        if (transportationReservation.process != 2) ...[
                          CustomContainerWithShadow(
                            reduis: 7,
                            isShadow: false,
                            color: transportationReservation.process == 0
                                ? AppColors.orange.withOpacity(.12)
                                : transportationReservation.process == 3
                                    ? AppColors.red.withOpacity(.12)
                                    : AppColors.green.withOpacity(.12),
                            // width: 100.w,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6.0, vertical: 7),
                              child: Center(
                                  child: AutoSizeText(
                                transportationReservation.process == 0
                                    ? AppTranslations.pending
                                    : transportationReservation.process == 1
                                        ? AppTranslations.bookingSuccess
                                        : transportationReservation.process == 3
                                            ? AppTranslations.cancelBooking
                                            : AppTranslations.bookingSuccess,
                                style: getMediumStyle(
                                    fontSize: 13.sp,
                                    color: transportationReservation.process ==
                                            0
                                        ? AppColors.orange
                                        : transportationReservation.process == 3
                                            ? AppColors.red
                                            : AppColors.green),
                                maxLines: 1,
                              )),
                            ),
                          ),
                        ],
                        SizedBox(
                          height: 5.h,
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.calendar,
                              color: AppColors.secondPrimary,
                            ),
                            Text(
                              transportationReservation.departureDate ?? "",
                              style: getRegularStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          AppTranslations.bookingPrice,
                          style: getRegularStyle(
                              fontSize: 14.sp, color: AppColors.grey),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          transportationReservation.totalPrice +
                              " " +
                              AppTranslations.currency,
                          style: getSemiBoldStyle(
                              fontSize: 14.sp, color: AppColors.primary),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                      ]),
                )
              ],
            ),
            //SizedBox
            SizedBox(
              height: 5.h,
            )
          ],
        )),
      ),
    );
  }
}
