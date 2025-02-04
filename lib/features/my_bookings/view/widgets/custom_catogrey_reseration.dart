import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/payment/cubit/payment_cubit.dart';

import '../../../favourites/cubit/favourites_cubit.dart';
import '../../../home/cubit/home_cubit.dart';
import '../../../home/cubit/home_state.dart';
import '../../../home/data/models/home_model.dart';
import '../../cubit/my_bookings_cubit.dart';

class CustomReservationSection extends StatelessWidget {
  const CustomReservationSection({super.key, this.module,this.isFavouritesScreen=false});
  final ModuleModel? module;
  final bool isFavouritesScreen;
  @override
  Widget build(BuildContext context) {
    MyReservationsCubit cubit = context.read<MyReservationsCubit>();
    FavouritesCubit favouritesCubit = context.read<FavouritesCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        return InkWell(
          onTap: () {
            cubit.selectedModule = module!; // pass the selected module
            print("selected module ${cubit.selectedModule?.name}");
isFavouritesScreen? favouritesCubit.changeModule(module!.id!): cubit.changeModule(module!.id!);
            context.read<PaymentCubit>().currentModuleId = module!.id!;
          },
          child: CustomContainerWithShadow(
            color:isFavouritesScreen?favouritesCubit.selectedModuleId == module!.id?AppColors.primary:AppColors.white  :cubit.selectedModuleId == module!.id
                ? AppColors.primary // Selected color
                : AppColors.white, // Default color
            isShadow: false,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: AutoSizeText(
                module?.name.toString() ?? "",
                maxLines: 1,
                style: TextStyle(
                  color: isFavouritesScreen?favouritesCubit.selectedModuleId == module!.id?AppColors.white:AppColors.secondPrimary  :cubit.selectedModuleId == module!.id
                      ? AppColors.white // Text color for selected
                      : AppColors.secondPrimary, // Text color for default
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
