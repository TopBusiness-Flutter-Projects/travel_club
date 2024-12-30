import 'package:travel_club/features/entertainment/cubit/entertainment_cubit.dart';

import '../../../../../core/exports.dart';

class CustomServiceContainer extends StatelessWidget {
  const CustomServiceContainer({super.key});

  @override
  Widget build(BuildContext context) {
 return BlocBuilder<EntertainmentCubit, EntertainmentState>(builder: (BuildContext context, state) {    return Padding(
   padding: const EdgeInsets.all(8.0),
   child: CustomContainerWithShadow(child:
   InkWell(
     onTap: (){
       Navigator.pushNamed(context, Routes.bookTableEntermaint);
     },
     child: Padding(
       padding: const EdgeInsets.all(20.0),
       child: Row(
         children: [
           Text(
             "تاجير يخت كامل",
             style: getSemiBoldStyle(
               fontSize: 14.sp,
               color: AppColors.secondPrimary,
             ),
           ),
           Spacer(),
           Text(
             "200"+" "+AppTranslations.currency,
             style: getSemiBoldStyle(
               fontSize: 14.sp,
               color: AppColors.green,
             ),
           ),
         ],
       ),
     ),
   ),),
 ); },);
  }
}
