//big conatiner

import 'package:travel_club/features/my_bookings/data/models/suitcase_reservation.dart';
import 'package:travel_club/features/my_bookings/view/suitcase_booking/widgets/small_container.dart';

import '../../../../../../core/exports.dart';

class CustomBookingAccommodationContainerBig extends StatelessWidget {
  const CustomBookingAccommodationContainerBig(
      {super.key,
      required this.suitcaseReservationModel,
      this.goTolodgeDetails = true});
  final SuitCaseReservation suitcaseReservationModel;
  final bool goTolodgeDetails;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomContainerWithShadow(
          child: Column(
        children: [
          //custom container
         
            CustomBookingAccommodationContainerSmall(
                goTolodgeDetails: goTolodgeDetails,
                lodgeModel: suitcaseReservationModel),
          //Row

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (suitcaseReservationModel.process != 0) ...[
                        Text(
                          AppTranslations.numberBooking,
                          style: getRegularStyle(color: AppColors.grey),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          suitcaseReservationModel.transactionId.toString() ??
                              "",
                          style: getMediumStyle(),
                        ),
                      ],
                      SizedBox(
                        height: 5.h,
                      ),
                      if (suitcaseReservationModel.process != 2) ...[
                        CustomContainerWithShadow(
                          reduis: 7,
                          isShadow: false,
                          color: suitcaseReservationModel.process == 0
                              ? AppColors.orange.withOpacity(.12)
                              : suitcaseReservationModel.process == 3
                                  ? AppColors.red.withOpacity(.12)
                                  : AppColors.green.withOpacity(.12),
                          width: 100.w,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 7),
                            child: Center(
                                child: Text(
                              suitcaseReservationModel.process == 0
                                  ? AppTranslations.pending
                                  : suitcaseReservationModel.process == 1
                                      ? AppTranslations.bookingSuccess
                                      : suitcaseReservationModel.process == 3
                                          ? AppTranslations.cancelBooking
                                          : AppTranslations.bookingSuccess,
                              style: getMediumStyle(
                                  fontSize: 14.sp,
                                  color: suitcaseReservationModel.process == 0
                                      ? AppColors.orange
                                      : suitcaseReservationModel.process == 3
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
                child: Column(children: [
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
                        suitcaseReservationModel.date?.toString() ?? "",
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
                    '${AppTranslations.priceFor}${suitcaseReservationModel.nights.toString()} ${AppTranslations.nights}',
                    style:
                        getRegularStyle(fontSize: 14.sp, color: AppColors.grey),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    '${suitcaseReservationModel?.totalPrice.toString()}' +
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
    );
  }
}
