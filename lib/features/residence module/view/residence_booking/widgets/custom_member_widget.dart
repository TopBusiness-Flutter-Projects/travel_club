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
                width: 27.w, // Define the width for the button
                height: 27.h, // Define the height for the button
                decoration: BoxDecoration(
                  color: Colors.blue, // Set the container background to blue
                  shape: BoxShape.circle, // Set the shape to circle
                ),
                child: Icon(
                  Icons.add,
                  color: Colors
                      .white, // Set icon color to white for better contrast
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(cubit.counter.toString() ?? "",
                style: getRegularStyle(fontSize: 18.sp)),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
              onTap: () {
                cubit.minusCounter();
              },
              child: Container(
                width: 27.w, // Define the width for the button
                height: 27.h, // Define the height for the button
                decoration: BoxDecoration(
                  color: AppColors.grey, // Set the container background to blue
                  shape: BoxShape.circle, // Set the shape to circle
                ),
                child: Icon(
                  Icons.remove,
                  color: Colors
                      .white, // Set icon color to white for better contrast
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
