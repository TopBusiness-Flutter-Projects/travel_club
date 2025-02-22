import 'package:travel_club/features/residence/view/widgets/details_widgets/custom_details_appbar_row.dart';
import 'package:travel_club/features/residence/view/widgets/details_widgets/custom_swiper.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/food_cubit.dart';
import '../widgets/centr_container_details_food.dart';
import '../widgets/custom_under_swiper.dart';

class DetailsFood extends StatefulWidget {
  const DetailsFood({super.key, required this.id});
  final String id;
  @override
  State<DetailsFood> createState() => _DetailsFoodState();
}

class _DetailsFoodState extends State<DetailsFood> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<FoodCubit>().getRestaurantDetails(id: widget.id);
    context.read<FoodCubit>().getMenuCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FoodCubit>();
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (BuildContext context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              height: getHeightSize(context),
              width: getWidthSize(context),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // Swiper for images
                  SwiperWithAutoplay(images: [
                    cubit.getRestaurantDetailsModel?.data?.media ?? ""
                  ]),
                  // Custom row (back button, favorite, etc.)
                  Positioned(
                    top: 16.0,
                    left: 16.0,
                    right: 16.0,
                    child: CustomDetailsAppBar(),
                  ),
                  // Container under the Swiper
                  ContainerUnderSwiperFood(),
                  // Centered container in the middle of the image
                  ContainerInCenterFood()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
