import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_terms_and_conditions.dart';
import 'package:travel_club/features/payment/screens/widgets/custom_price_widget.dart';
import 'package:travel_club/features/residence/view/residence_booking/widgets/linear_progress.dart';
import 'package:travel_club/features/residence/view/widgets/residence_widgets/accomendation_rating.dart';

import '../../../../transportation/cubit/transportation_cubit.dart';
import '../../../../transportation/screens/widgets/custom_from_to_date.dart';
import '../../../cubit/residence_cubit.dart';
import '../widgets/custom_container_booking.dart';
import '../../../../payment/screens/widgets/custom_copun_widget.dart';
import '../../../../payment/screens/widgets/payment_widget.dart';

class SecondResidenceBooking extends StatefulWidget {
  const SecondResidenceBooking({super.key});
  @override
  State<SecondResidenceBooking> createState() => _SecondResidenceBookingState();
}

class _SecondResidenceBookingState extends State<SecondResidenceBooking> {
  // PageController pageController = PageController(initialPage: 0);
  // int currentPage = 0;

  @override
  void initState() {
    context.read<TransportationCubit>().goOnly = false;
    super.initState();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ResidenceCubit>();
    return BlocBuilder<ResidenceCubit, ResidenceState>(
      builder: (BuildContext context, state) {
        return WillPopScope(
          onWillPop: () async {
            checkGoToHome(context);
            return false;
          },
          child: CustomScreen(
            appbarTitle: AppTranslations.booking,
            appBarOnPresses: () {
              checkGoToHome(context);
            },
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20.h,
                    ),
                    //center linear progress
                    LinearProgress(),
                    SizedBox(
                      height: 25.h,
                    ),
                    //text
                    Text(
                      AppTranslations.selectGoingAndReturn,
                      style: getMediumStyle(fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    //from and to date
                    CustomFromToDate(),
                    SizedBox(
                      height: 20.h,
                    ),
                    //custom widget rating hotel
                    Text(
                      "${AppTranslations.numberOfMembers} : ${cubit.counter}",
                      style: getMediumStyle(fontSize: 14.sp),
                    ),
                    // cubit.addRoomReservationModel.data != null ?
                    CustomLodgeContainer(
                      lodgesModel: cubit.addRoomReservationModel.data!.lodge ??
                          cubit.defaultLodge,
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
                                  cubit.addRoomReservationModel.data!.rooms!
                                          .length -
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
                        room: cubit
                            .addRoomReservationModel.data!.rooms![currentIndex],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          // GestureDetector(
                          //   onTap: () {
                          //     setState(() {
                          //       if (currentIndex > 0) {
                          //         currentIndex--;
                          //       }
                          //     });
                          //   },
                          //   child: Icon(Icons.arrow_back_ios,
                          //       color: currentIndex > 0
                          //           ? AppColors.primary
                          //           : (AppColors.primary).withOpacity(0.4)),
                          // ),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: cubit
                                  .addRoomReservationModel.data!.rooms!
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
                          // GestureDetector(
                          //   onTap: () {
                          //     setState(() {
                          //       if (currentIndex <
                          //           cubit.addRoomReservationModel.data!.rooms!
                          //                   .length -
                          //               1) {
                          //         currentIndex++;
                          //       }
                          //     });
                          //   },
                          //   child: Icon(
                          //     Icons.arrow_forward_ios,
                          //     color: currentIndex <
                          //             cubit.addRoomReservationModel.data!.rooms!
                          //                     .length -
                          //                 1
                          //         ? AppColors.primary
                          //         : (AppColors.primary).withOpacity(0.4),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: getHeightSize(context) * 0.35,
                    //   child: Swiper(
                    //     itemCount: cubit.addRoomReservationModel.data!.rooms!
                    //         .length, // Define the number of items in the swiper
                    //     itemBuilder: (BuildContext context, int index) {
                    //       // Return a CustomContainerBooking for each item
                    //       return CustomContainerBooking(
                    //         room: cubit
                    //             .addRoomReservationModel.data!.rooms![index],
                    //       );
                    //     },
                    //     pagination: const SwiperPagination(),
                    //   ),
                    // ),

                    SizedBox(
                      height: 10.h,
                    ),
                    // price and copounes
                    CustomPricesWidget(
                      totalPrice: cubit.addRoomReservationModel.data!.totalPrice
                          .toString(),
                      totalPriceAfterVat: cubit
                          .addRoomReservationModel.data!.totalPriceAfterVat
                          .toString(),
                      vat: cubit.addRoomReservationModel.data!.vat.toString(),
                      terms: cubit.lodgesDetailsModel.data?.rule?.rule,
                      reservationId:
                          cubit.addRoomReservationModel.data?.id ?? 0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
