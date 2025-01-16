import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/residence/data/models/getlodges_model.dart';
import 'package:travel_club/features/residence/view/widgets/acommendation_widgets/accomendation_rating.dart';
import 'package:travel_club/features/search/cubit/search_cubit.dart';
import 'package:travel_club/features/search/screens/widgets/custom_booking_sectoin.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../entertainment/screens/widgets/custom_container_companies.dart';
import '../../food/widgets/big_container_food.dart';
import '../../transportation/screens/widgets/custom_company_container.dart';

class Searchbody extends StatefulWidget {
  const Searchbody({
    super.key,
  });
  @override
  State<Searchbody> createState() => _SearchbodyState();
}

class _SearchbodyState extends State<Searchbody> {
  @override
  Widget build(BuildContext context) {
    SearchCubit cubit = context.read<SearchCubit>();
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: getVerticalPadding(context) * 2),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const CustomBackButton(),
              5.w.horizontalSpace,
              Expanded(
                child: CustomTextField(
                  controller: cubit.searchController,
                  autoFocus: true,
                  hintText: AppTranslations.search,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppIcons.search),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //list view حجوزات اول حاجه
              Padding(
                padding: EdgeInsets.only(top: 10.0.h, right: 10.w),
                child: SizedBox(
                  height: 54.h, // Fixed height for the ListView
                  child: ListView.separated(
                    itemCount: cubit.categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomBookingSectionSearch(
                        index: index,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 10.w);
                    },
                  ),
                ),
              ),
              //body ...
              if (cubit.categories[cubit.selectedIndex] ==
                  AppTranslations.accommodation) ...[
                // Container()
                Expanded(
                    child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomLodgeContainer(hotelsModel: LodgeModel()),
                  ),
                )),
              ],
              // SizedBox(height: 30.h,)
              if (cubit.categories[cubit.selectedIndex] ==
                  AppTranslations.transportation) ...[
                Expanded(
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) => CustomCompanyContainer(
                              isFavouriteScreen: false,
                            ))),
              ],
              if (cubit.categories[cubit.selectedIndex] ==
                  AppTranslations.food) ...[
                //  FoodBookingBody()
                SizedBox(
                  height: 30.h,
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BigContainerFood(
                      index: 0,
                      isFavouriteScreen: false,
                    ),
                  ),
                ))

                // Container()
              ],
              if (cubit.categories[cubit.selectedIndex] ==
                  AppTranslations.entertainment) ...[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.detailsEntertainment);
                            },
                            child: CustomContainerCompanies(
                              isDetails: true,
                              isFavouriteScreen: false,
                            )),
                      );
                    },
                    itemCount: 10,
                  ),
                )
              ],
            ],
          ),
        ),
        10.h.verticalSpace
      ]);
    });
  }
}
