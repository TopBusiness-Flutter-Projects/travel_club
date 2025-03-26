import 'package:travel_club/features/residence/view/widgets/details_widgets/custom_details_appbar_row.dart';
import 'package:travel_club/features/residence/view/widgets/details_widgets/custom_swiper.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/food_cubit.dart';
import '../widgets/centr_container_details_food.dart';
import '../widgets/custom_under_swiper.dart';

class DetailsFoodArgs {
  final String id;
  final bool isDeeplink;
  DetailsFoodArgs({
    required this.id,
    this.isDeeplink = false,
  });
}

class DetailsFood extends StatefulWidget {
  const DetailsFood({super.key, required this.args});
  final DetailsFoodArgs args;
  @override
  State<DetailsFood> createState() => _DetailsFoodState();
}

class _DetailsFoodState extends State<DetailsFood> {
  @override
  void initState() {
    context.read<FoodCubit>().getRestaurantDetails(context, id: widget.args.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FoodCubit>();
    return WillPopScope(
      onWillPop: () async {
              widget.args.isDeeplink
                  ? Navigator.pushNamedAndRemoveUntil(
                      context, Routes.mainRoute, (route) => false)
                  : Navigator.pop(context);
              return false;
            },
      child: BlocBuilder<FoodCubit, FoodState>(
        builder: (BuildContext context, state) {
          return SafeArea(
            child: Scaffold(
              body: SizedBox(
                height: getHeightSize(context),
                width: getWidthSize(context),
                child: cubit.getRestaurantDetailsModel?.data == null
                    ? Center(
                        child: CustomLoadingIndicator(),
                      )
                    : Stack(
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
                            child: CustomDetailsAppBar(
                              isFav:
                                  cubit.getRestaurantDetailsModel?.data?.isFav ??
                                      false,
                              id: "${cubit.getRestaurantDetailsModel?.data?.id}",
                              sharedLink:
                                  AppStrings.restaurantShareLink + widget.args.id,
                                    onTap: () {
                                widget.args.isDeeplink
                                    ? Navigator.pushNamedAndRemoveUntil(context,
                                        Routes.mainRoute, (route) => false)
                                    : Navigator.pop(context);
                              },
                            ),
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
      ),
    );
  }
}
