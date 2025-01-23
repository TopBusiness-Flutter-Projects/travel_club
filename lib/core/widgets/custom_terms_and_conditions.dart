import 'package:travel_club/core/exports.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:travel_club/features/payment/cubit/payment_cubit.dart';
import 'package:travel_club/features/payment/cubit/payment_state.dart';
import '../../features/auth/cubit/cubit.dart';
import '../../features/auth/cubit/state.dart';

// we lithen to context.read<MainCubit>().isChecked in other places
class CustomAcceptTerms extends StatefulWidget {
  const CustomAcceptTerms({super.key, required this.terms});
  final String terms;

  @override
  State<CustomAcceptTerms> createState() => _CustomAcceptTermsState();
}

class _CustomAcceptTermsState extends State<CustomAcceptTerms> {
  @override
  void initState() {
    context.read<PaymentCubit>().isChecked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PaymentCubit>();
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (BuildContext context, state) {
        return Row(
          children: [
            Checkbox(
              activeColor: AppColors.primary,
              value: cubit.isChecked,
              onChanged: (bool? value) {
                cubit.checkPrivacy();
              },
            ),
            Text(AppTranslations.youAgree,
                style: getMediumStyle(fontSize: 14.sp)),
            CustomTermsAndConditionsText(
              terms: widget.terms,
            ),
          ],
        );
      },
    );
  }
}

class CustomTermsAndConditionsText extends StatelessWidget {
  const CustomTermsAndConditionsText({
    super.key,
    required this.terms,
  });
  final String terms;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showTermsBottomSheet(context, terms);
        },
        child: Center(
            child: 
            Text(AppTranslations.terms,
                style: getMediumStyle(
                    fontSize: 12.sp, color: AppColors.primary))));
  }
}

void showTermsBottomSheet(BuildContext context, String terms) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,     
     

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return ConstrainedBox(
              constraints:  BoxConstraints(maxHeight: getHeightSize(context) * 0.9),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        width: 79.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: AppColors.samawy,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(AppTranslations.terms,
                        style: getSemiBoldStyle(
                            fontSize: 20.sp, color: AppColors.blue)),
                    const SizedBox(height: 16),
                    Flexible(
                      child: SingleChildScrollView(
                      child:  Html(
                                    data: terms)
                        // child: Text(
                        //     // "Once upon a time in a small village nestled in the mountains, there lived a young woman named Elara. She was known for her insatiable curiosity about the world beyond the peaks that surrounded her home. While others in her village were content with the simple rhythm of their lives, Elara often found herself daydreaming about the vast oceans, bustling cities, and ancient ruins she'd read about in the few books she could find.One crisp morning, as the sun began to rise and paint the sky with shades of gold and pink, Elara decided it was time to leave her village and explore the unknown. Armed with a small satchel of essentials and a map she had drawn herself based on stories from travelers, she set off on her journey."
                        //     // "Once upon a time in a small village nestled in the mountains, there lived a young woman named Elara. She was known for her insatiable curiosity about the world beyond the peaks that surrounded her home. While others in her village were content with the simple rhythm of their lives, Elara often found herself daydreaming about the vast oceans, bustling cities, and ancient ruins she'd read about in the few books she could find.One crisp morning, as the sun began to rise and paint the sky with shades of gold and pink, Elara decided it was time to leave her village and explore the unknown. Armed with a small satchel of essentials and a map she had drawn herself based on stories from travelers, she set off on her journey."
                        //     // "Once upon a time in a small village nestled in the mountains, there lived a young woman named Elara. She was known for her insatiable curiosity about the world beyond the peaks that surrounded her home. While others in her village were content with the simple rhythm of their lives, Elara often found herself daydreaming about the vast oceans, bustling cities, and ancient ruins she'd read about in the few books she could find.One crisp morning, as the sun began to rise and paint the sky with shades of gold and pink, Elara decided it was time to leave her village and explore the unknown. Armed with a small satchel of essentials and a map she had drawn herself based on stories from travelers, she set off on her journey."
                        //     // "Once upon a time in a small village nestled in the mountains, there lived a young woman named Elara. She was known for her insatiable curiosity about the world beyond the peaks that surrounded her home. While others in her village were content with the simple rhythm of their lives, Elara often found herself daydreaming about the vast oceans, bustling cities, and ancient ruins she'd read about in the few books she could find.One crisp morning, as the sun began to rise and paint the sky with shades of gold and pink, Elara decided it was time to leave her village and explore the unknown. Armed with a small satchel of essentials and a map she had drawn herself based on stories from travelers, she set off on her journey."
                        //      terms                            
                        //    , style: getMediumStyle(
                        //         fontSize: 14.sp, color: AppColors.secondPrimary)),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      });
}
