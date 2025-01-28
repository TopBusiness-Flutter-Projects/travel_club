// ignore_for_file: deprecated_member_use

import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_state.dart';
import 'package:travel_club/features/transportation/data/models/get_companies_model.dart';

import 'widgets/custom_booked_company_container.dart';
import 'widgets/custom_from_to_date.dart';
import 'widgets/custom_from_to_section.dart';
import 'widgets/custom_go_back_container.dart';

class TransportationBookingDetailsScreen extends StatefulWidget {
  const TransportationBookingDetailsScreen(
      {super.key, required this.companyModel});
  final CompanyModel companyModel;
  @override
  State<TransportationBookingDetailsScreen> createState() =>
      _TransportationBookingDetailsScreenState();
}

class _TransportationBookingDetailsScreenState
    extends State<TransportationBookingDetailsScreen> {
  @override
  void initState() {
    context.read<TransportationCubit>().goOnly = true;
    context
        .read<TransportationCubit>()
        .getCompanyStations(context, companyId: widget.companyModel.id ?? 0);

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
                    CustomBookedCompanyContainer(
                      companyModel: widget.companyModel,
                    ),
                    SizedBox(
                      height: getVerticalPadding(context),
                    ),
                    const CustomGoBackContainer(),
                    SizedBox(
                      height: getVerticalPadding(context),
                    ),
                    if (cubit.getCompanyStationsiesModel.data != null)
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
                    Opacity(
                      opacity: cubit.selectedFromStation == null ||
                              cubit.selectedToStation == null
                          ? 0.4
                          : 1,
                      child: CustomButton(
                          title: AppTranslations.transportationResults,
                          onTap: () {
                            if (cubit.selectedFromStation == null ||
                                cubit.selectedToStation == null) {
                              errorGetBar(
                                  AppTranslations.pleaseSelectFromToStations);
                              return;
                            } else if (cubit.selectedFromStation ==
                                cubit.selectedToStation) {
                              errorGetBar(
                                  AppTranslations.youCanNotSelectSameStation);
                              return;
                            }
                            Navigator.pushNamed(context,
                                Routes.transportationSearchResultRoute);
                          }),
                    )
                  ]),
            ),
          ));
    });
  }
}
