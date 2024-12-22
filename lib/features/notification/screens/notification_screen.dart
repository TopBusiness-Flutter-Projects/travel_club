import 'package:travel_club/features/notification/screens/widgets/custom_container_widget.dart';

import '../../../core/exports.dart';
import '../cubit/notification_cubit.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder< NotificationCubit, NotificationState>(builder: (BuildContext context, state) { return CustomScreen(
        appbarTitle: AppTranslations.notifications, body:
    Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return CustomContainerWidget();
        }, separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: getVerticalPadding(context)*1,);
      }, itemCount: 30,),
    )); },);
  }
}
