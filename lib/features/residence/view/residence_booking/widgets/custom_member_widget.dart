import '../../../../../core/exports.dart';
import '../../../cubit/residence_cubit.dart';

class CustomMemberWidget extends StatelessWidget {
  const CustomMemberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ResidenceCubit>();
    return BlocBuilder<ResidenceCubit, ResidenceState>(
      builder: (BuildContext context, state) {
        return Row(
          children: [
            Text(
              AppTranslations.numberOfMembers,
              style: getMediumStyle(fontSize: 14.sp),
            ),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
              onTap: () {
                cubit.plusCounter();
              },
              child: Container(
                width: 27.w,
                height: 27.w,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(cubit.counter.toString(),
                style: getRegularStyle(fontSize: 18.sp)),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
              onTap: () {
                cubit.minusCounter();
              },
              child: Container(
                width: 27.w,
                height: 27.w,
                decoration: BoxDecoration(
                  color:
                      cubit.counter == 1 ? AppColors.grey : AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.remove,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
