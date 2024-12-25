import '../../../../core/exports.dart';
import '../../cubit/notification_cubit.dart';

class CustomContainerWidget extends StatelessWidget {
  const CustomContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomContainerWithShadow(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //notification icon
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lbny.withOpacity(.2),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(8.w),
                        child: SvgPicture.asset(
                          AppIcons.notificationIcon,
                          color: AppColors.primary,
                        )),
                  ),
                  SizedBox(width: 15.w),
                  //column
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("تم قبول حجز بنجاح من قبل فندق مرسي علم"),
                        SizedBox(
                          height: getVerticalPadding(context) * 1,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              AppIcons.calendar,
                              color: AppColors.grey,
                            ),
                            Text(
                              "٢٠ يناير ٢٠٢٢",
                              style: getMediumStyle(
                                  color: AppColors.grey, fontSize: 14.sp),
                            ),
                          ],
                        )
                      ],
                    ),
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
