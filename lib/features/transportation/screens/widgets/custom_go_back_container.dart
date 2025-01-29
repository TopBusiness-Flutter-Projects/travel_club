import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_state.dart';

class CustomGoBackContainer extends StatelessWidget {
  const CustomGoBackContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TransportationCubit cubit = context.read<TransportationCubit>();
    return BlocBuilder<TransportationCubit, TransportationState>(
        builder: (context, state) {
      return CustomContainerWithShadow(
          child: Row(children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              cubit.changeGoOnly(true); // isGoOnly
            },
            child: Container(
                decoration: BoxDecoration(
                  color: cubit.isGoOnly ? AppColors.primary : AppColors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Text(
                      AppTranslations.goOnly,
                      style: getMediumStyle(
                          color:
                              cubit.isGoOnly ? AppColors.white : AppColors.grey,
                          fontSize: 14.sp),
                    ),
                  ),
                )),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              cubit.changeGoOnly(false); // isGoOnly
            },
            child: Container(
                decoration: BoxDecoration(
                  color: !cubit.isGoOnly ? AppColors.primary : AppColors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Text(
                      AppTranslations.goAndBack,
                      style: getMediumStyle(
                          color: !cubit.isGoOnly
                              ? AppColors.white
                              : AppColors.grey,
                          fontSize: 14.sp),
                    ),
                  ),
                )),
          ),
        )
      ]));
    });
  }
}
