import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/widgets/dropdown_button_form_field.dart';
import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/cases/data/model/suitcase_details_model.dart';

import '../../../core/exports.dart';
import '../cubit/cases_cubit.dart';
import 'widgets/custom_member_widget.dart';

class CaseDetailsArguments {
  final String bagId;
  CaseDetailsArguments(this.bagId);
}

class CaseDescriptionScreen extends StatefulWidget {
  const CaseDescriptionScreen({super.key, required this.args});
  final CaseDetailsArguments args;

  @override
  State<CaseDescriptionScreen> createState() => _CaseDescriptionScreenState();
}

class _CaseDescriptionScreenState extends State<CaseDescriptionScreen> {
  @override
  void initState() {
    context
        .read<CasesCubit>()
        .getSuitcasesDetails(id: widget.args.bagId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CasesCubit>();
    return BlocBuilder<CasesCubit, CasesState>(
      builder: (BuildContext context, state) {
        return RefreshIndicator(
            onRefresh: () {
              return cubit.getSuitcasesDetails(
                  id: widget.args.bagId.toString());
            },
            child: CustomScreen(
              appbarTitle: "bags".tr(),
              body: cubit.getSuitcaseDetailsModel?.data == null
                  ? const Center(
                      child: CustomLoadingIndicator(),
                    )
                  : SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getHorizontalPadding(context),
                          vertical: getVerticalPadding(context),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomNetworkImage(
                                borderRadius: 20.r,
                                width: getWidthSize(context),
                                height: getHeightSize(context) * 0.3,
                                image: cubit.getSuitcaseDetailsModel?.data?.image
                                        .toString() ??
                                    "",
                              ),
                              20.verticalSpace,
                              Text(
                                  cubit.getSuitcaseDetailsModel?.data?.title
                                          .toString() ??
                                      "",
                                  style: getMediumStyle(
                                    color: AppColors.secondPrimary,
                                    fontSize: 14.sp,
                                  )),
                              10.verticalSpace,
                              Text(
                                  cubit.getSuitcaseDetailsModel?.data
                                          ?.priceWithMonths
                                          .toString() ??
                                      "",
                                  style: getMediumStyle(
                                    color: AppColors.primary,
                                    fontSize: 14.sp,
                                  )),
                              10.verticalSpace,
                              Text(
                                cubit.getSuitcaseDetailsModel?.data?.description
                                        .toString() ??
                                    "",
                                style: getRegularStyle(
                                  color: AppColors.secondPrimary,
                                  fontSize: 12.sp,
                                ),
                              ),
                              20.verticalSpace,
                              if (cubit.getSuitcaseDetailsModel?.data
                                      ?.startsDates !=
                                  null) ...[
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    AppTranslations.selectBookingDate,
                                    style: getMediumStyle(fontSize: 14.sp),
                                  ),
                                ),
                                  20.verticalSpace,
                                CustomDropdownButtonFormField(
                                  hint: "select_date".tr(),
                                  items: cubit
                                      .getSuitcaseDetailsModel!.data!.startsDates!
                                      .map<DropdownMenuItem<String>>(
                                          (StartsDate item) {
                                    return DropdownMenuItem<String>(
                                      value: item.id.toString(),
                                      child: Text(item.from ?? ""),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    cubit.changeStationValue(cubit
                                        .getSuitcaseDetailsModel!
                                        .data!
                                        .startsDates!
                                        .firstWhere((element) =>
                                            element.id.toString() == value));
                                  },
                                  value: cubit.selectedFromDate?.id.toString(),
                                ),
                                20.verticalSpace
                              ],
                              if (cubit.selectedFromDate != null) ...[
                                Text(
                                  "${"available_persons".tr()} ${cubit.selectedFromDate?.available ?? 0} ${"person".tr()}",
                                  style: getRegularStyle(
                                    color: AppColors.primary,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                20.verticalSpace,
                                const CustomPersonsWidget(),
                                20.verticalSpace,
                                CustomButton(
                                    title: "book_now".tr(),
                                    onTap: () {
                                      checkLoggingStatus(context, onPressed: () {
                                        cubit.bookSuitcases(context);
                                      });
                                    }),
                              ]
                            ]),
                      ),
                  ),
            ));
      },
    );
  }
}
