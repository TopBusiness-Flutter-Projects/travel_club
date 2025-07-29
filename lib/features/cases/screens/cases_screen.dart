import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/widgets/no_data_widget.dart';

import '../../../core/exports.dart';
import '../cubit/cases_cubit.dart';
import 'widgets/custom_container_widget.dart';

class CasesScreen extends StatefulWidget {
  const CasesScreen({super.key});

  @override
  State<CasesScreen> createState() => _CasesScreenState();
}

class _CasesScreenState extends State<CasesScreen> {
  @override
  void initState() {
    context.read<CasesCubit>().getSuitCases();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CasesCubit>();
    return BlocBuilder<CasesCubit, CasesState>(
      builder: (BuildContext context, state) {
        return RefreshIndicator(
          onRefresh: () {
            return cubit.getSuitCases();
          },
          child: CustomScreen(
              appbarTitle: "bags".tr(),
              body: cubit.getSuitCaseModel?.data == null
                  ? const Center(
                      child: CustomLoadingIndicator(),
                    )
                  : cubit.getSuitCaseModel?.data?.isEmpty ?? false
                      ? Center(
                          child: NoDataWidget(title: AppTranslations.noData))
                      : ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return CustomBagContainer(
                              isLast: true,
                              isHome: false,
                              suitcase: cubit.getSuitCaseModel?.data?[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: getVerticalPadding(context) * 1,
                            );
                          },
                          itemCount: cubit.getSuitCaseModel?.data?.length ?? 0,                          
                        )),
        );
      },
    );
  }
}
