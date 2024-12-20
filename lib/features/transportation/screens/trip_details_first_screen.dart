// ignore_for_file: deprecated_member_use

import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_state.dart';

import 'widgets/custom_from_to_details_yellow_container.dart';
import 'widgets/custom_search_result_container.dart';

class TripDetailsFirstScreen extends StatefulWidget {
  const TripDetailsFirstScreen({super.key});
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
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.all(getHorizontalPadding(context)),
                child: CustomFromToDetails(cubit: cubit),
              ),
              const CustomSearchResultContainer(),
              const CustomSeatCatalogeWidget(),
            ]),
          ));
    });
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
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.seatRowsCount,
                      itemBuilder: (context, index) => CustomSeatsRow(
                            columnNumber: index,
                            seatType: index == cubit.seatRowsCount - 3
                                ? SeatType.two
                                : index == cubit.seatRowsCount - 1
                                    ? SeatType.five
                                    : SeatType.four,
                          )),
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

            int rowIndex = currentRow == cubit.seatRowsCount - 2
                ? index + currentRow * 5 - currentRow - 2
                : index + currentRow * 5 - currentRow;
            if (seatType == SeatType.two) {
              return index == 0 || index == 1
                  ? CustomSeat(
                      isAvailable: true,
                      isSelected: false,
                      seatNumber: '${rowIndex + 1}',
                    )
                  : SizedBox(
                      width: getWidthSize(context) * 0.13,
                    );
            } else if (seatType == SeatType.five) {
              return CustomSeat(
                isAvailable: true,
                isSelected: false,
                seatNumber: '${rowIndex - 1}',
              );
            } else if (seatType == SeatType.four) {
              return index == 2
                  ? SizedBox(
                      width: getWidthSize(context) * 0.13,
                    )
                  : CustomSeat(
                      isAvailable: true,
                      isSelected: false,
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

class CustomSeat extends StatelessWidget {
  const CustomSeat({
    super.key,
    required this.isAvailable,
    required this.isSelected,
    required this.seatNumber,
  });
  final bool isAvailable;
  final bool isSelected;
  final String seatNumber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 15.h,
          right: getHorizontalPadding(context) * 0.3,
          left: getHorizontalPadding(context) * 0.3),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            ImageAssets.seat,
            width: getWidthSize(context) * 0.13,
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
                  seatNumber,
                  style: getMediumStyle(fontSize: 12.sp),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
