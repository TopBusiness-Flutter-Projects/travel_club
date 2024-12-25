
import '../../../../../core/exports.dart';
import '../../../cubit/food_cubit.dart';
import 'custom_conatiner_in_center.dart';

class ContainerInCenterFood extends StatelessWidget {
  ContainerInCenterFood({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<FoodCubit>();
    return BlocBuilder<FoodCubit, FoodState>(builder: (BuildContext context, state) {
      return    Positioned(
        top: getHeightSize(context) * 0.29, // Adjust position from the top
        left: getWidthSize(context) * 0.05, // Adjust position from the left
        right: getWidthSize(context) * 0.05, // Adjust position from the right
        child: SizedBox(
          height: getHeightSize(context) * 0.50,
          child: Column(
            //النقط
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: cubit.imageUrls.asMap().entries.map((entry) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:cubit.currentIndex == entry.key ? AppColors.white:(AppColors.white)
                            .withOpacity( 0.4)
                    ),
                  );
                }).toList(),
              ),
              CustomContainerFood(),
            ],
          ),
        ),
      );
    },);
  }
}
