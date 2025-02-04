// ignore_for_file: deprecated_member_use

import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_state.dart';
import 'package:travel_club/features/transportation/data/models/get_available_busis_model.dart';

import '../../payment/screens/widgets/custom_price_widget.dart';
import 'trip_details_first_screen.dart';
import 'widgets/custom_bus_container.dart';
import 'widgets/custom_from_to_details_yellow_container.dart';

class TripDetailsSecondScreen extends StatefulWidget {
  const TripDetailsSecondScreen({super.key, required this.busCompanyModel});
  final BusCompanyModel busCompanyModel;
  @override
  State<TripDetailsSecondScreen> createState() =>
      _TripDetailsSecondScreenState();
}

class _TripDetailsSecondScreenState extends State<TripDetailsSecondScreen> {
  @override
  Widget build(BuildContext context) {
    TransportationCubit cubit = context.read<TransportationCubit>();
    return BlocBuilder<TransportationCubit, TransportationState>(
        builder: (context, state) {
      return WillPopScope(
        onWillPop: () async {
          checkGoToHome(context);
          return false;
        },
        child: CustomScreen(
            appbarTitle: AppTranslations.tripDetails,
            appBarOnPresses: () {
              checkGoToHome(context);
            },
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
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
                          CustomSelectgedSeatWidget(
                            selectedGoSeats: cubit.addBusReservationModel.data
                                    ?.departureReservedChairsNumber
                                    ?.map((e) => e.number!)
                                    .toList() ??
                                [],
                            selectedReturnSeats: cubit.addBusReservationModel
                                    .data?.returnReservedChairsNumber
                                    ?.map((e) => e.number!)
                                    .toList() ??
                                [],
                            // isReturn: false,
                          ),
                          SizedBox(height: getVerticalPadding(context)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalPadding(context)),
                            child: CustomPricesWidget(
                              totalPrice:
                                  "${cubit.addBusReservationModel.data?.totalPrice}",
                              totalPriceAfterVat:
                                  "${cubit.addBusReservationModel.data?.totalPriceAfterVat}",
                              vat: "${cubit.addBusReservationModel.data?.vat}",
                              // terms: "nono",
                              reservationId:
                                  cubit.addBusReservationModel.data?.id ?? 0,
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            )),
      );
    });
  }
}

class CustomSelectgedSeatWidget extends StatelessWidget {
  const CustomSelectgedSeatWidget({
    super.key,
    required this.selectedGoSeats,
    required this.selectedReturnSeats,
    this.isReturn,
  });
  final List<int> selectedGoSeats;
  final List<int> selectedReturnSeats;
  final bool? isReturn;

  @override
  Widget build(BuildContext context) {
    TransportationCubit cubit = context.read<TransportationCubit>();
    return BlocBuilder<TransportationCubit, TransportationState>(
        builder: (context, state) {
      return Padding(
        padding: EdgeInsets.all(getHorizontalPadding(context)),
        child: CustomContainerWithShadow(
          child: Padding(
            padding: EdgeInsets.all(10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AutoSizeText(
                          isReturn ?? !cubit.isGoOnly
                              ? AppTranslations.goSeats
                              : AppTranslations.yourSeats,
                          maxLines: 1,
                          style: getBoldStyle(fontSize: 14.sp),
                        ),
                      ),
                      StaggeredGrid.count(
                        crossAxisCount: isReturn ?? !cubit.isGoOnly ? 2 : 4,
                        children: List.generate(
                            selectedGoSeats.length,
                            (index) => CustomSeat(
                                  seatNumber: selectedGoSeats[index].toString(),
                                  isEditable: false,
                                  cubit: cubit,
                                )),
                      ),
                    ],
                  ),
                ),
                if (isReturn ?? !cubit.isGoOnly)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 40.h,
                        width: getWidthSize(context) * 0.18,
                        child: VerticalDivider(
                          thickness: 1, width: 40.w,
                          color: Colors
                              .transparent, // Customize the color as needed
                        ),
                      ),
                    ],
                  ),
                if (isReturn ?? !cubit.isGoOnly)
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AutoSizeText(
                            AppTranslations.returnSeats,
                            maxLines: 1,
                            style: getBoldStyle(fontSize: 14.sp),
                          ),
                        ),
                        StaggeredGrid.count(
                          crossAxisCount: 2,
                          children: List.generate(
                              selectedReturnSeats.length,
                              (index) => CustomSeat(
                                    seatNumber:
                                        selectedReturnSeats[index].toString(),
                                    isEditable: false,
                                    cubit: cubit,
                                  )),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

// class CustomSelectgedSeatWidget extends StatelessWidget {
//   const CustomSelectgedSeatWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     TransportationCubit cubit = context.read<TransportationCubit>();
//     return BlocBuilder<TransportationCubit, TransportationState>(
//         builder: (context, state) {
//       return Padding(
//         padding: EdgeInsets.all(getHorizontalPadding(context)),
//         child: CustomContainerWithShadow(
//           child: Padding(
//             padding: EdgeInsets.all(10.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     AppTranslations.numberOfSeats,
//                     style: getBoldStyle(fontSize: 14.sp),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Flexible(
//                       child: Wrap(
//                         spacing: 5.w,
//                         direction: Axis.horizontal,
//                         runSpacing: 5.h,
//                         children: [
//                           ...List.from(cubit.selectedSeats..sort()).map((seat) {
                          

//                             return CustomSeat(
//                               seatNumber: seat.toString(),
//                               isEditable: false,
//                               cubit: cubit,
//                             );
//                           }),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
