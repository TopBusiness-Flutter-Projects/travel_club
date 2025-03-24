import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/my_bookings_cubit.dart';
import '../../../cubit/my_bookings_state.dart';
import '../../../data/models/get_entertainment_details_reserv.dart';
import '../../../data/models/get_entertainment_reservation_model.dart';

class MemberDetailsEntertainment extends StatelessWidget {
  const MemberDetailsEntertainment({super.key,required this.reservationEntertainment});
 final EntertainmentData reservationEntertainment ;
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(children: [
                if(reservationEntertainment.clientCount!=null)...[
                  Text(AppTranslations.numberOfMembers,style: getRegularStyle(fontSize: 14.sp,color: AppColors.grey),),
                  SizedBox(height: 5.h,),
                  Text(reservationEntertainment.clientCount.toString()+AppTranslations.members,style: getMediumStyle(fontSize: 14.sp),),
                  SizedBox(height: 30.h,),
                ],


                if(reservationEntertainment.userPhone!=null)...[
                  Text(AppTranslations.callPhone,style: getRegularStyle(fontSize: 14.sp,color: AppColors.grey),),
                  SizedBox(height: 5.h,),
                  Text(reservationEntertainment.userPhone.toString(),style: getMediumStyle(fontSize: 14.sp),),

                ],
                SizedBox(height: 10.h,)

              ],),
              Column(children: [
                if(reservationEntertainment.date!=null)...[
                  Text(AppTranslations.bookAppointment,style: getRegularStyle(fontSize: 14.sp,color: AppColors.grey),),
                  SizedBox(height: 5.h,),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.calendar,color: AppColors.primary,),
                      Text(
                        DateFormat('yyyy-MM-dd',"en").format(reservationEntertainment.date!),
                        style: getMediumStyle(fontSize: 14.sp, color: AppColors.primary),
                      ),                    ],
                  ),
                  SizedBox(height: 30.h,),
                ],

                if(reservationEntertainment.userName!=null)...[
                  Text(AppTranslations.nameOwner,style: getRegularStyle(fontSize: 14.sp,color: AppColors.grey),),
                  SizedBox(height: 5.h,),

                  Text(reservationEntertainment.userName.toString(),style: getMediumStyle(fontSize: 14.sp),),
                  SizedBox(height: 10.h,)
                ]

              ],)],),
        )),
  ); },);
  }
}
