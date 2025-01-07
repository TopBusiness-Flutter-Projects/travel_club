import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/onboarding_cubit.dart';
import 'onboarding1.dart';
import 'onboarding2.dart';
import 'onboarding3.dart';

class OnBoardinScreen extends StatefulWidget {
  const OnBoardinScreen({super.key});

  @override
  State<OnBoardinScreen> createState() => _OnBoardinScreenState();
}

class _OnBoardinScreenState extends State<OnBoardinScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        OnboardingCubit cubit = context.read<OnboardingCubit>();
        return OrientationBuilder(
          builder: (context, orientation) {
            return Scaffold(
              body: Column(
                children: [
                  Flexible(
                    child: PageView(
                      controller: cubit.pageController,
                      reverse: true,
                      onPageChanged: (int page) {
                        cubit.onPageChanged(page);
                      },
                      children: const [
                        OnBoarding1(),
                        OnBoarding2(),
                        OnBoarding3(),
                      ],
                    ),
                  ),
                  // SizedBox(height: getWidthSize(context) / 12),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(
                  //       vertical: getWidthSize(context) / 16),
                  //   child: SmoothPageIndicator(
                  //     controller: cubit.pageController,
                  //     count: cubit.numPages,
                  //     textDirection: TextDirection.ltr,
                  //     effect: WormEffect(
                  //       activeDotColor: AppColors.primary,
                  //       dotColor: AppColors.gray,
                  //       dotHeight: getWidthSize(context) / 44,
                  //       dotWidth: getWidthSize(context) / 44,
                  //       type: WormType.underground,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
