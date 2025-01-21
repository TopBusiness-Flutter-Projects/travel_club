import '../../../../../core/exports.dart';
import '../../../../transportation/cubit/transportation_cubit.dart';
import '../../../cubit/residence_cubit.dart';
import '../../../data/models/rooms_model.dart';
import 'custom_rooms_widget.dart';

class CustomContainerBooking extends StatelessWidget {
  CustomContainerBooking({super.key, this.widgetBottom, this.room});
  Widget? widgetBottom;
  final RoomModel? room;
  // final bool? isRecommended;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ResidenceCubit>();
    return BlocBuilder<ResidenceCubit, ResidenceState>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomContainerWithShadow(
             
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  room?.name.toString() ?? "",
                  style:
                      getBoldStyle(fontSize: 16.sp, color: AppColors.primary),
                ),
                SizedBox(
                  height: 10.h,
                ),
                if (room?.facilities!.isNotEmpty ?? false) ...[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.correct),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          AppTranslations.cancelFree +
                                  "  " +
                                  context
                                      .read<TransportationCubit>()
                                      .toDate
                                      .toString() ??
                              "",
                          style: getRegularStyle(
                              fontSize: 14.sp, color: AppColors.green),
                        ),
                      ],
                    ),
                  ),
                ],

                Divider(
                  color: AppColors.lightBlue1,
                ),
                //custom rooms widget
                if (room?.facilities == null)
                  Center(
                    child: CustomLoadingIndicator(),
                  )
                else if (room?.facilities!.isNotEmpty ?? true) ...[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 10.w,
                        runSpacing: 10.h,
                        children: List.generate(
                            12,
                            // room?.facilities?.length ?? 0,
                            (index) =>
                                // Text("dddd "+index.toString(),style: getRegularStyle(fontSize: 14.sp),),
                                SizedBox(
                                    width: getWidthSize(context) * 0.3,
                                    child: CustomRoomsWidget(
                                      facility: room!.facilities![0],
                                    ))),
                      )
                      // StaggeredGrid.count(
                      //   crossAxisCount: 2,
                      //   children: List.generate(6, (index) =>
                      //       Text("dddd "+index.toString(),style: getRegularStyle(fontSize: 14.sp),),
                      //       // CustomRoomsWidget()
                      //   ),
                      //
                      // ),
                      )
                ],

                // Divider(color: AppColors.lightBlue1,),
                widgetBottom ?? Container(),
              ],
            ),
          )),
          //Container()
        );
      },
    );
  }
}
