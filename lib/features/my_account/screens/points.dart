import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:travel_club/core/widgets/custom_text_form_field.dart';

import '../../../core/exports.dart';
import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';

class PointsScreen extends StatefulWidget {
  const PointsScreen({super.key});

  @override
  State<PointsScreen> createState() => _PointsScreenState();
}

class _PointsScreenState extends State<PointsScreen> {
  @override
  initState() {
    super.initState();
    context.read<AccountCubit>().getMyPointHistory();
    context.read<AccountCubit>().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AccountCubit>();
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            AppTranslations.points,
                            style: getSemiBoldStyle(
                                color: AppColors.white, fontSize: 16.sp),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getHorizontalPadding(context),
                      vertical: getVerticalPadding(context),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppTranslations.myPoints,
                            style: getSemiBoldStyle(
                                color: AppColors.white, fontSize: 16.sp),
                          ),
                          InkWell(
                            onTap: () {
                              cubit.amountController.clear();
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomTextField(
                                                title: "enter_amount".tr(),
                                                controller:
                                                    cubit.amountController,
                                                keyboardType:
                                                    TextInputType.number,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter.digitsOnly
                                                    ],
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "enter_amount".tr();
                                                  }
                                                  return null;
                                                },
                                              ),
                                               CustomPhoneFormField(

                          controller: cubit.phonePointsController,
                          initialValue: cubit.countryCode,
                          title: AppTranslations.phone,
                          onCountryChanged: (v) {
                            cubit.countryCode = '+${v.fullCountryCode}';
                           debugPrint("Country changed to: ${v.name}");
                          },
                          onChanged: (phone) {
                            debugPrint(phone.completeNumber);
                          },
                        ),
                        20.h.verticalSpace,
                        CustomButton(title: AppTranslations.withdraw,
                          onTap: () {
                            // cubit.withdrawPoints();
                        })
                                            ]),
                                  ),
                                  
                                  isScrollControlled: true,
                                  backgroundColor: AppColors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20))));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalPadding(context),
                                vertical: 10.h,
                              ),
                              child: Text(
                                AppTranslations.withdraw,
                                style: getSemiBoldStyle(
                                    fontHeight: 1,
                                    color: AppColors.primary,
                                    fontSize: 16.sp),
                              ),
                            ),
                          )
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getHorizontalPadding(context),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: getHorizontalPadding(context),
                        vertical: 10.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "${cubit.loginModel.data?.points} ${AppTranslations.point}",
                              style: getRegularStyle(
                                  fontHeight: 1,
                                  color: AppColors.white,
                                  fontSize: 26.sp),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: AppColors.white,
                            size: 36.sp,
                          ),
                          Flexible(
                            child: Text(
                              "${cubit.loginModel.data?.money} ${AppTranslations.pound}",
                              style: getRegularStyle(
                                  fontHeight: 1,
                                  color: AppColors.white,
                                  fontSize: 26.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: getVerticalPadding(context) * 1),
                ]),
              ),
              20.h.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(AppTranslations.lastTransactions,
                    style: getBoldStyle(fontSize: 16.sp)),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: cubit.getPointsHistoryModel?.data == null
                    ? const Center(child: CustomLoadingIndicator())
                    : ListView.separated(
                        itemBuilder: (context, index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "تم استخدام ${cubit.getPointsHistoryModel?.data?[index].points} من النقاط لحجز فندق"),
                                10.h.verticalSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.calendar,
                                      color: AppColors.grey,
                                      width: 25.w,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      cubit.getPointsHistoryModel?.data?[index]
                                              .createdAt ??
                                          '',
                                      style: getRegularStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                        separatorBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Divider(),
                            ),
                        itemCount:
                            cubit.getPointsHistoryModel?.data?.length ?? 0),
              ))
            ],
          ),
        );
      },
    );
  }
}
