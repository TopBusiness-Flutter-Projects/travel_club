import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/search/cubit/search_cubit.dart';



class CustomBookingSectionSearch extends StatelessWidget {
  CustomBookingSectionSearch({
    super.key,this.index
  });
  int? index;
  @override
  Widget build(BuildContext context) {
    SearchCubit cubit = context.read<SearchCubit>();

    return BlocBuilder<SearchCubit,SearchState >(builder: (BuildContext context, state) {
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


