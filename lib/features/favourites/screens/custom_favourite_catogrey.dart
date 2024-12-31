import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/favourites/cubit/favourites_cubit.dart';
import 'package:travel_club/features/favourites/cubit/favourites_state.dart';



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
            padding: const EdgeInsets.only(right: 30.0,left: 30.0),
            child: Center(
              child: Text(
                cubit. categories[index!],
                style: TextStyle(
                  color: cubit.selectedIndex == index
                      ? AppColors.white
                      : AppColors.secondPrimary,
                ),
              ),
            ),
          ),
        ),
      ); },);
  }
}


