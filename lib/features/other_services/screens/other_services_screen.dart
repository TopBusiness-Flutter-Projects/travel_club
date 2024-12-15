// ignore_for_file: deprecated_member_use

import 'package:travel_club/core/exports.dart';

class OtherServicesScreen extends StatefulWidget {
  const OtherServicesScreen({super.key});
  @override
  State<OtherServicesScreen> createState() => _OtherServicesScreenState();
}

class _OtherServicesScreenState extends State<OtherServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      appbarTitle: AppTranslations.otherServices,
      body: SingleChildScrollView(
          child: StaggeredGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
              children: List.generate(
                  10,
                  (index) => OtherServicesContainer(
                        categoryModel: OtherServicesModel(
                          title: "neww",
                          image: AppIcons.others,
                          onTap: () {},
                        ),
                      )))),
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
    this.islast = false,
  });
  final OtherServicesModel categoryModel;
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
