import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/home/cubit/home_cubit.dart';
import 'package:travel_club/features/home/cubit/home_state.dart';

import '../../data/models/home_model.dart';



class CustomBookingSectionSearch extends StatelessWidget {
  CustomBookingSectionSearch({
    super.key,this.index,
    required this.categoryModel,
    this.onTap,
    this.islast = false,
  });
  final ModuleModel categoryModel;
  final bool islast;
  final void Function()? onTap;
  int? index;
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();

    return BlocBuilder<HomeCubit,HomeState >(builder: (BuildContext context, state) {
      return GestureDetector(
        onTap: () {
          print("change index ${categoryModel.type}");
          cubit.changeContainer(categoryModel.type!,context);
        },
        child: CustomContainerWithShadow(
          color: cubit.selectedIndex ==
              categoryModel.type? AppColors.primary // Selected color
              : AppColors.white,  // Default color
          isShadow: false,
          child: Padding(
            padding: const EdgeInsets.only(right: 30.0,left: 30.0),
            child: Center(
              child: Text(
                categoryModel.name.toString()??"",
                style: TextStyle(
                  color: cubit.selectedIndex ==
                      categoryModel.type
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


