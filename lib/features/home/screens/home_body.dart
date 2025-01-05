import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/home/screens/widgets/search_container.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/custom_bag_section.dart';
import 'widgets/custom_category_section.dart';
import 'widgets/custom_offers_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<HomeCubit>().getHomeData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Column(children: [
        SizedBox(height: getVerticalPadding(context) * 2),
         CustomHomeAppbar(isHome: true, title: 'Guest',),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomCategorySection(), // search bar
                SizedBox(height: 10.h,),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getHorizontalPadding(context) / 2),
                  child:
                  // CustomTextField(
                  //   controller: cubit.searchController,
                  //   hintText: AppTranslations.search,
                  //   suffixIcon: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: SvgPicture.asset(AppIcons.search),
                  //   ),
                  // ),
                  SearchContainer(onTap: (){
                    Navigator.pushNamed(context, Routes.searchScreen);
                  },)
                ),
                SizedBox(height: 10.h,),
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
