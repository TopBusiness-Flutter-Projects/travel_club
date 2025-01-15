import 'package:flutter/services.dart';

import '../../../../core/exports.dart';
import '../../cubit/accomendation_cubit.dart';
import '../widgets/details_widgets/container_in_center.dart';
import '../widgets/details_widgets/container_under_swiper.dart';
import '../widgets/details_widgets/custom_appbar_row.dart';
import '../widgets/details_widgets/custom_swiper.dart';

class DetailsAccommendation extends StatefulWidget {
  const DetailsAccommendation({super.key, required this.id});
final int? id;
  @override
  State<DetailsAccommendation> createState() => _DetailsAccommendationState();
}

class _DetailsAccommendationState extends State<DetailsAccommendation> {
  @override
  void initState() {
    // TODO: implement initState
     context.read<AccomendationCubit>().getLodgesDetails(context: context,id: widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AccomendationCubit>();
    return BlocBuilder<AccomendationCubit, AccomendationState>(
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
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // Swiper for images
                  CustomSwiper(),
                  // Custom row (back button, favorite, etc.)
                  Positioned(
                    top: 16.0,
                    left: 16.0,
                    right: 16.0,
                    child: CustomRow(),
                  ),

                  // Container under the Swiper
                  ContainerUnderSwiper(),
                  // Centered container in the middle of the image
                  ContainerInCenter()
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
