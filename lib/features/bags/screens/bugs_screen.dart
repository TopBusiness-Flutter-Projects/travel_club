import 'package:travel_club/core/widgets/no_data_widget.dart';

import '../../../core/exports.dart';
import '../cubit/bugs_cubit.dart';
import 'widgets/custom_container_widget.dart';

class BugsScreen extends StatefulWidget {
  const BugsScreen({super.key});

  @override
  State<BugsScreen> createState() => _BugsScreenState();
}

class _BugsScreenState extends State<BugsScreen> {
  @override
  void initState() {
    context.read<BugsCubit>().getNotification();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BugsCubit>();
    return BlocBuilder<BugsCubit, BugsState>(
      builder: (BuildContext context, state) {
         return
          RefreshIndicator(
            onRefresh: () {

           return   cubit.getNotification();
            },
            child: CustomScreen(
              appbarTitle: AppTranslations.notifications,
              body:cubit.getNotificationModel.data==null?const Center(child: CustomLoadingIndicator(),):
              cubit.getNotificationModel.data?.isEmpty??false? Center(child: NoDataWidget(title: AppTranslations.noData)):
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                 return
                   CustomContainerWidget(

                     data: cubit.getNotificationModel.data![index],);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: getVerticalPadding(context) * 1,
                  );
                },
                itemCount: cubit.getNotificationModel.data?.length??0,
              )),
          );
      },
    );
  }
}
