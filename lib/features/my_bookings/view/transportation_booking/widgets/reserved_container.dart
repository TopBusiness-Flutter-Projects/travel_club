//big conatiner

import 'package:travel_club/features/my_bookings/data/models/transportation_reservation_model.dart';
import 'package:travel_club/features/my_bookings/view/transportation_booking/widgets/small_container.dart';

import '../../../../../../core/exports.dart';

class CustomTransportationReservedContainer extends StatelessWidget {
  const CustomTransportationReservedContainer(
      {super.key,   this.isDetails = true, required this.transportationReservation});
  
 final bool isDetails ;
 final TransportationReservation transportationReservation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.detailsbookingTransportation);
        },
        child: CustomContainerWithShadow(
            child: Column(
          children: [
            //custom container small
            CustomBookingTransportationContainerSmall(
              isDetails: isDetails,
              
            ),
            //Row under container
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppTranslations.numberBooking,
                          style: getRegularStyle(color: AppColors.grey),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "6365467858",
                          style: getMediumStyle(),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomContainerWithShadow(
                          reduis: 7,
                          isShadow: false,
                          color:
                          //  ispaid
                          //     ? AppColors.green.withOpacity(.12)
                          //     :
                               AppColors.red.withOpacity(.12),
                          width: 100.w,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 7),
                            child: Center(
                                child: Text(
                              // ispaid
                              //     ? AppTranslations.bookingSuccess
                              //     : 
                                  AppTranslations.cancelBooking,
                              style: getMediumStyle(
                                  fontSize: 14.sp,
                                  color:
                                      // ispaid ? AppColors.green :
                                       AppColors.red),
                              maxLines: 1,
                            )),
                          ),
                        ),
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
                              "٢٠ يناير ٢٠٢٢",
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
                          AppTranslations.ticketsPrice,
                          style: getRegularStyle(
                              fontSize: 14.sp, color: AppColors.grey),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "5000" + " " + AppTranslations.currency,
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
