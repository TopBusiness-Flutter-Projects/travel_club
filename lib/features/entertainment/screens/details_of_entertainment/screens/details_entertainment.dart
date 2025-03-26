import 'package:travel_club/features/entertainment/screens/details_of_entertainment/widgets/custom_under_swiper.dart';
import 'package:travel_club/features/residence/view/widgets/details_widgets/custom_details_appbar_row.dart';
import 'package:travel_club/features/residence/view/widgets/details_widgets/custom_swiper.dart';
import '../../../../../core/exports.dart';
import '../../../cubit/entertainment_cubit.dart';
import '../../../data/model/get_orginization_model.dart';
import '../widgets/container_in_center.dart';

class EntertainmentDetailsArgs {
  final int id;
  final bool isDeeplink;
  EntertainmentDetailsArgs({
    required this.id,
    this.isDeeplink = false,
  });
}

class DetailsEntertainment extends StatefulWidget {
  const DetailsEntertainment({super.key, required this.args});
  final EntertainmentDetailsArgs args;
  @override
  State<DetailsEntertainment> createState() => _DetailsEntertainmentState();
}

class _DetailsEntertainmentState extends State<DetailsEntertainment> {
  @override
  void initState() {
    // TODO: implement initState
    context
        .read<EntertainmentCubit>()
        .getOrginizationDetails(id: widget.args.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<EntertainmentCubit>();
    return BlocBuilder<EntertainmentCubit, EntertainmentState>(
      builder: (BuildContext context, state) {
        return SafeArea(
          child: Scaffold(
            body: cubit.getOrganizationsDetailsModel?.data == null
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
                          images: cubit
                                  .getOrganizationsDetailsModel?.data?.media
                                  ?.map((e) => e.image ?? "")
                                  .toList() ??
                              [""],
                        ),
                        // Custom row (back button, favorite, etc.)
                        Positioned(
                          top: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: CustomDetailsAppBar(
                            id: widget.args.id.toString(),
                          ),
                        ),
                        ContainerUnderSwiperEntertainment(),
                        ContainerInCenterEntertainment(
                          isDetails: true,
                          orginizationData: OrginizationData(
                            name: cubit
                                    .getOrganizationsDetailsModel?.data?.name ??
                                "",
                            logo: cubit
                                    .getOrganizationsDetailsModel?.data?.logo ??
                                "",
                            isFav: cubit.getOrganizationsDetailsModel?.data
                                    ?.isFav ??
                                false,
                            rate: cubit
                                    .getOrganizationsDetailsModel?.data?.rate ??
                                0,
                            users: cubit.getOrganizationsDetailsModel?.data
                                    ?.users ??
                                0,

                            // about: cubit.getOrganizationsDetailsModel?.data?.about ?? "",
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
