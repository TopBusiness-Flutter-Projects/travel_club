import 'package:travel_club/features/other_services/cubit/other_services_cubit.dart';
import 'package:travel_club/features/other_services/cubit/other_services_state.dart';
import 'package:travel_club/features/other_services/screens/widgets/custom_in_center_others.dart';
import 'package:travel_club/features/other_services/screens/widgets/custom_under_swiper.dart';
import 'package:travel_club/features/residence/view/widgets/details_widgets/custom_details_appbar_row.dart';
import 'package:travel_club/features/residence/view/widgets/details_widgets/custom_swiper.dart';
import '../../../../../core/exports.dart';
import '../data/models/get_single_service_model.dart';
import '../data/models/sub_services_model.dart';

class ServiceDetailsScreen extends StatefulWidget {
  const ServiceDetailsScreen({super.key,required this.model});
 final SubServicesData model;
  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<OtherServicesCubit>().getSinglelSubServices(id: widget.model.id.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<OtherServicesCubit>();
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
                  SwiperWithAutoplay(
                    images:   cubit.getSingleServiceModel.data?.media??[""],
                  ),

                  // Custom row (back button, favorite, etc.)
                  Positioned(
                    top: 16.0,
                    left: 16.0,
                    right: 16.0,
                    child: CustomDetailsAppBar(),
                  ),
                  // Container under the Swiper
                  ContainerUnderSwiperOtherService(singleServiceData: cubit.getSingleServiceModel.data??SingleServiceData(),),
                  // Centered container in the middle of the image
                  //   ContainerInCenter()
                  // ContainerInCenterEntertainment()
                  ContainerInCenterOthers(model: widget.model,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
