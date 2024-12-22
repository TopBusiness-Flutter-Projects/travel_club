import '../../../../../../core/exports.dart';

class CustomRoomsWidget extends StatelessWidget {
  const CustomRoomsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SvgPicture.asset(AppIcons.bookingHotel),
          SizedBox(width: 5.w,),
          Text("data",style: getRegularStyle(fontSize: 14.sp),)
        ],
      ),
    );
  }
}
