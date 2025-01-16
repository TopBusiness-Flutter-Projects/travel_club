import 'package:flutter/services.dart';
import 'package:travel_club/features/residence%20module/data/models/getlodge_details.dart';

import '../../../../core/exports.dart';
import '../../cubit/residence_cubit.dart';
import '../widgets/details/container_in_center.dart';
import '../widgets/details/container_under_swiper.dart';
import '../widgets/details/custom_appbar_row.dart';
import '../widgets/details/custom_swiper.dart';

class ResidenceDetails extends StatefulWidget {
  const ResidenceDetails({super.key, required this.id});
  final int id;
  @override
  State<ResidenceDetails> createState() => _ResidenceDetailsState();
}

class _ResidenceDetailsState extends State<ResidenceDetails> {
  @override
  void initState() {
    context.read<ResidenceCubit>().lodgesDetailsModel = GetLodgeDetail();
    context
        .read<ResidenceCubit>()
        .getLodgesDetails(context: context, id: widget.id);
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
                          child: CustomRow(
                            sharedLink: AppStrings.lodgeShareLink +
                                cubit.lodgesDetailsModel.data!.id.toString(),
                          ),
                        ),
                        // Container under the Swiper
                        const ContainerUnderSwiper(),
                        // Centered container in the middle of the image
                        ContainerInCenter(
                          imageUrls: cubit.lodgesDetailsModel.data!.media!
                              .map((element) => element.image ?? "")
                              .toList(),
                          rating: (cubit.lodgesDetailsModel.data!.rate ?? 0)
                              .toDouble(),
                          users: (cubit.lodgesDetailsModel.data!.users ?? 0)
                              .toString(),
                          onPressed: () {},
                        )
                      ],
                    ),
            ),
          ),
        ),
      );
    });
  }
}
