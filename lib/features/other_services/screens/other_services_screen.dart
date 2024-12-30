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
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: List.generate(
                7,
                (index) => OtherServicesContainer(
                      categoryModel: OtherServicesModel(
                        title: "سوبر ماركت",
                        image: AppIcons.others,
                        onTap: () {
                          Navigator.pushNamed(context, Routes.subServicesRoute);
                        },
                      ),
                    ))),
      )),
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
                Image.network(
                  "https://lotel.efaculty.tech/storage/cities/65701735112706.webp",
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
