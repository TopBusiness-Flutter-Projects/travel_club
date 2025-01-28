// ignore_for_file: deprecated_member_use

import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/no_data_widget.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_state.dart';
import 'package:travel_club/features/transportation/screens/widgets/custom_company_container.dart';

class TransportationMenuScreen extends StatefulWidget {
  const TransportationMenuScreen({super.key});
  @override
  State<TransportationMenuScreen> createState() =>
      _TransportationMenuScreenState();
}

class _TransportationMenuScreenState extends State<TransportationMenuScreen> {
  @override
  void initState() {
    context.read<TransportationCubit>().getCompanies(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TransportationCubit cubit = context.read<TransportationCubit>();
    return BlocBuilder<TransportationCubit, TransportationState>(
        builder: (context, state) {
      return CustomScreen(
          appbarTitle: AppTranslations.transportation,
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: getVerticalPadding(context)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getHorizontalPadding(context)),
              child: Text(AppTranslations.companiesMenu,
                  style: getRegularStyle(fontSize: 14.sp)),
            ),
            Expanded(
                child: cubit.getCompaniesModel.data == null
                    ? const Center(
                        child: CustomLoadingIndicator(),
                      )
                    : cubit.getCompaniesModel.data!.isEmpty
                        ? Center(
                            child: NoDataWidget(
                            title: AppTranslations.noData,
                          ))
                        : RefreshIndicator(
                            onRefresh: () async {
                              cubit.getCompanies(context);
                            },
                            child: ListView.builder(
                                itemCount: cubit.getCompaniesModel.data!.length,
                                itemBuilder: (context, index) =>
                                    CustomCompanyContainer(
                                      companyModel:
                                          cubit.getCompaniesModel.data![index],
                                    )),
                          )),
          ]));
    });
  }
}
