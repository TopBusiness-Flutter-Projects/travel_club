import 'package:travel_club/features/entertainment/cubit/entertainment_cubit.dart';
import 'package:travel_club/features/entertainment/data/model/get_orginization_details_model.dart';

import '../../../../../core/exports.dart';
import '../../../../payment/screens/widgets/custom_price_widget.dart';

class SecondBookTableEntermaint extends StatelessWidget {
  final WayService wayService;
  const SecondBookTableEntermaint({super.key, required this.wayService});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<EntertainmentCubit>();
    return WillPopScope(
      onWillPop: () async {
        checkGoToHome(context);
        return false;
      },
      child: BlocBuilder<EntertainmentCubit, EntertainmentState>(
        builder: (BuildContext context, state) {
          return CustomScreen(
              appbarTitle: AppTranslations.booking,
              appBarOnPresses: () {
                checkGoToHome(context);
              },
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            cubit.getOrganizationsDetailsModel?.data?.name ??
                                "",
                            style: getSemiBoldStyle(
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomContainerWithShadow(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        wayService.name?.toString() ?? "",
                                        style: getSemiBoldStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.secondPrimary,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Text(
                                        "${wayService.price} ${AppTranslations.currency}",
                                        style: getSemiBoldStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        AppTranslations.theTotal,
                                        style: getSemiBoldStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.secondPrimary,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Text(
                                        cubit.clientCountController.text
                                                .isNotEmpty
                                            ? "${(double.parse(wayService.price.toString()) * double.parse(cubit.clientCountController.text.toString()))} ${AppTranslations.currency}"
                                            : "0 ${AppTranslations.currency}",
                                        style: getSemiBoldStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: getHeightSize(context) * .05),
                        GestureDetector(
                          onTap: () {
                            print("${wayService.id}");
                          },
                          child: CustomPricesWidget(
                            totalPrice:
                                "${cubit.addEntetainmentReservationModel?.data?.totalPrice}",
                            totalPriceAfterVat:
                                "${cubit.addEntetainmentReservationModel?.data?.totalPriceAfterVat}",
                            vat:
                                "${cubit.addEntetainmentReservationModel?.data?.vat}",
                            terms:
                                cubit.getOrganizationsDetailsModel?.data?.rule,
                            reservationId:cubit.addEntetainmentReservationModel?.data?.reservationId ?? 0,
                          ),
                        ),
                      ]),
                ),
              ));
        },
      ),
    );
  }
}
