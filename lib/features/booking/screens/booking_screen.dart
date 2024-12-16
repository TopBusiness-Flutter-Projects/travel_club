import '../../../core/exports.dart';

class AccommodationBooking extends StatelessWidget {
  const AccommodationBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(appbarTitle: "حجز الفندق",body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppTranslations.selectGoingAndReturn,style: getMediumStyle(fontSize: 14.sp),),
        Text(AppTranslations.chooseTheBestOption,style: getMediumStyle(fontSize: 14.sp),),
      ],
    ),);
  }
}
