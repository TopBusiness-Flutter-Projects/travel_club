import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/accommodation/data/models/places_model.dart';
import 'package:travel_club/features/accommodation/view/screens/hotels_screen.dart';

import '../../../../../core/exports.dart';

class AcommendationContainer extends StatelessWidget {
  const AcommendationContainer({
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
              arguments: HotelsScreenArguments(
                  id: categoryModel.id, title: categoryModel.name.toString()));
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
                  width: getWidthSize(context) * 0.13,
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
