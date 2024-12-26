import 'package:travel_club/core/widgets/custom_text_form_field.dart';

import '../../../../../core/exports.dart';
import '../widgets/custom_conatiner_in_center.dart';

class BookTableScreen extends StatelessWidget {
  const BookTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(appbarTitle: AppTranslations.bookTable,
        body:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height:getHeightSize(context) * 0.05),
                SizedBox(height: 20.h,),
                CustomContainerFood(isBooking: false,),
                SizedBox(height: 20.h,),
                Text(AppTranslations.selectBookingDate,style: getMediumStyle(fontSize: 14.sp),),
                CustomTextField(),
                Text(AppTranslations.numberOfAttendees,style: getMediumStyle(fontSize: 14.sp),),
                CustomTextField()

              ],
            ),
        ));
  }
}