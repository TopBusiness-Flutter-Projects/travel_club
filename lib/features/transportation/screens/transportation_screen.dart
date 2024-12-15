// ignore_for_file: deprecated_member_use

import 'package:travel_club/core/exports.dart';

class TransportationScreen extends StatefulWidget {
  const TransportationScreen({super.key});
  @override
  State<TransportationScreen> createState() => _TransportationScreenState();
}

class _TransportationScreenState extends State<TransportationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: getHeightSize(context),
        child: Column(children: [
          SizedBox(height: getVerticalPadding(context) * 2),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(),
                  Text(
                    AppTranslations.transportation,
                    style: getSemiBoldStyle(
                        color: AppColors.black, fontSize: 16.sp),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                ]),
          ),
        ]),
      ),
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
                SvgPicture.asset(
                  categoryModel.image,
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
