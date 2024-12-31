
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/accommodation/view/booking_accommodation/screens/widgets/custom_container_booking.dart';
import 'package:travel_club/features/accommodation/view/booking_accommodation/screens/widgets/custom_member_widget.dart';
import 'package:travel_club/features/accommodation/view/booking_accommodation/screens/widgets/custom_rounded_button.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../transportation/cubit/transportation_cubit.dart';
import '../../../../transportation/screens/widgets/custom_from_to_date.dart';
import '../../../cubit/accomendation_cubit.dart';


class AccommodationBooking extends StatefulWidget {
  const AccommodationBooking({super.key});

  @override
  State<AccommodationBooking> createState() => _AccommodationBookingState();
}
class _AccommodationBookingState extends State<AccommodationBooking> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<TransportationCubit>().goOnly=false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<AccomendationCubit>();
   return BlocBuilder<AccomendationCubit,AccomendationState>(builder: (BuildContext context, state) {
     return CustomScreen(
     //   onTapp: (){
     //   Navigator.pushNamed(context, Routes.bestChoosenScreen);
     // },
       isBooking: true,appbarTitle: AppTranslations.booking,
       body:
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: 20.h,),
             //text
             Text(AppTranslations.selectGoingAndReturn,style: getMediumStyle(fontSize: 14.sp),),
             SizedBox(height: 20.h,),
//custom member
             CustomMemberWidget(),
SizedBox(height: 10.h,),
//from and to date
             CustomFromToDate(),
             SizedBox(height: 20.h,),
             Text(AppTranslations.chooseTheBestOption,style: getMediumStyle(fontSize: 14.sp),),
             //custom contanier
             Expanded(
               child: ListView.builder(
                 shrinkWrap: true,
                 itemCount: 4,
                 itemBuilder: (BuildContext context, int index) {
                   return CustomContainerBooking(widgetBottom:  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("السعر ل ٤ ليالي",style: getRegularStyle(fontSize: 14.sp,color: AppColors.grey),),
                           Text("5000 جنيه مصري",style: getSemiBoldStyle(fontSize: 16.sp,color: AppColors.primary),),
                           Text(AppTranslations.withoutTax,style: getRegularStyle(fontSize: 12.sp,color:AppColors.grey ),),
                         ],),
                       CustomRoundedButton(
                         isBooking: true,icon:cubit.isAdded==true? Icons.add:Icons.remove,title:cubit.isAdded==true? "اضف":"احذف",onTap: (){

                         cubit.addedOrRemove();
                         print("is added"+cubit.isAdded.toString()??"");
                         //       Navigator.pushNamed(context, Routes.secondBookingAccommodation);
                       },)                          ],),);
                 },
               ),
             ),
           ],
         ),

       ),
       widget: CustomContainerWithShadow(
           height: 74.h,
           child:
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Text("5000",style: getSemiBoldStyle(fontSize: 16.sp),),

               CustomButton(title: AppTranslations.bookNow,width: 179.w,onTap: (){
                 Navigator.pushNamed(context, Routes.bestChoosenScreen);
               },)
             ],)),
     );
   },);
  }
}
