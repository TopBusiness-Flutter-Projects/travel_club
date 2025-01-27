import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/utils/convert_numbers_method.dart';
import 'package:travel_club/features/residence/cubit/residence_cubit.dart';
import 'package:travel_club/features/residence/view/residence_booking/widgets/custom_container_booking.dart';
import 'package:travel_club/features/residence/view/residence_booking/widgets/custom_member_widget.dart';
import 'package:travel_club/features/residence/view/residence_booking/widgets/custom_rounded_button.dart';
import '../../../../transportation/cubit/transportation_cubit.dart';
import '../../../../transportation/screens/widgets/custom_from_to_date.dart';

class ResidenceBooking extends StatefulWidget {
  const ResidenceBooking({super.key, required this.lodgeId});
  final int lodgeId;
  @override
  State<ResidenceBooking> createState() => _ResidenceBookingState();
}

class _ResidenceBookingState extends State<ResidenceBooking> {
  @override

  //
  bool isSend = false;
  void initState() {
    isSend = false;
    context.read<ResidenceCubit>().makeModelNull();

    context.read<TransportationCubit>().goOnly = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ResidenceCubit>();
    return BlocBuilder<ResidenceCubit, ResidenceState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
          //   onTapp: (){
          //   Navigator.pushNamed(context, Routes.bestChoosenScreen);
          // },
          isBooking: true, appbarTitle: AppTranslations.booking,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                //text
                Text(
                  AppTranslations.selectGoingAndReturn,
                  style: getMediumStyle(fontSize: 14.sp),
                ),
                SizedBox(
                  height: 20.h,
                ),
//custom member
                const CustomMemberWidget(),
                SizedBox(
                  height: 10.h,
                ),
//from and to date
                const CustomFromToDate(),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (isSend || cubit.lodgesRoomsModel.data != null) ...[
                      Text(
                        AppTranslations.chooseTheBestOption,
                        style: getMediumStyle(fontSize: 14.sp),
                      ),
                      Spacer(),
                    ],
                    Center(
                      child: SizedBox(
                        width: 179.w,
                        child: CustomButton(
                          title: AppTranslations.showRooms,
                          width: 179.w,
                          onTap: () {
                            setState(() {
                              isSend = true;
                            });
                            context.read<ResidenceCubit>().sum = 0;
                            context.read<ResidenceCubit>().selectedRooms = [];
                            context
                                .read<ResidenceCubit>()
                                .lodgesRoomsModel
                                .data = null;

                            cubit.getRoomsLodges(
                                context: context, lodgeId: widget.lodgeId);
                          },
                        ),
                      ),
                    )
                  ],
                ),
                //custom contanier
                !isSend
                    ? Container()
                    : Expanded(
                        child: cubit.lodgesRoomsModel.data == null
                            ? const Center(
                                child: SizedBox(),
                              )
                            : cubit.lodgesRoomsModel.data?.isEmpty ?? false
                                ? Center(child: Text(AppTranslations.noData))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        cubit.lodgesRoomsModel.data?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CustomContainerBooking(
                                        room:
                                            cubit.lodgesRoomsModel.data?[index],
                                        widgetBottom: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AutoSizeText(
                                                    '${AppTranslations.priceFor} ${cubit.lodgesRoomsModel.data?[index].diff.toString()} ${AppTranslations.nights}',
                                                    maxLines: 1,
                                                    style: getRegularStyle(
                                                        fontSize: 14.sp,
                                                        color: AppColors.grey),
                                                  ),
                                                  AutoSizeText(
                                                    // '${cubit.lodgesRoomsModel.data?[index].totalPrice}' +
                                                    '${formatNumber(double.parse(cubit.lodgesRoomsModel.data?[index].totalPrice.toString() ?? "0"))}'
                                                            " " +
                                                        AppTranslations
                                                            .currency,
                                                    maxLines: 1,
                                                    style: getSemiBoldStyle(
                                                        fontSize: 16.sp,
                                                        color:
                                                            AppColors.primary),
                                                  ),
                                                  AutoSizeText(
                                                    AppTranslations.withoutTax,
                                                    maxLines: 1,
                                                    style: getRegularStyle(
                                                        fontSize: 12.sp,
                                                        color: AppColors.grey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            CustomRoundedButton(
                                              isBooking: true,
                                              // isBordered: true,
                                              icon: cubit.selectedRooms.any(
                                                      (room) =>
                                                          room.id ==
                                                          cubit.lodgesRoomsModel
                                                              .data?[index].id)
                                                  ? Icons.remove
                                                  : Icons.add,
                                              title: cubit.selectedRooms.any(
                                                      (room) =>
                                                          room.id ==
                                                          cubit.lodgesRoomsModel
                                                              .data?[index].id)
                                                  ? AppTranslations.remove
                                                  : AppTranslations.add,
                                              onTap: () {
                                                cubit.addOrRemoveRoom(cubit
                                                    .lodgesRoomsModel
                                                    .data![index]);
                                                //       Navigator.pushNamed(context, Routes.secondBookingAccommodation);
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                      ),
              ],
            ),
          ),

          widget: !isSend
              ? null
              : cubit.selectedRooms.isEmpty
                  ? null
                  : CustomContainerWithShadow(
                      height: 74.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AutoSizeText(
                            formatNumber(double.parse(cubit.sum.toString())),
                            style: getSemiBoldStyle(fontSize: 16.sp),
                          ),
                          CustomButton(
                            title: AppTranslations.bookNow,
                            width: getWidthSize(context) * 0.35,
                            onTap: () {
                              cubit.isRoomsValid() == true
                                  ? cubit.getCheckDuplicateRecommendedRooms(
                                      context: context)
                                  : errorGetBar(
                                      AppTranslations.pleaseSelectRoom);
                            },
                          )
                        ],
                      )),
        );
      },
    );
  }
}
