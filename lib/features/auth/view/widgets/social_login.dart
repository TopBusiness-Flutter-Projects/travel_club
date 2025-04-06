import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/auth/cubit/cubit.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Text(
          AppTranslations.youCanLogin,
          style: getRegularStyle(
            fontSize: 14.sp,
            color: AppColors.secondPrimary,
          ),
        )),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Facebook Container
            // Container(
            //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(30),
            //     border: Border.all(color: AppColors.greyborder),
            //   ),
            //   child: Row(
            //     children: [
            //       SvgPicture.asset(
            //         AppIcons.facebook, // Add your Facebook logo here
            //         width: 20,
            //         height: 20,
            //       ),
            //       SizedBox(width: 8),
            //       Text(AppTranslations.facebook,
            //           style: getRegularStyle(fontSize: 14.sp)),
            //     ],
            //   ),
            // ),
            SizedBox(width: 16.w), // Space between the containers

            // Google Container
            InkWell(
              onTap: () {
                BlocProvider.of<LoginCubit>(context).signInWithGoogle(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.greyborder),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.google, // Add your Google logo here
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 8),
                    Text(AppTranslations.google,
                        style: getRegularStyle(fontSize: 14.sp)),
                  ],
                ),
              ),
            ), InkWell(
              onTap: () {
                BlocProvider.of<LoginCubit>(context).signInWithApple();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.greyborder),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.google, // Add your Google logo here
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 8),
                    Text(AppTranslations.google,
                        style: getRegularStyle(fontSize: 14.sp)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
