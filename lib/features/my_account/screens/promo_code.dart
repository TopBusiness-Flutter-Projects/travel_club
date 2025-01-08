import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/exports.dart';
import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';

class PromoCodeScreen extends StatelessWidget {
  const PromoCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String code = "156415415";
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                width: getWidthSize(context),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.pointsBackground),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Column(children: [
                  SizedBox(height: getVerticalPadding(context) * 2),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getHorizontalPadding(context)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomBackButton(),
                          Text(
                            AppTranslations.promoCode,
                            style: getSemiBoldStyle(
                                color: AppColors.white, fontSize: 16.sp),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                        ]),
                  ),
                  SizedBox(height: getVerticalPadding(context) * 2),
                  Image.asset(
                    ImageAssets.promoCode,
                    height: getHeightSize(context) * 0.3,
                  ),
                  SizedBox(height: getVerticalPadding(context) * 1),
                ]),
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(AppTranslations.promoCodeDesc,
                        textAlign: TextAlign.center,
                        style: getRegularStyle(fontSize: 14.sp)),
                    20.h.verticalSpace,
                    Text(AppTranslations.promoCode,
                        style: getRegularStyle(
                            color: AppColors.primary, fontSize: 16.sp)),
                    20.h.verticalSpace,
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.promocodeBackground,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: Center(
                        child: Text(
                          code,
                          style: getRegularStyle(
                              color: AppColors.primary, fontSize: 25.sp),
                        ),
                      ),
                    ),
                    20.h.verticalSpace,
                    Row(
                      children: [
                        Flexible(
                          child: CustomButton(
                            title: AppTranslations.copyCode,
                            onTap: () {
                              Clipboard.setData(ClipboardData(text: code));
                            },
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Flexible(
                          child: CustomButton(
                            title: AppTranslations.share,
                            color: AppColors.yellow,
                            onTap: () async {
                              String url =
                                  'https://travelclub.page.link/invite\n$code';
                              await Share.share(url);
                            },
                          ),
                        ),
                      ],
                    ),
                    20.h.verticalSpace,
                  ],
                ),
              )))
            ],
          ),
        );
      },
    );
  }
}
