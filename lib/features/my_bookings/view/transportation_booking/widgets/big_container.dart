//big conatiner

import 'package:travel_club/features/my_bookings/view/transportation_booking/widgets/small_container.dart';

import '../../../../../../core/exports.dart';
import 'custom_booking_transportation_body.dart';

class CustomBookingTransportationContainerBig extends StatelessWidget {
  CustomBookingTransportationContainerBig({super.key, required this.ispaid});
  bool ispaid = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomContainerWithShadow(
          child: Column(
        children: [
          //custom container small
          CustomBookingTransportationContainerSmall(
            transportationBookingModel: TransportationBookingModel(
              title: "جو باص",
              isFavorite: false,
              image:
                  "https://lotel.efaculty.tech/storage/cities/91721735112823.webp",
              seatsNum: "43",
              time: '7:00',
            ),
          ),
          //Row under container
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
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
                    color: ispaid
                        ? AppColors.green.withOpacity(.12)
                        : AppColors.red.withOpacity(.12),
                    width: 100.w,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 7),
                      child: Center(
                          child: Text(
                        ispaid
                            ? AppTranslations.bookingSuccess
                            : AppTranslations.cancelBooking,
                        style: getMediumStyle(
                            fontSize: 14.sp,
                            color: ispaid ? AppColors.green : AppColors.red),
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
                    style:
                        getRegularStyle(fontSize: 14.sp, color: AppColors.grey),
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
    );
  }
}
