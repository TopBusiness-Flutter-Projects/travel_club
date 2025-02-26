import '../../../../core/exports.dart';
import '../../../../core/widgets/network_image.dart';
import '../../../payment/cubit/payment_cubit.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_state.dart';
import '../../data/models/home_model.dart';

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
              cubit.changeContainer(categoryModel?.type ?? 0,context);

              context.read<PaymentCubit>().currentModuleId = categoryModel!.id!;
              if (categoryModel?.type == 0) {

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
