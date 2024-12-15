import 'package:travel_club/core/exports.dart';

class CustomCategorySection extends StatelessWidget {
  const CustomCategorySection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(title: AppTranslations.accommodation, image: AppIcons.bed),
      CategoryModel(
          title: AppTranslations.transportation,
          image: AppIcons.transport,
          onTap: () {
            Navigator.pushNamed(context, Routes.transportationRoute);
          }),
      CategoryModel(title: AppTranslations.food, image: AppIcons.feeding),
      CategoryModel(
          title: AppTranslations.entertainment,
          image: AppIcons.entertainment,
          onTap: () {
            // Navigator.pushNamed(context, AppRoutes.entertainment);
          }),
      CategoryModel(
          title: AppTranslations.otherServices,
          image: AppIcons.others,
          onTap: () {
            Navigator.pushNamed(context, Routes.otherServicesRoute);
          }),
    ];

    return SizedBox(
        height: getHeightSize(context) * 0.15,
        child: ListView.builder(
          itemBuilder: (context, index) => CustomCategoryContainer(
            categoryModel: categories[index],
            islast: index == categories.length - 1,
          ),
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
        ));
  }
}

class CategoryModel {
  final String title;
  final String image;
  final void Function()? onTap;

  CategoryModel({required this.title, required this.image, this.onTap});
}

class CustomCategoryContainer extends StatelessWidget {
  const CustomCategoryContainer({
    super.key,
    required this.categoryModel,
    this.islast = false,
  });
  final CategoryModel categoryModel;
  final bool islast;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: getHorizontalPadding(context),
          end: islast ? getHorizontalPadding(context) : 0,
          bottom: getHeightSize(context) * 0.01),
      child: GestureDetector(
        onTap: categoryModel.onTap,
        child: CustomContainerWithShadow(
          width: getWidthSize(context) * 0.27,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getWidthSize(context) * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  categoryModel.image,
                  height: getHeightSize(context) * 0.05,
                ),
                AutoSizeText(categoryModel.title,
                    maxLines: 1, style: getMediumStyle(fontSize: 13.sp)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
