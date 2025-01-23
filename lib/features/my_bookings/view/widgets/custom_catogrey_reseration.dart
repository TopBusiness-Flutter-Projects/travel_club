import 'package:travel_club/core/exports.dart';

import '../../cubit/my_bookings_cubit.dart';
import '../../cubit/my_bookings_state.dart';

class CustomReservationSection extends StatelessWidget {
  CustomReservationSection({super.key, this.index});
  int? index;
  @override
  Widget build(BuildContext context) {
    MyReservationsCubit cubit = context.read<MyReservationsCubit>();

    return BlocBuilder<MyReservationsCubit, MyReservationsState>(
      builder: (BuildContext context, state) {
        return GestureDetector(
          onTap: () {
            cubit.changeContainer(index!);
          },
          child: CustomContainerWithShadow(
            color: cubit.selectedIndex == index
                ? AppColors.primary // Selected color
                : AppColors.white, // Default color
            isShadow: false,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                cubit.categories[index!],
                style: TextStyle(
                  color: cubit.selectedIndex == index
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
