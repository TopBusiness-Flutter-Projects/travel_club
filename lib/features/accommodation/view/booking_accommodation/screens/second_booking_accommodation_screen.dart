
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/features/accommodation/view/booking_accommodation/screens/widgets/custom_copun_widget.dart';
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
                CustomWidgetRating(hotelsModel: HotelsModel(title: 'مراسي ريزورت العين السخنه البحر الاحمر', rate:4 ,isFavorite: false,
                    image:   "https://lotel.efaculty.tech/storage/cities/38461735112771.webp",
                   ),),
                SizedBox(height: 20.h,),
            //prefer hotel
                Text(AppTranslations.chooseTheBestOption,style: getMediumStyle(fontSize: 14.sp),),
                //custom contanier
                SizedBox(height: 20.h,),

                CustomContainerBooking(),
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

