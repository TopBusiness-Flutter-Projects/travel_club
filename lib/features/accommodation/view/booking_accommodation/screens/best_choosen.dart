import 'package:travel_club/features/accommodation/view/booking_accommodation/screens/widgets/custom_container_booking.dart';
import 'package:travel_club/features/accommodation/view/booking_accommodation/screens/widgets/custom_rounded_button.dart';

import '../../../../../core/exports.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../widgets/acommendation_widgets/accomendation_rating.dart';

class BestChoosenScreen extends StatelessWidget {
  const BestChoosenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      isBooking: true,
        widget: CustomContainerWithShadow(
            height: 74.h,
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("تخطي",style: getSemiBoldStyle(fontSize: 16.sp),),

                CustomButton(title: AppTranslations.next,width: 179.w,onTap: (){
                  Navigator.pushNamed(context, Routes.bestChoosenScreen);
                },)
              ],)),
        appbarTitle: AppTranslations.bestChoosen,
        body:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppTranslations.yourChoose,style: getMediumStyle(fontSize: 14.sp),),
              ),
            CustomContainerBooking(widgetBottom:  SizedBox(),),
            Center(child: CustomContainerBooking(widgetBottom:  Align(
              alignment: Alignment.center,
                child: Expanded(child: CustomRoundedButton(title: AppTranslations.changeChoice,))),)),
          ],),
        )
    );
  }
}
