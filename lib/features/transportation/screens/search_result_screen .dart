// ignore_for_file: deprecated_member_use

import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_state.dart';

import 'widgets/custom_booked_company_container.dart';
import 'widgets/custom_from_to_date.dart';
import 'widgets/custom_from_to_details_yellow_container.dart';
import 'widgets/custom_from_to_section.dart';
import 'widgets/custom_go_back_container.dart';
import 'widgets/custom_search_result_container.dart';

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
          appbarTitle: AppTranslations.searchResults,
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.all(getHorizontalPadding(context)),
              child: CustomFromToDetails(cubit: cubit),
            ),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.tripDetailsfirstRoute);
                      },
                      child: CustomSearchResultContainer( isOneWay: index % 2 == 0,)),
                  separatorBuilder: (context, index) => SizedBox(height: 20.h),
                  itemCount: 5),
            )
          ]));
    });
  }
}
