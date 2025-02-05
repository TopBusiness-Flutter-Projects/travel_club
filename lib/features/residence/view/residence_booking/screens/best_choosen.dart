import 'package:travel_club/features/residence/data/models/rooms_model.dart';
import 'package:travel_club/features/residence/view/residence_booking/widgets/custom_container_booking.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/residence_cubit.dart';

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
                    CustomButton(
                      isBordered: cubit.changedRooms == 0 ? true : false,
                      onTap: () {
                        cubit.addRoomReservation(context);
                      },
                      title: cubit.changedRooms == 0
                          ? AppTranslations.skip
                          : AppTranslations.confirm,
                      width: getWidthSize(context) / 2,
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

                                    //  cubit.addOrRemoveRoom( cubit.selectedRooms[index].recommend);
                                    debugPrint(
                                        cubit.selectedRooms.length.toString());
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

// Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3RyYXZlbC50b3BidXNpbmVzcy5lYmhhcmJvb2suY29tL2FwaS92MS9jaGVja090cCIsImlhdCI6MTczNzI5MDA5NSwiZXhwIjoxNzY4ODI2MDk1LCJuYmYiOjE3MzcyOTAwOTUsImp0aSI6ImIyR1JiUXJlc0tYc2lkWHgiLCJzdWIiOiIxMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjciLCJ1c2VyX2lkIjoxMiwiYXV0aF91dWlkIjoiMzc3ODdhNzMtNmVmYS00MDM5LWE2YzUtMDRlZDE3MzBhMjgxIn0.N4Cv45n3KTVopT_HesZubnjkbQhzXfLMR9foSMNX6J8