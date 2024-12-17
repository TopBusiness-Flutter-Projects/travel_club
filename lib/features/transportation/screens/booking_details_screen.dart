// ignore_for_file: deprecated_member_use

import 'package:dotted_border/dotted_border.dart';
import 'package:travel_club/core/exports.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/core/widgets/dropdown_button_form_field.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_state.dart';

import 'widgets/custom_booked_company_container.dart';
import 'widgets/custom_from_to_date.dart';
import 'widgets/custom_from_to_section.dart';
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
  void initState() {
    context.read<TransportationCubit>().goOnly = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TransportationCubit cubit = context.read<TransportationCubit>();
    return BlocBuilder<TransportationCubit, TransportationState>(
        builder: (context, state) {
      return CustomScreen(
          appbarTitle: AppTranslations.bookingDetails,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(getHorizontalPadding(context)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomBookedCompanyContainer(),
                    SizedBox(
                      height: getVerticalPadding(context),
                    ),
                    const CustomGoBackContainer(),
                    SizedBox(
                      height: getVerticalPadding(context),
                    ),
                    CustomFomToSection(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getVerticalPadding(context)),
                      child: Text(
                          cubit.goOnly
                              ? AppTranslations.selectGoing
                              : AppTranslations.selectGoingAndReturn,
                          style: getMediumStyle(fontSize: 14.sp)),
                    ),
                    CustomFromToDate(),
                    SizedBox(
                      height: getVerticalPadding(context),
                    ),
                    CustomButton(
                        title: AppTranslations.transportationResults,
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.transportationSearchResultRoute);
                        })
                  ]),
            ),
          ));
    });
  }
}
