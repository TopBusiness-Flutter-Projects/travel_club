import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/home/cubit/home_cubit.dart';
import 'package:travel_club/features/home/cubit/home_state.dart';
import 'package:travel_club/features/home/data/models/home_model.dart';

class CustomCategorySection extends StatefulWidget {
  const CustomCategorySection({
    super.key,
  });

  @override
  State<CustomCategorySection> createState() => _CustomCategorySectionState();
}

class _CustomCategorySectionState extends State<CustomCategorySection> {
  @override
  void initState() {
    // TODO: implement initState
 //   context.read<HomeCubit>().getHomeData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<HomeCubit>();
    // List<CategoryModel> categories = [
    //   CategoryModel(title: AppTranslations.accommodation, image: AppIcons.bed,onTap: () {
    //     Navigator.pushNamed(context, Routes.accomendation);
    //   }),
    //   CategoryModel(
    //       title: AppTranslations.transportation,
    //       image: AppIcons.transport,
    //       onTap: () {
    //         Navigator.pushNamed(context, Routes.transportationRoute);
    //       }),
    //   CategoryModel(title: AppTranslations.food, image: AppIcons.feeding,onTap:(){
    //     Navigator.pushNamed(context, Routes.foodScreen);
    //   } ),
    //   CategoryModel(
    //       title: AppTranslations.entertainment,
    //       image: AppIcons.entertainment,
    //       onTap: () {
    //         Navigator.pushNamed(context, Routes.entertainmentScreen);
    //       }),
    //   CategoryModel(
    //       title: AppTranslations.otherServices,
    //       image: AppIcons.others,
    //       onTap: () {
    //         Navigator.pushNamed(context, Routes.otherServicesRoute);
    //       }),
    // ];

    return SizedBox(
        height: getHeightSize(context) * 0.15,
        child:
        ListView.builder(
          itemBuilder: (context, index) => CustomCategoryContainer(
            categoryModel: cubit.homeModel?.data!.modules?[index],
            islast: index == (cubit.homeModel?.data?.modules?.length ?? 0) - 1,
          ),
          itemCount: cubit.homeModel?.data?.modules?.length,
          scrollDirection: Axis.horizontal,
        )
    );
  }
}
//
// class CategoryModel {
//   final String title;
//   final String image;
//   final void Function()? onTap;
//
//   CategoryModel({required this.title, required this.image, this.onTap});
// }

class CustomCategoryContainer extends StatelessWidget {
   CustomCategoryContainer({
    super.key,
    required this.categoryModel,
    this.islast = false,
  });
    Module? categoryModel;
  final bool islast;
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<HomeCubit>();
    return BlocBuilder<HomeCubit,HomeState>(builder: (BuildContext context, state) { return Padding(
      padding: EdgeInsetsDirectional.only(
          start: getHorizontalPadding(context),
          end: islast ? getHorizontalPadding(context) : 0,
          bottom: getHeightSize(context) * 0.01),
      child: GestureDetector(
       // onTap: categoryModel?.onTap,
        child: CustomContainerWithShadow(
          width: getWidthSize(context) * 0.27,
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: getWidthSize(context) * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  categoryModel?.image??"",
                  height: getHeightSize(context) * 0.05,
                ),
                AutoSizeText(categoryModel?.name??"",
                    maxLines: 1, style: getMediumStyle(fontSize: 13.sp)),
              ],
            ),
          ),
        ),
      ),
    ); },);
  }
}
