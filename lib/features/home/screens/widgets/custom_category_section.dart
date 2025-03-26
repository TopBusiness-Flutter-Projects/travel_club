import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/home/cubit/home_cubit.dart';
import 'package:travel_club/features/home/cubit/home_state.dart';
import 'package:travel_club/features/home/data/models/home_model.dart';
import 'package:travel_club/features/payment/cubit/payment_cubit.dart';
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
    context.read<HomeCubit>().getHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        return cubit.homeModel.data!.modules == null
            ? const SizedBox(
                height: 1,
              )
            : SizedBox(
                height: getHeightSize(context) * 0.15,
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      CustomCategoryContainer(
                    categoryModel: cubit.homeModel.data!.modules![index],
                    islast: index == (cubit.homeModel.data!.modules!.length <
                                    cubit.moduleslenth ? cubit.homeModel.data!.modules!.length
                                : cubit.moduleslenth) - 1,
                  ),
                  itemCount: cubit.homeModel.data!.modules!.length,
                  scrollDirection: Axis.horizontal,
                ));
      },
    );
  }
}

class CustomCategoryContainer extends StatelessWidget {
  const CustomCategoryContainer({
    super.key,
    required this.categoryModel,
    this.onTap,
    this.islast = false,
  });
  final ModuleModel? categoryModel;
  final bool islast;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: EdgeInsetsDirectional.only(
              start: getHorizontalPadding(context),
              end: islast ? getHorizontalPadding(context) : 0,
              bottom: getHeightSize(context) * 0.01),
          child: GestureDetector(
            onTap: () {
              context.read<PaymentCubit>().currentModuleId = categoryModel!.id!;
              if (categoryModel?.type == 0) {
                Navigator.pushNamed(context, Routes.residenceRoute);
              } else if (categoryModel?.type == 1) {
                Navigator.pushNamed(context, Routes.transportationRoute);
              } else if (categoryModel?.type == 2) {
                Navigator.pushNamed(context, Routes.foodScreen);
              } else if (categoryModel?.type == 3) {
                Navigator.pushNamed(context, Routes.entertainmentScreen);
              } else if (categoryModel?.type == 4) {
                Navigator.pushNamed(context, Routes.otherServicesRoute);
              }
            },
            child: CustomContainerWithShadow(
              width: getWidthSize(context) * 0.27,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getWidthSize(context) * 0.01),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomNetworkImage(
                      withLogo: false,
                      height: getHeightSize(context) * 0.05,
                      image: categoryModel?.image ?? "",
                    ),
                    AutoSizeText(categoryModel?.name ?? "",
                        maxLines: 1, style: getMediumStyle(fontSize: 13.sp)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
