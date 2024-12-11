import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_club/config/routes/app_routes.dart';
import 'package:travel_club/core/exports.dart';

import '../cubit/onboarding_cubit.dart';
import 'widgets/on_boarding_body.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        OnboardingCubit cubit = context.read<OnboardingCubit>();
        return Scaffold(
          body: CustomOnBoardingBody(
            backgroundColor: AppColors.onboarding3,
            image: ImageAssets.onBoarding3,
            text: AppTranslations.onboarding3,
            onTap: () async {
              Navigator.pushReplacementNamed(context, Routes.loginRoute);
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.setBool('onBoarding', true);
            },
          ),
        );
      },
    );
  }
}
