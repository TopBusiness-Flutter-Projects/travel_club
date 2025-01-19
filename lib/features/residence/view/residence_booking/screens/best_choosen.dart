import 'package:travel_club/features/residence/view/residence_booking/widgets/custom_container_booking.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/residence_cubit.dart';
import '../widgets/custom_rounded_button.dart';

class BestChosenScreen extends StatefulWidget {
  const BestChosenScreen({super.key});

  @override
  State<BestChosenScreen> createState() => _BestChosenScreenState();
}

class _BestChosenScreenState extends State<BestChosenScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ResidenceCubit>();
    return BlocBuilder<ResidenceCubit, ResidenceState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
          isBooking: true,
          widget: CustomContainerWithShadow(
              height: 74.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cubit.changedRooms == 0
                        ? CustomButton(
                            isBordered: true,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.secondBookingResidence);
                            },
                            title: AppTranslations.skip,
                            width: getWidthSize(context) / 2,
                          )
                        : CustomButton(
                            title: AppTranslations.confirm,
                            width: getWidthSize(context) / 2,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.secondBookingResidence);
                            },
                          )
                  ],
                ),
              )),
          appbarTitle: AppTranslations.bestChoosen,
          body: Column(
            // Ensure there is a Column or similar widget here
            children: [
              Expanded(
                // This should be directly inside a Column, Row, or Flex
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: cubit.selectedRooms.length,
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Divider(
                      thickness: 2,
                      color: AppColors.grey1,
                    ),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(height: 5.h),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(AppTranslations.yourChoose,
                                style: getMediumStyle(fontSize: 14.sp)),
                          ),
                          CustomContainerBooking(
                            widgetBottom: SizedBox(),
                            room: cubit.selectedRooms[index],
                          ),
                          SizedBox(height: 10.h),
                          if (cubit.selectedRooms[index].recommend != null) ...[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(AppTranslations.favoriteChoice,
                                  style: getMediumStyle(fontSize: 14.sp)),
                            ),
                            Center(
                              child: CustomContainerBooking(
                                room: cubit.selectedRooms[index].recommend,
                                widgetBottom: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      cubit.selectedRooms[index].recommend!
                                              .isSelectedRecommend
                                          ? cubit.changedRooms--
                                          : cubit.changedRooms++;
                                    });
                                    cubit.selectedRooms[index].recommend!
                                            .isSelectedRecommend =
                                        !cubit.selectedRooms[index].recommend!
                                            .isSelectedRecommend;
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomButton(
                                      width: double.infinity,
                                      isBordered: cubit.selectedRooms[index]
                                          .recommend!.isSelectedRecommend,
                                      title: cubit.selectedRooms[index]
                                              .recommend!.isSelectedRecommend
                                          ? AppTranslations.chooseDone
                                          : AppTranslations.changeChoice,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
