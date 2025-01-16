import 'package:travel_club/features/residence/view/residence_booking/screens/widgets/custom_rounded_button.dart';

import '../../../../../core/exports.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../transportation/cubit/transportation_cubit.dart';
import '../../../../transportation/cubit/transportation_state.dart';
import '../../../../transportation/screens/trip_details_second_screen.dart';
import '../../../../transportation/screens/widgets/custom_from_to_details_yellow_container.dart';
import '../../../../transportation/screens/widgets/custom_search_result_container.dart';
import '../../../../transportation/screens/widgets/payment_widget.dart';
import '../../accommodation_booking/widgets/show_model_bottom_sheet.dart';
import '../widgets/big_container.dart';

class DetailsBookingTransportaion extends StatelessWidget {
  const DetailsBookingTransportaion({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TransportationCubit>();
    return BlocBuilder<TransportationCubit, TransportationState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
          appbarTitle: AppTranslations.bookingDetails,
          body: ListView(
            children: [
              CustomBookingTransportationContainerBig(
                ispaid: true,
                isDetails: false,
              ),
              Padding(
                padding: EdgeInsets.all(getHorizontalPadding(context)),
                child: CustomFromToDetails(cubit: cubit),
              ),
              const CustomSearchResultContainer(),
              const CustomSelectgedSeatWidget(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getHorizontalPadding(context)),
                child: Padding(
                  padding: EdgeInsets.all(10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //payment
                      Text(
                        AppTranslations.paymentDetails,
                        style: getMediumStyle(fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TransportationPaymentWidget(),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
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
                      // CustomTransportationCopunWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
