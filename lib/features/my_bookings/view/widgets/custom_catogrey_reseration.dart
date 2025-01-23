import 'package:travel_club/core/exports.dart';

import '../../../home/cubit/home_cubit.dart';
import '../../../home/cubit/home_state.dart';
import '../../../home/data/models/home_model.dart';
import '../../cubit/my_bookings_cubit.dart';
import '../../cubit/my_bookings_state.dart';

class CustomReservationSection extends StatelessWidget {
  const CustomReservationSection({super.key, this.module});
final  Module? module;
  @override
  Widget build(BuildContext context) {
    MyReservationsCubit cubit = context.read<MyReservationsCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        return InkWell(
          onTap: () {
            print("idddddddddddd");
          print(module?.id.toString());
            cubit.changeContainer(module!.id!);
            if(module?.id==1){
                  cubit.getMyBookingReservation();
            }
          },
          child: CustomContainerWithShadow(
            color: cubit.selectedIndex ==module!.id
                ? AppColors.primary // Selected color
                : AppColors.white, // Default color
            isShadow: false,

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: AutoSizeText(
               module?.name.toString()??"",
                maxLines: 1,
                style: TextStyle(
                  color: cubit.selectedIndex ==module!.id
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
