import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/accommodation/view/widgets/acommendation_widgets/accomendation_rating.dart';
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
                    child: CustomWidgetRating(
                      hotelsModel: HotelsModel(
                        isFavorite: true,
                        isFavoriteTrue: false,
                        title: 'مراسي ريزورت العين السخنه البحر الاحمر',
                        rate: 4,
                        discription: '٢٠٠ فرد قام بتقيم الفندق',
                        image:
                            "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                      ),
                    ),
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
