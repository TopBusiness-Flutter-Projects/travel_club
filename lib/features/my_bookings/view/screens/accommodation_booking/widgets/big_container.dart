//big conatiner
import 'package:travel_club/features/my_bookings/view/screens/accommodation_booking/widgets/small_container.dart';

import '../../../../../../core/exports.dart';
import '../../../../../accommodation/view/widgets/acommendation_widgets/accomendation_rating.dart';
import 'custom_booking_accommodation_body.dart';

class CustomBookingAccommodationContainerBig extends StatelessWidget {
  const CustomBookingAccommodationContainerBig({super.key});

  @override
  Widget build(BuildContext context) {
    return      Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomContainerWithShadow(
          child: Column(
            children: [
              //custom container
              CustomBookingAccommodationContainerSmall(hotelsModel: HotelsModel(title: "title", rate: 4, isFavorite: false ,image:   "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",),),
              //Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        children: [
                          Text(AppTranslations.numberBooking,style: getRegularStyle(color: AppColors.grey),),
                          SizedBox(height: 5.h,),
                          Text("6365467858",style: getMediumStyle(),),
                          SizedBox(height: 5.h,),
                          CustomContainerWithShadow(reduis: 7,isShadow: false,color: AppColors.green.withOpacity(.12),width: 100.w,child:Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 7),
                            child: Center(child: Text(AppTranslations.bookingSuccess,style: getMediumStyle(fontSize: 14.sp,color: AppColors.green),maxLines: 1,)),
                          ) ,) ,
                          SizedBox(height: 5.h,),

                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        children: [
                          SizedBox(height: 5.h,),

                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.calendar,color: AppColors.secondPrimary,),
                              Text("٢٠ يناير ٢٠٢٢",style: getRegularStyle(fontSize: 14.sp,),),
                            ],
                          ),
                          SizedBox(height: 10.h,),

                          Text(AppTranslations.priceFor+" 4  ليالي ",style: getRegularStyle(fontSize: 14.sp,color: AppColors.grey),),
                          SizedBox(height: 10.h,),

                          Text("5000"+" "+AppTranslations.currency,style: getSemiBoldStyle(fontSize: 14.sp,color: AppColors.primary),),
                          SizedBox(height: 5.h,),

                        ]),
                  )
                ],),
              //SizedBox
              SizedBox(height: 5.h,)
            ],
          )),
    );;
  }
}
