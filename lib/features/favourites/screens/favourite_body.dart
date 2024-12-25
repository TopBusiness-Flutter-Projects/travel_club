import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/accommodation/view/widgets/acommendation_widgets/accomendation_rating.dart';
import 'package:travel_club/features/favourites/cubit/favourites_state.dart';
import '../../home/screens/widgets/custom_appbar.dart';
import '../../my_bookings/view/food_booking/screens/custom_booking_food.dart';
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
      return Column(children: [
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
                    itemCount: 3,
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
                  AppTranslations.accommodationBookings) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomWidgetRating(
                    hotelsModel: HotelsModel(
                      title: 'مراسي ريزورت العين السخنه البحر الاحمر',
                      rate: 4,
                      discription: '٢٠٠ فرد قام بتقيم الفندق',
                      image:
                          "https://lotel.efaculty.tech/storage/cities/38461735112771.webp",
                    ),
                  ),
                ),
              ],

              // SizedBox(height: 30.h,)
              if (cubit.categories[cubit.selectedIndex] ==
                  AppTranslations.transportation) ...[
                Container(),
              ],
              if (cubit.categories[cubit.selectedIndex] ==
                  AppTranslations.foodBookings) ...[FoodBookingBody()]
            ],
          ),
        ),
        SizedBox(height: getVerticalPadding(context) * 4),
      ]);
    });
  }
}
