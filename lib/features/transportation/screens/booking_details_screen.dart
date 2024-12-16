// ignore_for_file: deprecated_member_use

import 'package:dotted_border/dotted_border.dart';
import 'package:travel_club/core/exports.dart';
import 'package:dotted_line/dotted_line.dart';

import 'widgets/custom_booked_company_container.dart';
import 'widgets/custom_go_back_container.dart';

class TransportationBookingDetailsScreen extends StatefulWidget {
  const TransportationBookingDetailsScreen({super.key});
  @override
  State<TransportationBookingDetailsScreen> createState() =>
      _TransportationBookingDetailsScreenState();
}

class _TransportationBookingDetailsScreenState
    extends State<TransportationBookingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
        appbarTitle: AppTranslations.bookingDetails,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(getHorizontalPadding(context)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CustomBookedCompanyContainer(),
              SizedBox(
                height: getVerticalPadding(context),
              ),
              const CustomGoBackContainer(),
              SizedBox(
                height: getVerticalPadding(context),
              ),
              CustomContainerWithShadow(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Column(children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.primary,
                        ),
                        Expanded(
                            child: Container(
                          width: 2,
                          color: AppColors.primary,
                        )),
                        Icon(
                          Icons.location_on,
                          color: AppColors.primary,
                          size: 24,
                        )
                      ]),
                      SizedBox(
                        height: 200,
                      )
                    ],
                  ),
                ),
              ))
            ]),
          ),
        ));
  }
}
