import 'package:travel_club/features/entertainment/screens/details_of_entertainment/widgets/custom_under_swiper.dart';
import 'package:travel_club/features/residence/view/widgets/details_widgets/custom_details_appbar_row.dart';
import 'package:travel_club/features/residence/view/widgets/details_widgets/custom_swiper.dart';
import '../../../../../core/exports.dart';
import '../../../cubit/entertainment_cubit.dart';
import '../widgets/container_in_center.dart';

class DetailsEntertainment extends StatefulWidget {
  const DetailsEntertainment({super.key,required this.id});
final String id;
  @override
  State<DetailsEntertainment> createState() => _DetailsEntertainmentState();
}

class _DetailsEntertainmentState extends State<DetailsEntertainment> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<EntertainmentCubit>().getOrginizationDetails(id: widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<EntertainmentCubit>();
    return BlocBuilder<EntertainmentCubit, EntertainmentState>(
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
                  SwiperWithAutoplay(
                  images: cubit.getOrganizationsDetailsModel?.data?.media?.map((e) => e.image??"").toList()??[""],
                  ),
                  // Custom row (back button, favorite, etc.)
                  Positioned(
                    top: 16.0,
                    left: 16.0,
                    right: 16.0,
                    child: CustomDetailsAppBar(lodgeId: widget.id,),
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
        );
      },
    );
  }
}
