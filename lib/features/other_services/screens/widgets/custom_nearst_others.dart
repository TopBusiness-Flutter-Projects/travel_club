import '../../../../core/exports.dart';

class CustomNearstOthers extends StatelessWidget {
  const CustomNearstOthers({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.detailsOtherServices);
      },
      child: CustomContainerWithShadow(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                ImageAssets.logoImage,
                height: 60.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              // Text("الاماكن الاقرب",style: getMediumStyle(fontSize: 14.sp),),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "اسم السوبر ماركت",
                      style: getSemiBoldStyle(
                          color: AppColors.secondPrimary, fontSize: 14.sp),
                    ),
                    Text(
                      "٢٠ شارع الملك الصالح / العين السخنه /مصر",
                      maxLines: 2,
                      style: getRegularStyle(
                          color: AppColors.grey, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     width: 44.w, // Adjust size as needed
              //     height: 44.h,
              //     decoration: BoxDecoration(
              //       color: AppColors.primary,
              //       shape: BoxShape.rectangle,
              //       borderRadius: BorderRadius.circular(
              //           15.r), // Circular with rounded corners
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: SvgPicture.asset(
              //         AppIcons.call,
              //         width: 15.w,
              //         height: 15.h,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                width: 10.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
