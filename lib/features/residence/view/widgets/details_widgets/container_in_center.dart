import 'package:travel_club/features/residence/cubit/residence_cubit.dart';

import '../../../../../core/exports.dart';
import 'custom_rating_incenter.dart';

class ContainerInCenter extends StatelessWidget {
   const ContainerInCenter({super.key, required this.imageUrls, required this.rating, required this.users, this.onPressed});
final List <String> imageUrls ;
  final double rating;
  final String users;
final  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<ResidenceCubit>();
   return BlocBuilder<ResidenceCubit, ResidenceState>(builder: (BuildContext context, state) {
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
               children: imageUrls.asMap().entries.map((entry) {
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
           //  CustomContainerCompanies()
             CustomRatingIncenter(
              rating: rating,
              users: users,
              onPressed: onPressed,
             )
           ],


         ),
       ),
     );
   },);
  }
}
