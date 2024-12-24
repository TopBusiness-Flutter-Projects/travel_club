import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/favourites/cubit/favourites_cubit.dart';
import 'package:travel_club/features/favourites/cubit/favourites_state.dart';
import '../../my_bookings/cubit/my_bookings_cubit.dart';
import '../../my_bookings/cubit/my_bookings_state.dart';


class CustomBookingSectionFavourite extends StatelessWidget {
  CustomBookingSectionFavourite({
    super.key,this.index
  });
  int? index;
  @override
  Widget build(BuildContext context) {
    FavouritesCubit cubit = context.read<FavouritesCubit>();

    return BlocBuilder<FavouritesCubit,FavouritesState >(builder: (BuildContext context, state) {
      return GestureDetector(
        onTap: () {
          cubit.changeContainer(index!);
        },
        child: CustomContainerWithShadow(
          color: cubit.selectedIndex == index
              ? AppColors.primary // Selected color
              : AppColors.white,  // Default color
          isShadow: false,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              cubit. categories[index!],
              style: TextStyle(
                color: cubit.selectedIndex == index
                    ? AppColors.white  // Text color for selected
                    : AppColors.secondPrimary, // Text color for default
              ),
            ),
          ),
        ),
      ); },);
  }
}

