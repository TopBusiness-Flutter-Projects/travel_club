import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/utils/app_colors.dart';

import '../../../core/utils/assets_manager.dart';

import '../../../core/utils/get_size.dart';
import '../cubit/onboarding_cubit.dart';
import 'widgets/on_boarding_body.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        OnboardingCubit cubit = context.read<OnboardingCubit>();
        return Scaffold(
          body: CustomOnBoardingBody(
            backgroundColor: AppColors.lbny,
            image: ImageAssets.onBoarding1,
            text: AppTranslations.onboarding1,
            onTap: () {
              cubit.pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
          ),
        );
      },
    );
  }
}
