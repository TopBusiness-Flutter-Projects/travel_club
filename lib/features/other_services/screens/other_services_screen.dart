// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/core/widgets/no_data_widget.dart';

import '../cubit/other_services_cubit.dart';
import '../cubit/other_services_state.dart';

class OtherServicesScreen extends StatefulWidget {
  const OtherServicesScreen({super.key});
  @override
  State<OtherServicesScreen> createState() => _OtherServicesScreenState();
}

class _OtherServicesScreenState extends State<OtherServicesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<OtherServicesCubit>().getOthers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<OtherServicesCubit>();
    return BlocBuilder<OtherServicesCubit, OtherServicesScreenState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
          appbarTitle: AppTranslations.otherServices,
          body: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: cubit.othersModel.data == null
            ? Center(
                child: CustomLoadingIndicator(),
              )
            : cubit.othersModel.data!.isEmpty
                ? Center(child: NoDataWidget(title: "no_data".tr()))
                : SingleChildScrollView(
                  child: StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      children: List.generate(
                          cubit.othersModel.data?.length ?? 0,
                          (index) => OtherServicesContainer(
                                categoryModel: OtherServicesModel(
                                  title:
                                      cubit.othersModel.data?[index].title ??
                                          '',
                                  image:
                                      cubit.othersModel.data?[index].image ??
                                          '',
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.subServicesRoute,
                                        arguments: cubit
                                            .othersModel.data?[index].id
                                            .toString());
                                  },
                                ),
                              ))),
                ),
                    ),
        );
      },
    );
  }
}

class OtherServicesModel {
  final String title;
  final String image;
  final void Function()? onTap;

  OtherServicesModel({required this.title, required this.image, this.onTap});
}

class OtherServicesContainer extends StatelessWidget {
  const OtherServicesContainer({
    super.key,
    required this.categoryModel,
  });
  final OtherServicesModel categoryModel;
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
                // SvgPicture.asset(
                //   categoryModel.image,
                //   width: getWidthSize(context) * 0.13,
                // ),
                CustomNetworkImage(
                  image: categoryModel.image,
                  width: getWidthSize(context) * 0.13,
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
