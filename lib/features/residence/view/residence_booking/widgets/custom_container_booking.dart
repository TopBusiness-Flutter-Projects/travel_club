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
          padding: EdgeInsets.all(getHeightSize(context) * 0.01),
          child: CustomContainerWithShadow(
              child: Padding(
            padding: EdgeInsets.only(
              top: getHeightSize(context) * 0.01,
              bottom: getHeightSize(context) * 0.01,
              left: 10.w,
              right: 10.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                AutoSizeText(
                  room?.name.toString() ?? "",
                  maxLines: 1,
                  style:
                      getBoldStyle(fontSize: 16.sp, color: AppColors.primary),
                ),
                SizedBox(
                  height: getHeightSize(context) * 0.01,
                ),
                if (room?.canCancel != null &&
                    room?.canCancel.toString() != "false") ...[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.correct),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          AppTranslations.cancelFree + "  " + room?.canCancel,
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
                if (room?.facilities!.isNotEmpty ?? false) ...[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 15.w,
                        runSpacing: 10.h,
                        children: List.generate(
                            room?.facilities?.length ?? 0,
                            (index) => CustomFacilityWidget(
                                  facility: room!.facilities![index],
                                )),
                      ))
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
