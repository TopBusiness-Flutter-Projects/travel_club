import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/my_bookings/cubit/my_bookings_state.dart';
import 'package:travel_club/features/my_bookings/data/models/residence_reservation_details_model.dart';
import 'package:travel_club/features/my_bookings/data/models/residence_reservation_model.dart';
import 'package:travel_club/features/payment/screens/widgets/custom_price_widget.dart';
import 'package:travel_club/features/residence/view/residence_booking/widgets/custom_container_booking.dart';
import '../../../../transportation/screens/widgets/custom_from_to_date.dart';
import '../../../cubit/my_bookings_cubit.dart';
import '../widgets/big_container.dart';
import '../widgets/payment_widget.dart';
import '../../widgets/show_rate_bottom_sheet.dart';

class ResidenceDetailsBookingArguments {
  final ResidenceReservationModel residenceReservationModel;
  ResidenceDetailsBookingArguments({required this.residenceReservationModel});
}

class ResidenceRessrvationDetails extends StatefulWidget {
  const ResidenceRessrvationDetails({super.key, required this.arguments});
  final ResidenceDetailsBookingArguments arguments;

  @override
  State<ResidenceRessrvationDetails> createState() =>
      _ResidenceRessrvationDetailsState();
}

class _ResidenceRessrvationDetailsState
    extends State<ResidenceRessrvationDetails> {
  @override
  void initState() {
context.read<MyReservationsCubit>().getResidenceReservationDetailsModel =
        GetResidenceReservationDetailsModel();  
          context.read<MyReservationsCubit>().getReservationDetails(
        reservationId: widget.arguments.residenceReservationModel.id!);
    
    super.initState();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyReservationsCubit, MyReservationsState>(
      builder: (BuildContext context, state) {
        var cubit = context.read<MyReservationsCubit>();
        return CustomScreen(
          appbarTitle: AppTranslations.detailsBooking,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomBookingAccommodationContainerBig(
                    residenceReservationModel:
                        widget.arguments.residenceReservationModel,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  if (cubit.getResidenceReservationDetailsModel.data == null)
                    Padding(
                      padding:
                          EdgeInsets.only(top: getHeightSize(context) * 0.15),
                      child: const Center(
                        child: CustomLoadingIndicator(),
                      ),
                    )
                  else ...[
                    //text
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: AutoSizeText(
                              AppTranslations.goingAndReturnDate,
                              maxLines: 1,
                              style: getMediumStyle(fontSize: 14.sp),
                            ),
                          ),
                          AutoSizeText(
                            "${AppTranslations.numberOfMembers} : ${cubit.getResidenceReservationDetailsModel.data!.guest}",
                            maxLines: 1,
                            style: getMediumStyle(fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    //from and to date
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightWhite2,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    CustomFromToDate(
                      isGoOnly: false,
                      isShowOnly: true,
                      fromDate: cubit
                          .getResidenceReservationDetailsModel.data!.from
                          .toString(),
                      toDate: cubit.getResidenceReservationDetailsModel.data!.to
                          .toString(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    //prefer hotel
                    Text(
                      AppTranslations.rooms,
                      style: getMediumStyle(fontSize: 14.sp),
                    ),
                    //custom contanier
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onHorizontalDragEnd: (details) {
                        setState(() {
                          if (details.primaryVelocity != null) {
                            bool isRtl = EasyLocalization.of(context)!
                                    .locale
                                    .languageCode ==
                                'ar';

                            if ((isRtl && details.primaryVelocity! > 0) ||
                                (!isRtl && details.primaryVelocity! < 0)) {
                              // Swiped left (next item for LTR, previous item for RTL)
                              if (currentIndex <
                                  cubit.getResidenceReservationDetailsModel
                                          .data!.rooms!.length -
                                      1) {
                                currentIndex++;
                              }
                            } else if ((isRtl &&
                                    details.primaryVelocity! < 0) ||
                                (!isRtl && details.primaryVelocity! > 0)) {
                              // Swiped right (previous item for LTR, next item for RTL)
                              if (currentIndex > 0) {
                                currentIndex--;
                              }
                            }
                          }
                        });
                      },
                      child: CustomContainerBooking(
                        room: cubit.getResidenceReservationDetailsModel.data!
                            .rooms![currentIndex],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getVerticalPadding(context),
                          horizontal: getHorizontalPadding(context)),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (currentIndex > 0) {
                                  currentIndex--;
                                }
                              });
                            },
                            child: Icon(Icons.arrow_back_ios,
                                color: currentIndex > 0
                                    ? AppColors.primary
                                    : (AppColors.primary).withOpacity(0.4)),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: cubit
                                  .getResidenceReservationDetailsModel
                                  .data!
                                  .rooms!
                                  .map((element) => element.id ?? "")
                                  .toList()
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                return Container(
                                  width: 10.0,
                                  height: 10.0,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentIndex == entry.key
                                          ? AppColors.primary
                                          : (AppColors.primary)
                                              .withOpacity(0.4)),
                                );
                              }).toList(),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (currentIndex <
                                    cubit.getResidenceReservationDetailsModel
                                            .data!.rooms!.length -
                                        1) {
                                  currentIndex++;
                                }
                              });
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: currentIndex <
                                      cubit.getResidenceReservationDetailsModel
                                              .data!.rooms!.length -
                                          1
                                  ? AppColors.primary
                                  : (AppColors.primary).withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ),

//payment

                    if (cubit.getResidenceReservationDetailsModel.data!
                            .process ==
                        0)
                      CustomPricesWidget(
                        totalPrice: cubit.getResidenceReservationDetailsModel
                            .data!.totalPrice
                            .toString(),
                        totalPriceAfterVat: cubit
                            .getResidenceReservationDetailsModel
                            .data!
                            .totalPriceAfterVat
                            .toString(),
                        vat: cubit.getResidenceReservationDetailsModel.data!.vat
                            .toString(),
                        terms: widget
                            .arguments.residenceReservationModel.lodge?.rules
                            .toString(),
                        reservationId: cubit
                                .getResidenceReservationDetailsModel.data?.id ??
                            0,
                      )
                    else ...[
                      SizedBox(
                        height: 20.h,
                      ),
                      ReservationPaymentDetailsContainer(
                        nightes: widget
                            .arguments.residenceReservationModel.totalNights
                            .toString(),
                        totalPrice: cubit.getResidenceReservationDetailsModel
                            .data!.totalPrice
                            .toString(),
                        totalPriceAfterVat: cubit
                            .getResidenceReservationDetailsModel
                            .data!
                            .totalPriceAfterVat
                            .toString(),
                        vat: cubit.getResidenceReservationDetailsModel.data!.vat
                            .toString(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                    if (cubit.getResidenceReservationDetailsModel.data!
                            .canCancel !=
                        null)
                      CustomButton(
                        isBordered: true,
                        title: AppTranslations.cancelBooking,
                        onTap: () {
                          cubit.cancelReservation(context,
                              reservationId: widget
                                  .arguments.residenceReservationModel.id!);
                        },
                      ),

                    if (cubit.getResidenceReservationDetailsModel.data!
                            .process ==
                        2)
                      CustomButton(
                        isBordered: true,
                        title: AppTranslations.experienceEvaluation,
                        onTap: () {
                          showAddRateBottomSheet(context);
                          // Navigator.pushNamed(context, Routes.);
                        },
                      ),

                    SizedBox(
                      height: 40.h,
                    )
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
