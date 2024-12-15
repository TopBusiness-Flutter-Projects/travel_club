import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_rating/flutter_rating.dart';
import '../../../../core/exports.dart';
import '../../cubit/details_accomendation_cubit.dart';
import '../widgets/container_in_center.dart';
import '../widgets/container_under_swiper.dart';
import '../widgets/custom_appbar_row.dart';
import '../widgets/custom_swiper.dart';

class DetailsAccommendation extends StatelessWidget {
  const DetailsAccommendation({super.key});

  @override
  Widget build(BuildContext context) {

   return BlocBuilder<DetailsAccomendationCubit, DetailsAccomendationState>(builder: (context, state) {
     return SafeArea(
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
     );
   });
  }
}
