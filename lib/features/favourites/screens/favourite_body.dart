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
    return BlocBuilder<FavouritesCubit,FavouritesState >(builder: (context, state) {
      return Column(children: [
        SizedBox(height: getVerticalPadding(context) * 2),
        //app bar
        CustomHomeAppbar(isHome: false, title: AppTranslations.favorites,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //list view حجوزات اول حاجه

            Padding(
              padding:  EdgeInsets.only(top:45.0.h,right: 10.w),
              child: SizedBox(
                height: 54.h, // Fixed height for the ListView
                child: ListView.separated(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomBookingSectionFavourite(index: index,);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 10.w);
                  },
                ),
              ),
            ),
            //body ...
            if(cubit.categories[cubit.selectedIndex] ==     AppTranslations.accommodationBookings)...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomWidgetRating(hotelsModel: HotelsModel(title: 'مراسي ريزورت العين السخنه البحر الاحمر', rate:4 , discription: '٢٠٠ فرد قام بتقيم الفندق', image:   "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                    onTap: (){
                      Navigator.pushNamed(context, Routes.detailsAccomendation);
                    }),),
              ),
            ],

            // SizedBox(height: 30.h,)
            if(cubit.categories[cubit.selectedIndex] == AppTranslations.transportation)...[
              Container(),

            ],
            if(cubit.categories[cubit.selectedIndex] ==AppTranslations.foodBookings)...[
              FoodBookingBody()
            ]
          ],
        ),
      ]);
    });
  }
}