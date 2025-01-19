import '../../../../../core/exports.dart';
import '../../../data/models/rooms_model.dart';

class CustomRoomsWidget extends StatelessWidget {
  const CustomRoomsWidget({super.key,required this.facility});
  final Facility facility;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
         mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(facility.image??"",height: 40.h),
          SizedBox(width: 5.w,),
          Text(facility.name.toString()??"",style: getRegularStyle(fontSize: 14.sp),)
        ],
      ),
    );
  }
}
