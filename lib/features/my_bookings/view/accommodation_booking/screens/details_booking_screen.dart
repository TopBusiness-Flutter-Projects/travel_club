import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/features/residence%20module/view/residence_booking/screens/widgets/payment_widget.dart';
import 'package:travel_club/features/my_bookings/cubit/my_bookings_state.dart';
import '../../../../residence module/view/residence_booking/screens/widgets/custom_container_booking.dart';
import '../../../../residence module/view/residence_booking/screens/widgets/custom_rounded_button.dart';
import '../../../../transportation/cubit/transportation_cubit.dart';
import '../../../../transportation/screens/widgets/custom_from_to_date.dart';
import '../../../cubit/my_bookings_cubit.dart';
import '../widgets/big_container.dart';
import '../widgets/show_model_bottom_sheet.dart';

class DetailsBooking extends StatefulWidget {
  const DetailsBooking({super.key});

  @override
  State<DetailsBooking> createState() => _DetailsBookingState();
}

class _DetailsBookingState extends State<DetailsBooking> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<TransportationCubit>().goOnly = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBookingsCubit, MyBookingsState>(
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
                  CustomBookingAccommodationContainerBig(),
                  SizedBox(
                    height: 25.h,
                  ),
                  //text
                  Text(
                    AppTranslations.selectGoingAndReturn,
                    style: getMediumStyle(fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //from and to date
                  CustomFromToDate(),
                  SizedBox(
                    height: 20.h,
                  ),
                  //custom widget rating hotel

                  SizedBox(
                    height: 20.h,
                  ),
                  //prefer hotel
                  Text(
                    AppTranslations.rooms,
                    style: getMediumStyle(fontSize: 14.sp),
                  ),
                  //custom contanier
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 300.h,
                    child: Swiper(
                      itemCount: 3, // Define the number of items in the swiper
                      itemBuilder: (BuildContext context, int index) {
                        // Return a CustomContainerBooking for each item
                        return
                            //   Container(
                            //   child : Text('Item dsas'),
                            // );
                            SizedBox(
                          // height: 600.h,
                          // width: getWidthSize(context),
                          child: CustomContainerBooking(
                            widgetBottom: SizedBox(),
                          ),
                        );
                      },
                      pagination: SwiperPagination(), // Optional pagination
                      //  control: SwiperControl(),  // Optional arrows for control
                    ),
                  ),
                  // CustomContainerBooking(),
                  SizedBox(
                    height: 10.h,
                  ),
//payment
                  SizedBox(
                    height: 20.h,
                  ),
                  PaymentWidget(
                    isDetailsBooking: true,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
//copun

                  SizedBox(
                    height: 10.h,
                  ),

//button
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          color: AppColors.red,
                          title: AppTranslations.cancelBooking,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.payment);
                          },
                        ),
                      ),
                      SizedBox(width: 10.w), // Add spacing between buttons
                      Expanded(
                          child: CustomRoundedButton(
                        title: AppTranslations.experienceEvaluation,
                        onTap: () {
                          showModelBottomSheetRatting(context);
                          // Navigator.pushNamed(context, Routes.);
                        },
                      )),
                    ],
                  ),
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
