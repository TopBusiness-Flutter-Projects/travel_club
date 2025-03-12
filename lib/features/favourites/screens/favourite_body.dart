import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/favourites/cubit/favourites_state.dart';
import 'package:travel_club/features/food/data/models/get_resturant_model.dart';
import 'package:travel_club/features/residence/view/widgets/residence_widgets/accomendation_rating.dart';
import '../../entertainment/screens/widgets/custom_container_companies.dart';
import '../../food/widgets/big_container_food.dart';
import '../../home/cubit/home_cubit.dart';
import '../../home/cubit/home_state.dart';
import '../../home/screens/widgets/custom_appbar.dart';
import '../../my_account/screens/widgets/profile_not_loging.dart';
import '../../my_bookings/view/widgets/custom_catogrey_reseration.dart';
import '../../transportation/screens/widgets/custom_company_container.dart';
import '../cubit/favourites_cubit.dart';

class FavouriteBody extends StatefulWidget {
  const FavouriteBody({
    super.key,
  });

  @override
  State<FavouriteBody> createState() => _FavouriteBodyState();
}

class _FavouriteBodyState extends State<FavouriteBody> {
  @override
  void initState() {
    // TODO: implement initState
    if (context.read<HomeCubit>().homeModel.data == null) {
      context.read<HomeCubit>().getHomeData();
    }
    context.read<FavouritesCubit>().getFavourite(moduleId:  context.read<FavouritesCubit>().selectedModuleId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    FavouritesCubit cubit = context.read<FavouritesCubit>();
    return BlocBuilder<FavouritesCubit, FavouritesState>(
        builder: (context, state) {
      return AppConst.isLogged == false
          ? ProfileNotLoging(
              title: AppTranslations.favorites,
            )
          : Column(
          children: [
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
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (BuildContext context, state) {
                        var cubit = context.read<HomeCubit>();
                        return Padding(
                          padding: EdgeInsets.only(top: 20.0.h, right: 10.w),
                          child: SizedBox(
                            height: 54.h, // Fixed height for the ListView
                            child: ListView.separated(
                              itemCount: cubit.homeModel.data?.modules?.length ?? 0,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomReservationSection(
                                  // index: index,
                                  isFavouritesScreen: true,
                                  module: cubit.homeModel.data?.modules?[index],
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(width: 10.w);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    //body ...
                    if (cubit.selectedModuleId == 1) ...[
                      Expanded(
                          child:
                          cubit.residenceFavouriteModel.data == null
                              ? Center(
                            child: CustomLoadingIndicator(),
                          )
                              : cubit.residenceFavouriteModel.data!.isEmpty
                              ? Center(
                            child: Text('no_data'.tr()),
                          )
                              :
                          ListView.builder(
                        itemCount:cubit.residenceFavouriteModel.data!.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomLodgeContainer(
                            isFavouriteScreen:true,
                            lodgesModel:cubit.residenceFavouriteModel.data![index],
                            // HotelsModel(isFavorite: true,isFavoriteTrue: true,title: 'مراسي ريزورت العين السخنه البحر الاحمر', rate:4 , discription: '٢٠٠ فرد قام بتقيم الفندق', image:   "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                            //   )

                          ),
                        ),
                      ))
                    ],
                    // SizedBox(height: 30.h,)
                    if (cubit.selectedModuleId == 2) ...[
                      Expanded(
                          child:
                          cubit.transportationFavouriteModel.data == null
                              ? Center(
                            child: CustomLoadingIndicator(),
                          )
                              : cubit.transportationFavouriteModel.data!.isEmpty
                              ?
                          Center(
                            child: Text('no_data'.tr()),
                          )
                              :
                          ListView.builder(
                              itemCount: cubit.transportationFavouriteModel.data!.length,
                              itemBuilder: (context, index) =>
                                  CustomCompanyContainer(
                                    isFavouriteScreen: true,
                                    companyModel: cubit.transportationFavouriteModel.data![index],
                                  )
                          )
                      ),
                    ],
                    if (cubit.selectedModuleId == 3) ...[
                      //  FoodBookingBody()
                      SizedBox(
                        height: 30.h,
                      ),
                      Expanded(
                          child:
                          cubit.getRestaurantModel.data == null
                              ? Center(
                            child: CustomLoadingIndicator(),
                          )
                              : cubit.getRestaurantModel.data!.isEmpty
                              ? Center(
                            child: Text('no_data'.tr()),
                          ):
                          ListView.builder(
                        itemCount: cubit.getRestaurantModel.data!.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BigContainerFood(
                           resturantData:  cubit.getRestaurantModel.data![index],
                          ),
                        ),
                      )
                      )

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
                                //    isFavouriteScreen: true,
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
