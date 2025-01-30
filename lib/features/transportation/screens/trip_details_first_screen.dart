// ignore_for_file: deprecated_member_use

import 'package:dotted_line/dotted_line.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/utils/convert_numbers_method.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_state.dart';
import 'package:travel_club/features/transportation/data/models/get_available_busis_model.dart';

import 'widgets/custom_from_to_details_yellow_container.dart';
import 'widgets/custom_bus_container.dart';
import 'widgets/custom_tickets_widget.dart';

class TripDetailsFirstScreen extends StatefulWidget {
  const TripDetailsFirstScreen({super.key, required this.busCompanyModel});
  final BusCompanyModel busCompanyModel;
  @override
  State<TripDetailsFirstScreen> createState() => _TripDetailsFirstScreenState();
}

class _TripDetailsFirstScreenState extends State<TripDetailsFirstScreen> {
  @override
  Widget build(BuildContext context) {
    TransportationCubit cubit = context.read<TransportationCubit>();
    return BlocBuilder<TransportationCubit, TransportationState>(
        builder: (context, state) {
      return CustomScreen(
          appbarTitle: AppTranslations.tripDetails,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.all(getHorizontalPadding(context)),
                          child: CustomFromToDetails(
                            fromDate: cubit.isGoOnly
                                ? cubit.singleDate
                                : cubit.fromDate,
                            from: cubit.selectedFromStation!.name ?? '',
                            to: cubit.selectedToStation!.name ?? '',
                            toDate: cubit.isGoOnly ? null : cubit.toDate,
                          ),
                        ),
                        CustomBusContainer(
                          busCompanyModel: widget.busCompanyModel,
                        ),
                        15.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getHorizontalPadding(context)),
                          child: CustomContainerWithShadow(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: cubit.isGoOnly
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTicketDetailsWidget(
                                          isFirst: true,
                                          title: AppTranslations.tickets,
                                          value: "${cubit.goCounter}",
                                        ),
                                        CustomTicketDetailsWidget(
                                            title: AppTranslations.ticketPrice,
                                            value:
                                                "${widget.busCompanyModel.selectedGoTime!.price!} ${AppTranslations.currency}"),
                                        CustomTicketDetailsWidget(
                                          title: AppTranslations.theTotal,
                                          value:
                                              "${cubit.goCounter * widget.busCompanyModel.selectedGoTime!.price!} ${AppTranslations.currency}",
                                        )
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        if (cubit.goCounter !=
                                            cubit.returnCounter) ...[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomTicketDetailsWidget(
                                                isFirst: true,
                                                title: cubit.goCounter <
                                                        cubit.returnCounter
                                                    ? AppTranslations
                                                        .returnTickets
                                                    : AppTranslations.goTickets,
                                                value:
                                                    "${cubit.goAndReturnDifference()}",
                                              ),
                                              CustomTicketDetailsWidget(
                                                  title: AppTranslations
                                                      .ticketPrice,
                                                  value:
                                                      "${cubit.goCounter < cubit.returnCounter ? widget.busCompanyModel.selectedReturnTime!.price! : widget.busCompanyModel.selectedGoTime!.price!} ${AppTranslations.currency}"),
                                              CustomTicketDetailsWidget(
                                                title: AppTranslations.theTotal,
                                                value:
                                                    "${cubit.goAndReturnDifference() * (cubit.goCounter < cubit.returnCounter ? widget.busCompanyModel.selectedReturnTime!.price! : widget.busCompanyModel.selectedGoTime!.price!)} ${AppTranslations.currency}",
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.h),
                                            child: DottedLine(
                                              dashLength: 5,
                                              dashGapLength: 4,
                                              lineThickness: 1,
                                              dashRadius: 2,
                                              dashColor: AppColors.grey,
                                            ),
                                          )
                                        ],
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomTicketDetailsWidget(
                                              isFirst: true,
                                              title: AppTranslations
                                                  .goAndReturnTickets,
                                              value:
                                                  "${cubit.getRoundTripsCounter()}",
                                            ),
                                            4.horizontalSpace,
                                            CustomTicketDetailsWidget(
                                                title:
                                                    AppTranslations.ticketPrice,
                                                value:
                                                    "${widget.busCompanyModel.selectedGoTime!.price! + widget.busCompanyModel.selectedReturnTime!.price!} ${AppTranslations.currency}"),
                                            4.horizontalSpace,
                                            CustomTicketDetailsWidget(
                                              title: AppTranslations.theTotal,
                                              value:
                                                  "${cubit.getRoundTripsCounter() * (widget.busCompanyModel.selectedGoTime!.price! + widget.busCompanyModel.selectedReturnTime!.price!)} ${AppTranslations.currency}",
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),

                        // const CustomSeatCatalogeWidget(),
                      ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getHorizontalPadding(context)),
                child: CustomButton(
                    title: AppTranslations.bookNow,
                    onTap: () {
                      cubit.addBusReservation(context,
                          returnTimeId:
                              widget.busCompanyModel.selectedReturnTime?.id ??
                                  0,
                          goTimeId:
                              widget.busCompanyModel.selectedGoTime?.id ?? 0,
                          busCompanyModel: widget.busCompanyModel);
                    }),
              )
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //       horizontal: getHorizontalPadding(context)),
              //   child: CustomButton(
              //       title:
              //           "${replaceToArabicNumber(cubit.selectedSeats.length.toString())} - ${AppTranslations.next}",
              //       onTap: () {
              //         if (cubit.selectedSeats.isEmpty) {
              //           errorGetBar(AppTranslations.selectSeat);
              //           return;
              //         }
              //         Navigator.pushNamed(
              //             context, Routes.tripDetailsSecondRoute);
              //       }),
              // )
            ],
          ));
    });
  }
}

class CustomTicketDetailsWidget extends StatelessWidget {
  const CustomTicketDetailsWidget({
    super.key,
    required this.title,
    required this.value,
    this.isFirst = false,
  });
  final String title;
  final String value;
  final bool isFirst;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AutoSizeText(
              title,
              textAlign: TextAlign.start,
              maxLines: 1,
              maxFontSize: 13.sp,
              minFontSize: 10.sp,
              style: getSemiBoldStyle(color: AppColors.grey, fontSize: 14.sp),
            ),
            5.verticalSpace,
            AutoSizeText(
              value,
              maxLines: 1,
              style: getMediumStyle(color: AppColors.black, fontSize: 12.sp),
            ),
          ]),
    );
  }
}

class CustomSeatCatalogeWidget extends StatelessWidget {
  const CustomSeatCatalogeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TransportationCubit cubit = context.read<TransportationCubit>();
    return BlocBuilder<TransportationCubit, TransportationState>(
        builder: (context, state) {
      return Padding(
        padding: EdgeInsets.all(getHorizontalPadding(context)),
        child: CustomContainerWithShadow(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightWhite,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(
                        25.r), // Circular with rounded corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(children: [
                              Image.asset(ImageAssets.seat,
                                  color: AppColors.samawy,
                                  width: getWidthSize(context) * 0.06),
                              SizedBox(width: getWidthSize(context) * 0.02),
                              Flexible(
                                child: AutoSizeText(
                                  AppTranslations.busy,
                                  maxLines: 2,
                                  style: getMediumStyle(
                                      fontSize: 14.sp, color: AppColors.blue),
                                ),
                              )
                            ]),
                          ),
                          Expanded(
                            child: Row(children: [
                              Image.asset(ImageAssets.seat,
                                  color: AppColors.primary,
                                  width: getWidthSize(context) * 0.06),
                              SizedBox(width: getWidthSize(context) * 0.02),
                              Flexible(
                                child: AutoSizeText(
                                  maxLines: 2,
                                  AppTranslations.available,
                                  style: getMediumStyle(
                                      fontSize: 14.sp, color: AppColors.blue),
                                ),
                              )
                            ]),
                          ),
                          Expanded(
                            child: Row(children: [
                              Image.asset(ImageAssets.seat,
                                  color: AppColors.green,
                                  width: getWidthSize(context) * 0.06),
                              SizedBox(width: getWidthSize(context) * 0.02),
                              Flexible(
                                child: AutoSizeText(
                                  maxLines: 2,
                                  AppTranslations.yourSeat,
                                  style: getMediumStyle(
                                      fontSize: 14.sp, color: AppColors.blue),
                                ),
                              )
                            ]),
                          ),
                        ]),
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10.h,
                    children: List.generate(
                      40,
                      (index) => CustomSeat(
                        seatNumber: (index + 1).toString(),
                        cubit: cubit,
                      ),
                    ),
                  ),

                  //  ListView.builder(
                  //     shrinkWrap: true,
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     itemCount: cubit.seatRowsCount,
                  //     itemBuilder: (context, index) => CustomSeatsRow(
                  //           columnNumber: index,
                  //           seatType: index == cubit.seatRowsCount - 3 ||
                  //                   index == 0 // الكرسي اللي قبل قبل الأخير
                  //               ? SeatType.two
                  //               : index ==
                  //                       cubit.seatRowsCount - 1 // الكرسي الأخير
                  //                   ? SeatType.five
                  //                   : SeatType.four,
                  //         )),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

///  43 seats
///  11 rows
///  the 11st row has 5 seats
///  the 9th row has 2 seats
///  other rows has 4 seats
enum SeatType { two, four, five }

class CustomSeatsRow extends StatelessWidget {
  const CustomSeatsRow({
    super.key,
    this.seatType = SeatType.four,
    required this.columnNumber,
  });
  final SeatType seatType;
  final int columnNumber;
  @override
  Widget build(BuildContext context) {
    TransportationCubit cubit = context.read<TransportationCubit>();

    return BlocBuilder<TransportationCubit, TransportationState>(
        builder: (context, state) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) {
            int currentRow = columnNumber;

            /// هنا بقول الكرسي اللي قبل الأخير هيعمل سكيب لكرسيين عشان هما مش موجودين في الصف اللي قبله
            int rowIndex = currentRow == 0
                ? index + 1
                : currentRow == 1
                    ? index + 3
                    : currentRow == cubit.seatRowsCount - 2
                        ? index + currentRow * 5 - currentRow - 3
                        : index + currentRow * 5 - currentRow - 1;
            if (seatType == SeatType.two) {
              return index == 0 || index == 1
                  ? CustomSeat(
                      cubit: cubit,
                      seatNumber: '${rowIndex + 1}',
                    )
                  : SizedBox(
                      width: getWidthSize(context) * 0.13,
                    );
            } else if (seatType == SeatType.five) {
              return CustomSeat(
                cubit: cubit,
                seatNumber: '${rowIndex - 1}',
              );
            } else if (seatType == SeatType.four) {
              return index == 2
                  ? SizedBox(
                      width: getWidthSize(context) * 0.13,
                    )
                  : CustomSeat(
                      cubit: cubit,
                      seatNumber: index > 2 ? '${rowIndex}' : '${rowIndex + 1}',
                      // seatNumber: index > 2 ? '${index}' : '${index + 1}',
                    );
            } else {
              return Container();
            }
          }));
    });
  }
}

class CustomSeat extends StatefulWidget {
  const CustomSeat({
    super.key,
    required this.seatNumber,
    this.isEditable = true,
    required this.cubit,
  });

  final String seatNumber;
  final bool isEditable; // in not in next page
  final TransportationCubit cubit;
  @override
  State<CustomSeat> createState() => _CustomSeatState();
}

class _CustomSeatState extends State<CustomSeat> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransportationCubit, TransportationState>(
        builder: (context, state) {
      return Padding(
        padding: EdgeInsets.only(
            top: 15.h,
            right: getHorizontalPadding(context) * 0.3,
            left: getHorizontalPadding(context) * 0.3),
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            InkWell(
              onTap: widget.isEditable
                  ? () {
                      if (widget.cubit.reservedSeats
                          .contains(int.parse(widget.seatNumber))) {
                        return;
                      }
                      // setState(() {
                      //   cubit.selectedSeats
                      //           .contains(int.parse(widget.seatNumber))
                      //       ? cubit.selectedSeats
                      //           .remove(int.parse(widget.seatNumber))
                      //       : cubit.selectedSeats
                      //           .add(int.parse(widget.seatNumber));
                      // });
                      widget.cubit.selectSeat(int.parse(widget.seatNumber));
                    }
                  : null,
              child: Image.asset(
                ImageAssets.seat,
                color: widget.isEditable
                    ? widget.cubit.selectedSeats
                            .contains(int.parse(widget.seatNumber))
                        ? AppColors.green
                        : widget.cubit.reservedSeats
                                .contains(int.parse(widget.seatNumber))
                            ? AppColors.samawy
                            : AppColors.primary
                    : AppColors.green,
                width: getWidthSize(context) * 0.13,
              ),
            ),
            Positioned(
              top: -5.h,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.yellow,
                ),
                height: 25.h,
                width: 25.h,
                child: Center(
                  child: AutoSizeText(
                    widget.seatNumber,
                    style: getMediumStyle(fontSize: 12.sp),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
