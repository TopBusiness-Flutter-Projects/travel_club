//big conatiner

import 'package:travel_club/features/my_bookings/view/residence_booking/widgets/small_container.dart';

import '../../../../../../core/exports.dart';
import '../../../data/models/residence_reservation_model.dart';

class CustomBookingAccommodationContainerBig extends StatelessWidget {
  const CustomBookingAccommodationContainerBig(
      {super.key,
      required this.residenceReservationModel,
      this.goTolodgeDetails = true});
  final ResidenceReservationModel residenceReservationModel;
  final bool goTolodgeDetails;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomContainerWithShadow(
          child: Column(
        children: [
          //custom container
          if (residenceReservationModel.lodge != null)
            CustomBookingAccommodationContainerSmall(
                goTolodgeDetails: goTolodgeDetails,
                lodgeModel: residenceReservationModel.lodge!),
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
                      if (residenceReservationModel.process != 0) ...[
                        Text(
                          AppTranslations.numberBooking,
                          style: getRegularStyle(color: AppColors.grey),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          residenceReservationModel.transactionId.toString() ??
                              "",
                          style: getMediumStyle(),
                        ),
                      ],
                      SizedBox(
                        height: 5.h,
                      ),
                      if (residenceReservationModel.process != 2) ...[
                        CustomContainerWithShadow(
                          reduis: 7,
                          isShadow: false,
                          color: residenceReservationModel.process == 0
                              ? AppColors.orange.withOpacity(.12)
                              : residenceReservationModel.process == 3
                                  ? AppColors.red.withOpacity(.12)
                                  : AppColors.green.withOpacity(.12),
                          width: 100.w,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 7),
                            child: Center(
                                child: Text(
                              residenceReservationModel.process == 0
                                  ? AppTranslations.pending
                                  : residenceReservationModel.process == 1
                                      ? AppTranslations.bookingSuccess
                                      : residenceReservationModel.process == 3
                                          ? AppTranslations.cancelBooking
                                          : AppTranslations.bookingSuccess,
                              style: getMediumStyle(
                                  fontSize: 14.sp,
                                  color: residenceReservationModel.process == 0
                                      ? AppColors.orange
                                      : residenceReservationModel.process == 3
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
                        residenceReservationModel?.from?.toString() ?? "",
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
                    AppTranslations.priceFor +
                        '${residenceReservationModel?.totalNights.toString()}' +
                        ' ' +
                        '${AppTranslations.nights}',
                    style:
                        getRegularStyle(fontSize: 14.sp, color: AppColors.grey),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    '${residenceReservationModel?.totalPrice.toString()}' +
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
