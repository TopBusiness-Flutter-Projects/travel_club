import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/my_account/screens/widgets/custom_row.dart';
import 'package:travel_club/features/my_bookings/view/transportation_booking/widgets/custom_booking_transportation_body.dart';
import 'package:travel_club/features/my_bookings/view/widgets/custom_catogrey_booking.dart';
import '../../accommodation/view/widgets/details_widgets/custom_appbar_row.dart';
import '../../home/screens/widgets/custom_appbar.dart';
import '../../my_bookings/cubit/my_bookings_cubit.dart';
import '../../my_bookings/cubit/my_bookings_state.dart';
import '../../my_bookings/view/accommodation_booking/screens/custom_booking_accommodation_body.dart';
import '../../my_bookings/view/food_booking/screens/custom_booking_food.dart';




class Accountbody extends StatefulWidget {
  const Accountbody({
    super.key,
  });

  @override
  State<Accountbody> createState() => _AccountbodyState();
}

class _AccountbodyState extends State<Accountbody> {
  @override
  Widget build(BuildContext context) {
    MyBookingsCubit cubit = context.read<MyBookingsCubit>();
    return BlocBuilder<MyBookingsCubit,MyBookingsState >(builder: (context, state) {
      return ListView(children: [
        SizedBox(height: getVerticalPadding(context) * 2),
        //app bar
        CustomHomeAppbar(isHome: false, title: 'نونو',),
        SizedBox(height: 40.h,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             Padding(
               padding: const EdgeInsets.all(1.0),
               child: CustomContainerWithShadow(
                   child:
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: CircleAvatar(
                                  backgroundColor:AppColors.grey.withOpacity(.2),
                           child: Padding(
                             padding: const EdgeInsets.all(3.0),
                             child: Image.asset(ImageAssets.profile,color: AppColors.grey,),
                           )),
                     ),
                     SizedBox(height: 30.h,),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                         Text("احمد مختار"),
                         Text("01027639683"),
                       ],),
                     )

                   ],
                 ),
               ),
               ),
             ),
SizedBox(height: 30.h,),
                CustomRowProfile(title: AppTranslations.personalData,),
                CustomRowProfile(title: AppTranslations.changeLang,),
                CustomRowProfile(title: AppTranslations.contactUs,),
                CustomRowProfile(title:AppTranslations.aboutUs,),
                CustomRowProfile(title: AppTranslations.PrivacyAndSecurity,),
                CustomRowProfile(title:AppTranslations.shareApp,),
                CustomRowProfile(title: 'البيانات الشخصية',),
              ],


            ),
          ),
        ),
      ]);
    });
  }
}
