
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/features/accommodation/data/models/getlodges_model.dart';
import 'package:travel_club/features/accommodation/view/booking_accommodation/screens/widgets/custom_copun_widget.dart';
import 'package:travel_club/features/accommodation/view/booking_accommodation/screens/widgets/custom_rounded_button.dart';
import 'package:travel_club/features/accommodation/view/booking_accommodation/screens/widgets/linear_progress.dart';
import 'package:travel_club/features/accommodation/view/booking_accommodation/screens/widgets/payment_widget.dart';
import '../../../../transportation/cubit/transportation_cubit.dart';
import '../../../../transportation/screens/widgets/custom_from_to_date.dart';
import '../../../cubit/accomendation_cubit.dart';
import '../../widgets/acommendation_widgets/accomendation_rating.dart';
import 'widgets/custom_container_booking.dart';

class SecondAccommodationBooking extends StatefulWidget {
  const SecondAccommodationBooking({super.key});

  @override
  State<SecondAccommodationBooking> createState() => _SecondAccommodationBookingState();
}
class _SecondAccommodationBookingState extends State<SecondAccommodationBooking> {
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
      return CustomScreen(appbarTitle: AppTranslations.booking,
        body:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h,),
                //center linear progress
                LinearProgress(),
                SizedBox(height: 25.h,),
                //text
                Text(AppTranslations.selectGoingAndReturn,style: getMediumStyle(fontSize: 14.sp),),
                SizedBox(height: 20.h,),
            //from and to date
                CustomFromToDate(),
                SizedBox(height: 20.h,),
                //custom widget rating hotel
                Text("${AppTranslations.numberOfMembers} : "+cubit.counter.toString()??"",style: getMediumStyle(fontSize: 14.sp),),

                CustomWidgetRating(hotelsModel:
                LodgeModel()
                  ,),
                SizedBox(height: 20.h,),
            //prefer hotel
                Text(AppTranslations.rooms,style: getMediumStyle(fontSize: 14.sp),),
                //custom contanier
                SizedBox(height: 20.h,),
                // CustomContainerBooking(
                //   widgetBottom: SizedBox(),
                // ),
                SizedBox(
                  height: 300.h,
                  child: Swiper(
                    itemCount: 3,  // Define the number of items in the swiper
                    itemBuilder: (BuildContext context, int index) {
                      // Return a CustomContainerBooking for each item
                      return
                      //   Container(
                      //   child : Text('Item dsas'),
                      // );
                        SizedBox(
                          // height: 600.h,
                          // width: getWidthSize(context),
                          child: CustomContainerBooking(
                          widgetBottom: SizedBox(),
                                                ),
                        );
                    },
                    pagination: SwiperPagination(),  // Optional pagination
                  //  control: SwiperControl(),  // Optional arrows for control
                  ),
                ),

             //   CustomContainerBooking(widgetBottom: SizedBox(),),
                SizedBox(height: 10.h,),
//payment
                Text(AppTranslations.paymentDetails,style: getMediumStyle(fontSize: 14.sp),),
                SizedBox(height: 20.h,),
                PaymentWidget(),
                SizedBox(height: 20.h,),
//copun
                Text(AppTranslations.areYouHaveACoupon,style: getMediumStyle(fontSize: 14.sp),),
                SizedBox(height: 10.h,),

                 CustomCopunWidget(),
                CustomCheckboxWithText(),
//button

CustomButton(title: AppTranslations.completePayment,onTap: (){
  Navigator.pushNamed(context, Routes.payment);
},)
              ],
            ),
          ),
        ),
      );
    },);
  }
}


class CustomCheckboxWithText extends StatefulWidget {
  @override
  _CustomCheckboxWithTextState createState() => _CustomCheckboxWithTextState();
}

class _CustomCheckboxWithTextState extends State<CustomCheckboxWithText> {

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<AccomendationCubit>();
  return BlocBuilder<AccomendationCubit,AccomendationState>(builder: (BuildContext context, state) {   return Row(
    children: [
      Checkbox(
        activeColor: AppColors.primary,
        value: cubit.isChecked,
        onChanged: (bool? value) {
          // setState(() {
          //   isChecked = value ?? false;
          // });
          cubit.checkPrivacy();
        },
      ),
      Center(
        child: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 16.0, color: Colors.black), // الأسلوب الافتراضي للنص
            children: <TextSpan>[
              TextSpan(text:  AppTranslations.youAgree,style: getMediumStyle(fontSize: 14.sp)), // جزء أول عادي
              TextSpan(
                text: '${AppTranslations.terms}', // جزء مؤكد
                style: getMediumStyle(fontSize: 14.sp,color: AppColors.primary), // تغيير الأسلوب ليكون غامق
              ),
            ],
          ),
        ),
      ) // نص يمكنك تغييره حسب الحاجة
    ],
  ); },);
  }
}
