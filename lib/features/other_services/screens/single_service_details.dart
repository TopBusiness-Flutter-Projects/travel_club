import 'package:travel_club/features/other_services/cubit/other_services_cubit.dart';
import 'package:travel_club/features/other_services/cubit/other_services_state.dart';
import 'package:travel_club/features/other_services/screens/widgets/custom_in_center_others.dart';
import 'package:travel_club/features/other_services/screens/widgets/custom_under_swiper.dart';
import 'package:travel_club/features/residence/view/widgets/details_widgets/custom_appbar_row.dart';
import 'package:travel_club/features/residence/view/widgets/details_widgets/custom_swiper.dart';
import '../../../../../core/exports.dart';
class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherServicesCubit, OtherServicesScreenState>(
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
                             CustomSwiper(images: ["dds"],),

                  // Custom row (back button, favorite, etc.)
                  Positioned(
                    top: 16.0,
                    left: 16.0,
                    right: 16.0,
                    child: CustomRow(),
                  ),

                  // Container under the Swiper
                  ContainerUnderSwiperOtherService(),
                  // Centered container in the middle of the image
                  //   ContainerInCenter()
                  // ContainerInCenterEntertainment()
                  ContainerInCenterOthers()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
