import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/residence/data/models/places_model.dart';
import 'package:travel_club/features/residence/view/screens/lodges_screen.dart';

import '../../../../../core/exports.dart';

class CustomPlaceContainer extends StatelessWidget {
  const CustomPlaceContainer({
    super.key,
    required this.categoryModel,
  });
  final PlaceModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.hotelsScreen,
              arguments: LodgesScreenArguments(
                  placeId: categoryModel.id!,
                  title: categoryModel.name.toString()));
        },
        child: CustomContainerWithShadow(
          // width: getWidthSize(context) * 0.27,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getWidthSize(context) * 0.02,
                vertical: getHeightSize(context) * 0.02),
            child: Row(
              children: [
                CustomNetworkImage(
                  image: categoryModel.image ?? "",
                  width:60,
                  height : 60
                ),
                SizedBox(width: getWidthSize(context) * 0.02),
                Flexible(
                  child: AutoSizeText(categoryModel.name ?? "",
                      maxLines: 2, style: getMediumStyle(fontSize: 13.sp)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
