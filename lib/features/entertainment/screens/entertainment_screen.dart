import 'package:travel_club/core/widgets/no_data_widget.dart';
import 'package:travel_club/features/entertainment/screens/widgets/entertainment_widget.dart';
import '../../../core/exports.dart';
import '../cubit/entertainment_cubit.dart';

class EntertainmentScreen extends StatefulWidget {
  const EntertainmentScreen({super.key});

  @override
  State<EntertainmentScreen> createState() => _EntertainmentScreenState();
}

class _EntertainmentScreenState extends State<EntertainmentScreen> {
  @override
  void initState() {
    context.read<EntertainmentCubit>().getWays();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<EntertainmentCubit>();
    return BlocBuilder<EntertainmentCubit, EntertainmentState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
          appbarTitle: AppTranslations.entertainmentMeans,
          body: Column(
            children: [
              SizedBox(height: getVerticalPadding(context) * 2),
              Expanded(
                child: cubit.getWaysModel.data == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : cubit.getWaysModel.data!.isEmpty
                        ? Center(child: NoDataWidget(title: AppTranslations.noData))
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 1,
                                    crossAxisSpacing: 2,
                                    childAspectRatio: 0.8),
                            itemBuilder: (context, index) {
                              return EntertainmentWidget(
                                waysData: cubit.getWaysModel.data![index],
                              );
                            },
                            itemCount: cubit.getWaysModel.data?.length ?? 0,
                          ),
              ),
              SizedBox(height: getVerticalPadding(context) * 1),
            ],
          ),
        );
      },
    );
  }
}
