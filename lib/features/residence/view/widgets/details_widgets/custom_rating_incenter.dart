// import 'package:flutter_rating/flutter_rating.dart';
// import '../../../../../core/exports.dart';

// class CustomContainer extends StatelessWidget {
//   const CustomContainer(
//       {super.key, required this.rating, required this.users, this.onPressed});
//   final double rating;
//   final String users;
//   final void Function()? onPressed;
//   @override
//   Widget build(BuildContext context) {
//     return CustomContainerWithShadow(
//       height: getHeightSize(context) * 0.12,
    
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           AutoSizeText(
           
//              cubit.lodgesDetailsModel.data?.name ?? '',
//             maxLines: 1,
//             textAlign: TextAlign.center,
//             style: getSemiBoldStyle(
//               color: AppColors.secondPrimary,
//               fontSize: 14.sp,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 children: [
//                   Row(
//                     children: [
//                       StarRating(
//                         rating: 0,
//                         allowHalfRating: false,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   AutoSizeText(
//                     ' $users${AppTranslations.personRating}',
//                     style: getUnderLine(
//                       color: AppColors.primary,
//                       fontSize: 12.sp,
//                     ),
//                   )
//                 ],
//               ),
//               //     Spacer(),
//               ElevatedButton(
//                 onPressed: onPressed,
//                 child: Text(
//                   AppTranslations.bookNow,
//                   style:
//                       getSemiBoldStyle(color: AppColors.white, fontSize: 14.sp),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.primary),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
