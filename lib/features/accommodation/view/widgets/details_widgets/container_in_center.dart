import 'package:flutter_rating/flutter_rating.dart';

import '../../../../../core/exports.dart';
import '../../../../entertainment/screens/widgets/custom_container_companies.dart';
import '../../../cubit/accomendation_cubit.dart';

class ContainerInCenter extends StatelessWidget {
   ContainerInCenter({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<AccomendationCubit>();
   return BlocBuilder<AccomendationCubit, AccomendationState>(builder: (BuildContext context, state) {
     return    Positioned(
       top: getHeightSize(context) * 0.29, // Adjust position from the top
       left: getWidthSize(context) * 0.05, // Adjust position from the left
       right: getWidthSize(context) * 0.05, // Adjust position from the right
       child: SizedBox(
         height: getHeightSize(context) * 0.50,

         child: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           //النقط
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: cubit.imageUrls.asMap().entries.map((entry) {
                 return Container(
                   width: 10.0,
                   height: 10.0,
                   margin: const EdgeInsets.symmetric(
                       vertical: 8.0, horizontal: 4.0),
                   decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color:cubit.currentIndex == entry.key ? AppColors.white:(AppColors.white)
                           .withOpacity( 0.4)
                   ),
                 );
               }).toList(),
             ),
             CustomContainerCompanies(),
           ],
         ),
       ),
     );
   },);
  }
}
