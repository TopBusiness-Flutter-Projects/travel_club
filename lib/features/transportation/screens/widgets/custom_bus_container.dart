import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/utils/convert_numbers_method.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_state.dart';
import 'package:travel_club/features/transportation/data/models/get_available_busis_model.dart';

class CustomBusContainer extends StatefulWidget {
  const CustomBusContainer({
    super.key,
    required this.busCompanyModel,
  });
  final BusCompanyModel busCompanyModel;

  @override
  State<CustomBusContainer> createState() => _CustomBusContainerState();
}

class _CustomBusContainerState extends State<CustomBusContainer> {
  @override
  Widget build(BuildContext context) {
    TransportationCubit cubit = context.read<TransportationCubit>();
    return BlocBuilder<TransportationCubit, TransportationState>(
        builder: (context, state) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getHorizontalPadding(context),
        ),
        child: CustomContainerWithShadow(
            child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: AppColors.lightWhite,
                      //     shape: BoxShape.rectangle,
                      //     borderRadius: BorderRadius.circular(
                      //         15), // Circular with rounded corners
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: SvgPicture.asset(
                      //       AppIcons.bus,
                      //       height: 49.h,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 10.w,
                      // ),
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.busCompanyModel.busModel
                                                  ?.name ??
                                              '',
                                          style: getSemiBoldStyle(
                                              color: AppColors.black,
                                              fontSize: 16.sp),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          " ${widget.busCompanyModel.busModel?.chairs} ${AppTranslations.seats}",
                                          style: getMediumStyle(
                                              color: AppColors.lbny,
                                              fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: cubit.isGoOnly
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                widget
                                                        .busCompanyModel
                                                        .selectedGoTime
                                                        ?.fromTime ??
                                                    "",
                                                style: getBoldStyle(
                                                    color: AppColors.primary,
                                                    fontSize: 14.sp),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              RichText(
                                                // maxLines: 2,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            AppTranslations.go,
                                                        style: getRegularStyle(
                                                          fontSize: 14.sp,
                                                        )),
                                                    TextSpan(
                                                        text: ' ',
                                                        style: getBoldStyle(
                                                            fontSize: 15.sp,
                                                            color: AppColors
                                                                .primary)),
                                                    TextSpan(
                                                      text: widget
                                                              .busCompanyModel
                                                              .selectedGoTime
                                                              ?.fromTime ??
                                                          "",
                                                      style: getBoldStyle(
                                                          color:
                                                              AppColors.primary,
                                                          fontSize: 14.sp),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 5.h,
                                              // ),
                                              RichText(
                                                // maxLines: 2,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                        text: AppTranslations
                                                            .returnWord,
                                                        style: getRegularStyle(
                                                          fontSize: 14.sp,
                                                        )),
                                                    TextSpan(
                                                        text: ' ',
                                                        style: getBoldStyle(
                                                            fontSize: 15.sp,
                                                            color: AppColors
                                                                .primary)),
                                                    TextSpan(
                                                      text: widget
                                                              .busCompanyModel
                                                              .selectedReturnTime
                                                              ?.fromTime ??
                                                          "",
                                                      style: getBoldStyle(
                                                          color:
                                                              AppColors.primary,
                                                          fontSize: 14.sp),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                AppTranslations.vehicleNumber,
                                style: getSemiBoldStyle(
                                    color: AppColors.grey, fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      widget.busCompanyModel.plateNumber ?? "",
                                      style: getMediumStyle(
                                          color: AppColors.black,
                                          fontSize: 14.sp),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      cubit.isGoOnly
                                          ? " ${formatNumber((double.parse((widget.busCompanyModel.selectedGoTime?.price ?? 0).toString())))} ${AppTranslations.currency}"
                                          : " ${formatNumber((double.parse((widget.busCompanyModel.selectedGoTime?.price ?? 0).toString()) + double.parse((widget.busCompanyModel.selectedReturnTime?.price ?? 0).toString()))).toString()} ${AppTranslations.currency}",
                                      style: getBoldStyle(
                                          color: AppColors.green,
                                          fontSize: 14.sp),
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      )
                    ]))),
      );
    });
  }
}

class CustomEditableBusContainer extends StatefulWidget {
  const CustomEditableBusContainer({
    super.key,
    required this.busCompanyModel,
  });
  final BusCompanyModel busCompanyModel;

  @override
  State<CustomEditableBusContainer> createState() =>
      _CustomEditableBusContainerState();
}

class _CustomEditableBusContainerState
    extends State<CustomEditableBusContainer> {
  @override
  Widget build(BuildContext context) {
    TransportationCubit cubit = context.read<TransportationCubit>();
    return BlocBuilder<TransportationCubit, TransportationState>(
        builder: (context, state) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getHorizontalPadding(context),
        ),
        child: CustomContainerWithShadow(
            child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            widget.busCompanyModel.busModel?.name ?? '',
                            style: getSemiBoldStyle(
                                color: AppColors.black, fontSize: 16.sp),
                          ),
                        ),
                        Text(
                          " ${widget.busCompanyModel.busModel?.chairs} ${AppTranslations.seats}",
                          style: getSemiBoldStyle(
                              color: AppColors.lbny, fontSize: 14.sp),
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    Text(
                      cubit.isGoOnly
                          ? AppTranslations.selectTime
                          : AppTranslations.selectGoingTime,
                      style: getRegularStyle(
                          color: AppColors.primary, fontSize: 16.sp),
                    ),
                    5.verticalSpace,
                    Wrap(
                      spacing: 15.w,
                      runSpacing: 10.h,
                      children: List.generate(
                          widget.busCompanyModel.busTimeInDeparture!.length,
                          (index) => CustomTimeWidget(
                                isSelected:
                                    widget.busCompanyModel.selectedGoTime?.id ==
                                        widget.busCompanyModel
                                            .busTimeInDeparture![index].id,
                                onTap: () {
                                  setState(() {
                                    widget.busCompanyModel.selectedGoTime =
                                        widget.busCompanyModel
                                            .busTimeInDeparture![index];
                                  });
                                },
                                time: widget.busCompanyModel
                                        .busTimeInDeparture![index].fromTime ??
                                    "",
                              )),
                    ),
                    if (!cubit.isGoOnly) ...[
                      10.verticalSpace,
                      Text(
                        AppTranslations.selectReturnTime,
                        style: getRegularStyle(
                            color: AppColors.primary, fontSize: 16.sp),
                      ),
                      5.verticalSpace,
                      Wrap(
                        spacing: 15.w,
                        runSpacing: 10.h,
                        children: List.generate(
                            widget.busCompanyModel.busTimeInReturn!.length,
                            (index) => CustomTimeWidget(
                                  isSelected: widget.busCompanyModel
                                          .selectedReturnTime?.id ==
                                      widget.busCompanyModel
                                          .busTimeInReturn![index].id,
                                  onTap: () {
                                    setState(() {
                                      widget.busCompanyModel
                                              .selectedReturnTime =
                                          widget.busCompanyModel
                                              .busTimeInReturn![index];
                                    });
                                  },
                                  time: widget.busCompanyModel
                                          .busTimeInReturn![index].fromTime ??
                                      "",
                                )),
                      ),
                    ],
                    10.verticalSpace,
                    Row(children: [
                      Flexible(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppTranslations.vehicleNumber,
                                    style: getSemiBoldStyle(
                                        color: AppColors.grey, fontSize: 16.sp),
                                  ),
                                  10.horizontalSpace,
                                  Flexible(
                                    child: AutoSizeText(
                                      cubit.isGoOnly
                                          ? " ${formatNumber((double.parse((widget.busCompanyModel.selectedGoTime?.price ?? 0).toString())))} ${AppTranslations.currency}"
                                          : " ${formatNumber((double.parse((widget.busCompanyModel.selectedGoTime?.price ?? 0).toString()) + double.parse((widget.busCompanyModel.selectedReturnTime?.price ?? 0).toString()))).toString()} ${AppTranslations.currency}",
                                      maxLines: 1,
                                      style: getBoldStyle(
                                          color: AppColors.green,
                                          fontSize: 13.sp),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: AutoSizeText(
                                      widget.busCompanyModel.plateNumber ?? "",
                                      maxLines: 1,
                                      style: getMediumStyle(
                                          color: AppColors.black,
                                          fontSize: 14.sp),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        end: 10),
                                    child: Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 30,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      )
                    ]),
                  ],
                ))),
      );
    });
  }
}

class CustomTimeWidget extends StatelessWidget {
  const CustomTimeWidget({
    super.key,
    this.isSelected = false,
    required this.time,
    this.onTap,
  });
  final bool isSelected;
  final String time;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          border: Border.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: getWidthSize(context) * 0.02,
            vertical: getHeightSize(context) * 0.008),
        child: Text(time,
            style: getSemiBoldStyle(
                color: isSelected ? AppColors.white : AppColors.primary,
                fontSize: 14.sp)),
      ),
    );
  }
}
