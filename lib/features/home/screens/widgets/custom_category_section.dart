import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/home/cubit/home_cubit.dart';
import 'package:travel_club/features/home/cubit/home_state.dart';
import 'package:travel_club/features/home/data/models/home_model.dart';
import '../../../../core/widgets/network_image.dart';

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
    context.read<HomeCubit>().getHomeData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<HomeCubit>();
  return BlocBuilder<HomeCubit,HomeState>(builder: (BuildContext context, state) {   return SizedBox(
      height: getHeightSize(context) * 0.15,
      child:
      ListView.builder(
        itemBuilder: (context, index) => CustomCategoryContainer(
          // onTap: (){
          //   if(cubit.homeModel?.data?.modules?[index].type==0){
          //     Navigator.pushNamed(context, Routes.accomendation);
          //   }
          //   else if(cubit.homeModel?.data?.modules?[index].type==1){
          //     Navigator.pushNamed(context, Routes.transportationRoute);
          //   }else if(cubit.homeModel?.data?.modules?[index].type==2){
          //     Navigator.pushNamed(context, Routes.foodScreen);
          //   }else if(cubit.homeModel?.data?.modules?[index].type==3){
          //     Navigator.pushNamed(context, Routes.entertainmentScreen);
          //   }else if(cubit.homeModel?.data?.modules?[index].type==4){
          //     Navigator.pushNamed(context, Routes.otherServicesRoute);
          //   }
          // },
          categoryModel: cubit.homeModel.data!.modules?[index],
          islast: index == (cubit.homeModel.data?.modules?.length ?? 0) - 1,
        ),
        itemCount: cubit.homeModel.data?.modules?.length,
        scrollDirection: Axis.horizontal,
      )
  ); },);
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
     this.onTap,
    this.islast = false,
  });
    Module? categoryModel;
  final bool islast;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<HomeCubit>();
    return BlocBuilder<HomeCubit,HomeState>(builder: (BuildContext context, state) { return Padding(
      padding: EdgeInsetsDirectional.only(
          start: getHorizontalPadding(context),
          end: islast ? getHorizontalPadding(context) : 0,
          bottom: getHeightSize(context) * 0.01),
      child: GestureDetector(
        onTap: (){
          if(categoryModel?.type==0){
            Navigator.pushNamed(context, Routes.accomendation);
          }
          else if(categoryModel?.type==1){
            Navigator.pushNamed(context, Routes.transportationRoute);
          }else if(categoryModel?.type==2){
            Navigator.pushNamed(context, Routes.foodScreen);
          }else if(categoryModel?.type==3){
            Navigator.pushNamed(context, Routes.entertainmentScreen);
          }else if(categoryModel?.type==4){
            Navigator.pushNamed(context, Routes.otherServicesRoute);
          }
        },
        child: CustomContainerWithShadow(
          width: getWidthSize(context) * 0.27,
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: getWidthSize(context) * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomNetworkImage(
                  height: getHeightSize(context) * 0.05, image:categoryModel?.image??"",
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
