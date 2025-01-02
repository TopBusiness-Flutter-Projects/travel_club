import 'package:travel_club/features/accommodation/cubit/accomendation_cubit.dart';
import 'package:travel_club/features/accommodation/view/booking_accommodation/screens/widgets/custom_container_booking.dart';
import 'package:travel_club/features/accommodation/view/booking_accommodation/screens/widgets/custom_rounded_button.dart';

import '../../../../../core/exports.dart';
import '../../../../../core/widgets/custom_button.dart';

class BestChoosenScreen extends StatelessWidget {
  const BestChoosenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<AccomendationCubit>();
   return BlocBuilder<AccomendationCubit, AccomendationState>(builder: (BuildContext context, state) { return   CustomScreen(
       isBooking: true,
       widget: CustomContainerWithShadow(
           height: 74.h,
           child:
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               GestureDetector(
              onTap:(){
                Navigator.pushNamed(context, Routes.secondBookingAccommodation);
             },
                   child: Text(AppTranslations.skip,style: getSemiBoldStyle(fontSize: 16.sp),)),

               CustomButton(title: AppTranslations.next,width: 179.w,onTap: (){
                 Navigator.pushNamed(context, Routes.secondBookingAccommodation);
               },)
             ],)),
       appbarTitle: AppTranslations.bestChoosen,
     body: Column( // Ensure there is a Column or similar widget here
       children: [
         Expanded( // This should be directly inside a Column, Row, or Flex
           child: ListView.builder(
             shrinkWrap: true,
             itemBuilder: (BuildContext context, int index) {
               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 10.h),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text(AppTranslations.yourChoose, style: getMediumStyle(fontSize: 14.sp)),
                     ),
                     CustomContainerBooking(widgetBottom: SizedBox()),
                     SizedBox(height: 10.h),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text(AppTranslations.favoriteChoice, style: getMediumStyle(fontSize: 14.sp)),
                     ),
                     Center(
                       child: CustomContainerBooking(
                         widgetBottom: GestureDetector(
                           onTap: () {
                             cubit.changeChoice();
                           },
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: CustomRoundedButton(
                               width: double.infinity,
                               title: cubit.choice == true ? AppTranslations.chooseDone : AppTranslations.changeChoice,
                             ),
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
               );
             },
           ),
         ),
       ],
     ),
   ); },);
  }
}
