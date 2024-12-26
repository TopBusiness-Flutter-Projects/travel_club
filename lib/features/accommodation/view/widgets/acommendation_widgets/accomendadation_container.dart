import '../../../../../core/exports.dart';

class AcommndationModel {
  final String title;
  final String image;
  final void Function()? onTap;

  AcommndationModel({required this.title, required this.image, this.onTap});
}

class AcommendationContainer extends StatelessWidget {
  const AcommendationContainer({
    super.key,
    required this.categoryModel,
  });
  final AcommndationModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: GestureDetector(
        onTap: categoryModel.onTap,
        child: CustomContainerWithShadow(
          // width: getWidthSize(context) * 0.27,

          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getWidthSize(context) * 0.02,
                vertical: getHeightSize(context) * 0.02),
            child: Row(
              children: [
                Image.network(
                  "https://lotel.efaculty.tech/storage/cities/86621735113584.webp",
                  fit: BoxFit.cover,
                  width: getWidthSize(context) * 0.13,
                  // height: getHeightSize(context) * 0.2,
                ),
                SizedBox(width: getWidthSize(context) * 0.02),
                Flexible(
                  child: AutoSizeText(categoryModel.title,
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
