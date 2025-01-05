import '../../../../core/exports.dart';

class ApplyScreen extends StatelessWidget {
  const ApplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: SvgPicture.asset(AppIcons.correctGreen)),
          SizedBox(
            height: 10.h,
          ),
          Text(
            AppTranslations.accountActivated,
            style: getSemiBoldStyle(
              fontSize: 20.sp,
              color: AppColors.green,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Text(
              AppTranslations.thankYou + AppTranslations.allFeatures,
              style: getMediumStyle(
                fontSize: 14.sp,
                color: AppColors.grey,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.mainRoute, (route) => false);
            },
            child: Text(
              AppTranslations.goHome,
              style: getSemiBoldStyle(color: AppColors.white, fontSize: 14.sp),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          )
        ],
      ),
    );
  }
}
