import 'package:travel_club/features/my_bookings/cubit/my_bookings_state.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/my_bookings_cubit.dart';
import '../../../data/models/food_reservation_details.dart';

class MemberDetails extends StatelessWidget {
  const MemberDetails({super.key,required this.foodReservationDetails,required this.date});
 final FoodReservationDetails foodReservationDetails;
 final String date;
  @override
  Widget build(BuildContext context) {
   return BlocBuilder<MyReservationsCubit,MyReservationsState>(builder: (BuildContext context, state) {
     return Padding(
     padding: const EdgeInsets.all(8.0),
     child: CustomContainerWithShadow(
         child: Padding(
           padding: const EdgeInsets.all(10.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Column(children: [
                 Text(AppTranslations.numberOfMembers,style: getRegularStyle(fontSize: 14.sp,color: AppColors.grey),),
                 SizedBox(height: 5.h,),
                 Text(foodReservationDetails.clientCount.toString()+AppTranslations.members,style: getMediumStyle(fontSize: 14.sp),),
                 SizedBox(height: 30.h,),
                 Text(AppTranslations.callPhone,style: getRegularStyle(fontSize: 14.sp,color: AppColors.grey),),
                 SizedBox(height: 5.h,),

                 Text(foodReservationDetails.userPhone.toString(),style: getMediumStyle(fontSize: 14.sp),),
                 SizedBox(height: 10.h,)

               ],),
               Column(children: [
                 Text(AppTranslations.bookAppointment,style: getRegularStyle(fontSize: 14.sp,color: AppColors.grey),),
                 SizedBox(height: 5.h,),
                 Row(
                   children: [
                     SvgPicture.asset(AppIcons.calendar,color: AppColors.primary,),
                     Text(date.toString(),style: getMediumStyle(fontSize: 14.sp,color: AppColors.primary),),
                   ],
                 ),
                 SizedBox(height: 30.h,),
                 Text(AppTranslations.nameOwner,style: getRegularStyle(fontSize: 14.sp,color: AppColors.grey),),
                 SizedBox(height: 5.h,),

                 Text(foodReservationDetails.userName.toString(),style: getMediumStyle(fontSize: 14.sp),),
                 SizedBox(height: 10.h,)
               ],)],),
         )),
   );
     },);
  }
}
