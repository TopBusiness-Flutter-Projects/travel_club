import 'package:travel_club/features/other_services/cubit/other_services_cubit.dart';
import 'package:travel_club/features/other_services/cubit/other_services_state.dart';
import 'package:travel_club/features/other_services/screens/widgets/custom_in_center_others.dart';
import 'package:travel_club/features/other_services/screens/widgets/custom_under_swiper.dart';
import 'package:travel_club/features/residence/view/widgets/details_widgets/custom_details_appbar_row.dart';
import 'package:travel_club/features/residence/view/widgets/details_widgets/custom_swiper.dart';
import '../../../../../core/exports.dart';
import '../data/models/get_single_service_model.dart';
import '../data/models/sub_services_model.dart';

class ServicesDetailsArguments {
  final int id;
  final bool isDeeplink;

  ServicesDetailsArguments({
    required this.id,
    this.isDeeplink = false,
  });
}

class ServiceDetailsScreen extends StatefulWidget {
  const ServiceDetailsScreen({super.key, required this.args});
  final ServicesDetailsArguments args;
  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  @override
  void initState() {
    context
        .read<OtherServicesCubit>()
        .getSinglelSubServices(id: widget.args.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<OtherServicesCubit>();
    return BlocBuilder<OtherServicesCubit, OtherServicesScreenState>(
      builder: (BuildContext context, state) {
        return WillPopScope(
          onWillPop: () async {
            widget.args.isDeeplink
                ? Navigator.pushNamedAndRemoveUntil(
                    context, Routes.mainRoute, (route) => false)
                : Navigator.pop(context);
            return false;
          },
          child: SafeArea(
            child: Scaffold(
              body: cubit.getSingleServiceModel.data == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      height: getHeightSize(context),
                      width: getWidthSize(context),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          // Swiper for images
                          SwiperWithAutoplay(
                            images:
                                cubit.getSingleServiceModel.data?.media ?? [],
                          ),

                          // Custom row (back button, favorite, etc.)
                          Positioned(
                            top: 16.0,
                            left: 16.0,
                            right: 16.0,
                            child: CustomDetailsAppBar(
                              isFav: cubit.getSingleServiceModel.data?.isFav ??
                                  false,
                              id: "${widget.args.id}",
                              sharedLink: AppStrings.otherServiceShareLink +
                                  widget.args.id.toString(),
                              onTap: () {
                                widget.args.isDeeplink
                                    ? Navigator.pushNamedAndRemoveUntil(context,
                                        Routes.mainRoute, (route) => false)
                                    : Navigator.pop(context);
                              },
                            ),
                          ),
                          ContainerUnderSwiperOtherService(
                            singleServiceData:
                                cubit.getSingleServiceModel.data ??
                                    SingleServiceData(),
                          ),
                          ContainerInCenterOthers(
                            model: SubServicesData(
                              id: widget.args.id,
                              title: cubit.getSingleServiceModel.data?.title,
                              isFav: cubit.getSingleServiceModel.data?.isFav,
                              rate: cubit.getSingleServiceModel.data?.rate,
                              users: cubit.getSingleServiceModel.data?.users,
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
