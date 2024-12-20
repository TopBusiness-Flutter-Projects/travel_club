import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_text_form_field.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/custom_bag_section.dart';
import 'widgets/custom_category_section.dart';
import 'widgets/custom_offers_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Column(children: [
        SizedBox(height: getVerticalPadding(context) * 2),
        const CustomHomeAppbar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomCategorySection(), // search bar
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getHorizontalPadding(context) / 2),
                  child: CustomTextField(
                    controller: cubit.searchController,
                    hintText: AppTranslations.search,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AppIcons.search),
                    ),
                  ),
                ),
                const CustomOffersSection(),
                SizedBox(height: getVerticalPadding(context)),
                const CustomBagSection(),
                SizedBox(height: getHeightSize(context) * 0.13),
              ],
            ),
          ),
        ),
      ]);
    });
  }
}
