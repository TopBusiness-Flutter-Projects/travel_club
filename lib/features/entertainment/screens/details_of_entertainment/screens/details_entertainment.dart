import 'package:travel_club/features/entertainment/screens/details_of_entertainment/widgets/custom_under_swiper.dart';
import '../../../../../core/exports.dart';
import '../../../../accommodation/view/widgets/details_widgets/custom_appbar_row.dart';
import '../../../../accommodation/view/widgets/details_widgets/custom_swiper.dart';
import '../../../cubit/entertainment_cubit.dart';
import '../widgets/container_in_center.dart';

class DetailsEntertainment extends StatelessWidget {
  const DetailsEntertainment({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntertainmentCubit,EntertainmentState>(builder: (BuildContext context, state) { return SafeArea(
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
              ContainerUnderSwiperEntertainment(),
              // Centered container in the middle of the image
           //   ContainerInCenter()
              ContainerInCenterEntertainment()
            ],
          ),
        ),
      ),
    ); },);
  }
}
