import 'package:travel_club/features/home/cubit/home_cubit.dart';
import 'package:travel_club/features/home/cubit/home_state.dart';
import '../../../core/exports.dart';
import 'widgets/custom_bag_section.dart';
import 'widgets/custom_offers_section.dart';

class BestBagsScreen extends StatelessWidget {
  const BestBagsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
            appbarTitle: AppTranslations.bestBags,
            body: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return CustomBagContainer(
                  isLast: true,
                  isHome: false,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: getVerticalPadding(context) * 1,
                );
              },
              itemCount: 20,
            ));
      },
    );
  }
}
