// ignore_for_file: deprecated_member_use

import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_state.dart';

import 'widgets/custom_booked_company_container.dart';
import 'widgets/custom_from_to_date.dart';
import 'widgets/custom_from_to_section.dart';
import 'widgets/custom_go_back_container.dart';

class TransportationSearchResultScreen extends StatefulWidget {
  const TransportationSearchResultScreen({super.key});
  @override
  State<TransportationSearchResultScreen> createState() =>
      _TransportationSearchResultScreenState();
}

class _TransportationSearchResultScreenState
    extends State<TransportationSearchResultScreen> {
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
                      child: Text(AppTranslations.selectGoingAndReturn,
                          style: getMediumStyle(fontSize: 14.sp)),
                    ),
                    CustomFromToDate(),
                    SizedBox(
                      height: getVerticalPadding(context),
                    ),
                    CustomButton(
                        title: AppTranslations.transportationResults,
                        onTap: () {})
                  ]),
            ),
          ));
    });
  }
}
