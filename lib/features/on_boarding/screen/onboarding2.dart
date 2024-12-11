import '../../../core/exports.dart';
import '../cubit/onboarding_cubit.dart';
import 'widgets/on_boarding_body.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});
 
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        OnboardingCubit cubit = context.read<OnboardingCubit>();
        return Scaffold(
          body: CustomOnBoardingBody(
               backgroundColor: AppColors.red,
            image: ImageAssets.onBoarding2,
            text: AppTranslations.onboarding2,
            onTap: () {
               cubit.pageController.animateToPage(2,
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      curve: Curves.easeInOut);
            },
          ),
        );
      },
    );
  }
}
