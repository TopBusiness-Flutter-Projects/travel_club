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

  LodgeDetailsArguments({required this.lodgeId, this.isDeeplink = false});
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
    context.read<ResidenceCubit>().lodgesDetailsModel = GetLodgeDetailModel();
    context
        .read<ResidenceCubit>()
        .getLodgesDetails(context: context, lodgeId: widget.args.lodgeId);
    super.initState();
  }

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
                          CustomSwiper(
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
                          LodgeRatesContainerWithPoints()
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

checkLoggingStatus(BuildContext context, void Function()? onPressed) async {
  print("AppConst.isLogged: ${AppConst.isLogged}");
  if (AppConst.isLogged) {
    if (onPressed != null) {
      onPressed();
    }
  } else {
    await showExitDialog(context);
  }
}

Future<void> showExitDialog(BuildContext context) async {
  AwesomeDialog(
    context: context,
    customHeader: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        ImageAssets.logoImage,
      ),
    ),
    animType: AnimType.topSlide,
    padding: EdgeInsets.all(10.w),
    title: AppTranslations.notLogin,
    btnOkText: AppTranslations.login,
    btnOkOnPress: () {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.loginRoute, (route) => false);
    },
    btnCancelOnPress: () {},
    btnCancelText: AppTranslations.cancel,
  ).show();
}
