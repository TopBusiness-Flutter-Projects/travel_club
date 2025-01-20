import 'package:card_swiper/card_swiper.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_terms_and_conditions.dart';
import 'package:travel_club/features/residence/view/residence_booking/widgets/linear_progress.dart';
import 'package:travel_club/features/residence/view/widgets/residence_widgets/accomendation_rating.dart';

import '../../../../transportation/cubit/transportation_cubit.dart';
import '../../../../transportation/screens/widgets/custom_from_to_date.dart';
import '../../../cubit/residence_cubit.dart';
import '../widgets/custom_container_booking.dart';
import '../widgets/custom_copun_widget.dart';
import '../widgets/payment_widget.dart';

class SecondResidenceBooking extends StatefulWidget {
  const SecondResidenceBooking({super.key});

  @override
  State<SecondResidenceBooking> createState() => _SecondResidenceBookingState();
}

class _SecondResidenceBookingState extends State<SecondResidenceBooking> {
  @override
  void initState() {
    // TODO: implement initState
    // context.read<ResidenceCubit>().addRoomReservation();
    context.read<TransportationCubit>().goOnly = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ResidenceCubit>();
    return BlocBuilder<ResidenceCubit, ResidenceState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
          appbarTitle: AppTranslations.booking,
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
                    lodgesModel: cubit.addRoomReservationModel.data!.lodge??cubit.defaultLodge,
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
                  // CustomContainerBooking(
                  //   widgetBottom: SizedBox(),
                  // ),
                  SizedBox(
                    height: 300.h,
                    child: Swiper(
                      itemCount: cubit.addRoomReservationModel.data!.rooms!.length, // Define the number of items in the swiper
                      itemBuilder: (BuildContext context, int index) {
                        // Return a CustomContainerBooking for each item
                        return CustomContainerBooking(
                          room:  cubit.addRoomReservationModel.data!.rooms![index],
                          widgetBottom: SizedBox(),
                        );
                      },
                      pagination: SwiperPagination(),
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),
//payment
                  Text(
                    AppTranslations.paymentDetails,
                    style: getMediumStyle(fontSize: 14.sp),
                  ),
                  SizedBox(height: 20.h,),
                   PaymentWidget(
                     price: cubit.addRoomReservationModel.data?.totalPrice.toString(),
                     vat: cubit.addRoomReservationModel.data?.vat.toString(),
                     totalPrice: cubit.addRoomReservationModel.data?.totalPriceAfterVat.toString(),
                   ),
                  SizedBox(height: 20.h,),
//copun
                  Text(
                    AppTranslations.areYouHaveACoupon,
                    style: getMediumStyle(fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
//CustomCopunWidget
                  const CustomCopunWidget(),
                  CustomAcceptTerms(
                    terms: cubit.lodgesDetailsModel.data?.rule?.rule ?? "",
                  ),
   
//button
                  CustomButton(
                    title: AppTranslations.completePayment,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.payment);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
