import 'package:travel_club/core/exports.dart';

import '../../cubit/my_bookings_cubit.dart';
import '../../cubit/my_bookings_state.dart';

class CustomBookingSection extends StatelessWidget {
   CustomBookingSection({
    super.key,this.index
  });
  int? index;
  @override
  Widget build(BuildContext context) {
    MyBookingsCubit cubit = context.read<MyBookingsCubit>();

    return BlocBuilder<MyBookingsCubit,MyBookingsState >(builder: (BuildContext context, state) {
      return InkWell(
      onTap: () {
        cubit.changeContainer(index!);
      },
      child: CustomContainerWithShadow(
        color: cubit.selcetedIndex == index
            ? AppColors.primary // Selected color
            : AppColors.white,  // Default color
        isShadow: false,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            cubit. Catogries[index!],
            style: TextStyle(
              color: cubit.selcetedIndex == index
                  ? AppColors.white  // Text color for selected
                  : AppColors.secondPrimary, // Text color for default
            ),
          ),
        ),
      ),
    ); },);
  }
}


