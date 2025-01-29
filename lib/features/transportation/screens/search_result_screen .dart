// ignore_for_file: deprecated_member_use

import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_state.dart';

import 'widgets/custom_from_to_details_yellow_container.dart';
import 'widgets/custom_bus_container.dart';
import 'widgets/custom_tickets_widget.dart';

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
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getHorizontalPadding(context)),
              child: CustomFromToDetails(
                fromDate: cubit.isGoOnly ? cubit.singleDate : cubit.fromDate,
                from: cubit.selectedFromStation!.name ?? '',
                to: cubit.selectedToStation!.name ?? '',
                toDate: cubit.isGoOnly ? null : cubit.toDate,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getHorizontalPadding(context)),
              child: const CustomTicketsWidget(
                isClickable: false,
              ),
            ),
            if (!cubit.isGoOnly)
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getHorizontalPadding(context)),
                child: const CustomTicketsWidget(
                  isReturn: true,
                  isClickable: false,
                ),
              ),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.tripDetailsfirstRoute,
                            arguments:
                                cubit.getAvailableBusesModel.data![index]);
                      },
                      child: CustomEditableBusContainer(
                        busCompanyModel:
                            cubit.getAvailableBusesModel.data![index],
                      )),
                  separatorBuilder: (context, index) => SizedBox(height: 20.h),
                  itemCount: cubit.getAvailableBusesModel.data!.length),
            )
          ]));
    });
  }
}
