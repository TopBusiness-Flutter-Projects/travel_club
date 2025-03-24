import 'package:travel_club/core/widgets/network_image.dart';

import '../../../../../core/exports.dart';
import '../../../data/models/rooms_model.dart';

class CustomFacilityWidget extends StatelessWidget {
  const CustomFacilityWidget({super.key, required this.facility});
  final Facility facility;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomNetworkImage(
            image: facility.image ?? "",
            height: getWidthSize(context) * 0.08,
            width: getWidthSize(context) * 0.08,
          ),
          SizedBox(
            width: 10.w,
          ),
          AutoSizeText(
            facility.name.toString() ?? "",
            style: getRegularStyle(fontSize: 14.sp),
          )
        ],
      ),
    );
  }
}
