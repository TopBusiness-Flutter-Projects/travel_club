import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/services.dart';
import 'package:travel_club/features/residence/data/models/lodge_details_model.dart';
import 'package:travel_club/features/residence/view/widgets/details_widgets/custom_lodge_rates.dart';
import 'package:travel_club/features/residence/view/widgets/details_widgets/custom_lodge_body.dart';
import 'package:travel_club/features/residence/view/widgets/details_widgets/custom_details_appbar_row.dart';
import 'package:travel_club/features/residence/view/widgets/details_widgets/custom_swiper.dart';
import '../../../../core/exports.dart';
import '../../cubit/residence_cubit.dart';

class LodgeDetailsArguments {
  final int lodgeId;
  final bool isDeeplink;
  final bool isFav;

  LodgeDetailsArguments(
      {required this.lodgeId, this.isDeeplink = false, this.isFav = false});
}

class LodgeDetailsScreen extends StatefulWidget {
  const LodgeDetailsScreen({super.key, required this.args});
  final LodgeDetailsArguments args;
  @override
  State<LodgeDetailsScreen> createState() => _LodgeDetailsScreenState();
}

class _LodgeDetailsScreenState extends State<LodgeDetailsScreen> {
  @override
  void initState() {
    // context.read<ResidenceCubit>().isPageActive=true;
    context.read<ResidenceCubit>().lodgesDetailsModel = GetLodgeDetailModel();
    context
        .read<ResidenceCubit>()
        .getLodgesDetails(context: context, lodgeId: widget.args.lodgeId);
    super.initState();
  }

  @override
//   void dispose() {
//   context.read<ResidenceCubit>().isPageActive=false;
//   context.read<ResidenceCubit>().swiperController .dispose();
//   context.read<ResidenceCubit>().swiperController.stopAutoplay();
// }
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ResidenceCubit>();
    return BlocBuilder<ResidenceCubit, ResidenceState>(
        builder: (context, state) {
      return SafeArea(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: AppColors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: WillPopScope(
            // عشان وهوه راجع لو جاي من دييب لينك هيرجع  ع الmain مش الsplach
            onWillPop: () async {
              widget.args.isDeeplink
                  ? Navigator.pushNamedAndRemoveUntil(
                      context, Routes.mainRoute, (route) => false)
                  : Navigator.pop(context);
              return false;
            },
            child: Scaffold(
              body: SizedBox(
                height: getHeightSize(context),
                width: getWidthSize(context),
                child: cubit.lodgesDetailsModel.data == null
                    ? const Center(
                        child: CustomLoadingIndicator(),
                      )
                    : Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          // Swiper for images
                          SwiperWithAutoplay(
                            images: cubit.lodgesDetailsModel.data!.media!
                                .map((element) => element.image ?? "")
                                .toList(),
                          ),
                          // Custom row (back button, favorite, etc.)
                          Positioned(
                            top: 16.0,
                            left: 16.0,
                            right: 16.0,
                            child: CustomDetailsAppBar(
                              isFav:
                                  cubit.lodgesDetailsModel.data?.isFav ?? false,
                              id: widget.args.lodgeId.toString(),
                              sharedLink: AppStrings.lodgeShareLink +
                                  cubit.lodgesDetailsModel.data!.id.toString(),
                              onTap: () {
                                
                                widget.args.isDeeplink
                                    ? Navigator.pushNamedAndRemoveUntil(context,
                                        Routes.mainRoute, (route) => false)
                                    : Navigator.pop(context);
                              },
                            ),
                          ),
                          // Container under the Swiper
                          const LodgeDetailsBody(),
                          // Centered container in the middle of the image
                          const LodgeRatesContainerWithPoints()
                        ],
                      ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
