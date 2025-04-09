import 'package:travel_club/features/notification/screens/widgets/custom_container_widget.dart';

import '../../../core/exports.dart';
import '../cubit/notification_cubit.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<NotificationCubit>().getNotification();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<NotificationCubit>();
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (BuildContext context, state) {
         return
          CustomScreen(
            appbarTitle: AppTranslations.notifications,
            body:cubit.getNotificationModel.data==null?const Center(child: CircularProgressIndicator(),):
            cubit.getNotificationModel.data?.isEmpty??false? Center(child: Text(AppTranslations.noData)):
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
               return
                 CustomContainerWidget(data: cubit.getNotificationModel.data![index],);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: getVerticalPadding(context) * 1,
                );
              },
              itemCount: cubit.getNotificationModel.data?.length??0,
            ));
      },
    );
  }
}
