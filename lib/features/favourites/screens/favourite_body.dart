import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/favourites/cubit/favourites_state.dart';
import 'package:travel_club/features/residence/data/models/lodges_model.dart';
import 'package:travel_club/features/residence/view/widgets/residence_widgets/accomendation_rating.dart';
import '../../entertainment/screens/widgets/custom_container_companies.dart';
import '../../food/widgets/big_container_food.dart';
import '../../home/screens/widgets/custom_appbar.dart';
import '../../my_account/screens/widgets/profile_not_loging.dart';
import '../../transportation/screens/widgets/custom_company_container.dart';
import '../cubit/favourites_cubit.dart';
import 'custom_favourite_catogrey.dart';

class Favouritebody extends StatefulWidget {
  const Favouritebody({
    super.key,
  });

  @override
  State<Favouritebody> createState() => _FavouritebodyState();
}

class _FavouritebodyState extends State<Favouritebody> {
  @override
  Widget build(BuildContext context) {
    FavouritesCubit cubit = context.read<FavouritesCubit>();
    return BlocBuilder<FavouritesCubit, FavouritesState>(
        builder: (context, state) {
      return AppConst.isLogged == false
          ? ProfileNotLoging(
              title: AppTranslations.favorites,
            )
          : Column(children: [
              SizedBox(height: getVerticalPadding(context) * 2),
              //app bar
              CustomHomeAppbar(
                isHome: false,
                title: AppTranslations.favorites,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //list view حجوزات اول حاجه
                    Padding(
                      padding: EdgeInsets.only(top: 45.0.h, right: 10.w),
                      child: SizedBox(
                        height: 54.h, // Fixed height for the ListView
                        child: ListView.separated(
                          itemCount: cubit.categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return CustomBookingSectionFavourite(
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
                      Expanded(
                          child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomLodgeContainer(
                            lodgesModel: LodgeModel()
                            // HotelsModel(isFavorite: true,isFavoriteTrue: true,title: 'مراسي ريزورت العين السخنه البحر الاحمر', rate:4 , discription: '٢٠٠ فرد قام بتقيم الفندق', image:   "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                            //   )
                            ,
                          ),
                        ),
                      ))
                    ],
                    // SizedBox(height: 30.h,)
                    if (cubit.categories[cubit.selectedIndex] ==
                        AppTranslations.transportation) ...[
                      Expanded(
                          child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) =>
                                  CustomCompanyContainer(
                                    isFavouriteScreen: true,
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
                                    isFavouriteScreen: true,
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
              SizedBox(
                height: getHeightSize(context) * .1,
              )
            ]);
    });
  }
}
