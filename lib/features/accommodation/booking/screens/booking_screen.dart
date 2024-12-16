
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/accommodation/booking/screens/widgets/custom_container_booking.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_translations.dart';
import '../../../transportation/cubit/transportation_cubit.dart';
import '../../../transportation/screens/widgets/custom_from_to_date.dart';
import '../../cubit/accomendation_cubit.dart';

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
   return BlocBuilder<AccomendationCubit,AccomendationState>(builder: (BuildContext context, state) {
     return CustomScreen(appbarTitle: AppTranslations.booking,
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
                   return CustomContainerBooking();
                 },
               ),
             )
           ],
         ),
       ),
     );
   },);
  }
}
