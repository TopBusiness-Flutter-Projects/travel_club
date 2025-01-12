import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/my_account/cubit/account_cubit.dart';

import '../../../my_account/cubit/account_state.dart';

class CustomHomeAppbar extends StatefulWidget {
  CustomHomeAppbar({super.key, required this.isHome, required this.title});
  bool isHome;
  String? title;

  @override
  State<CustomHomeAppbar> createState() => _CustomHomeAppbarState();
}

class _CustomHomeAppbarState extends State<CustomHomeAppbar> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<AccountCubit>().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AccountCubit>();
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getHorizontalPadding(context),
              vertical: getVerticalPadding(context)),
          child: Row(children: [
            if (widget.isHome == true) ...[
              Container(width: 20,height: 30,child: Text("nono",style: getBoldStyle(color: AppColors.green,fontSize: 20.sp),)),
              CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: getWidthSize(context) * 0.07,
                  child: Image.asset(ImageAssets.profile,
                      color: AppColors.white,
                      width: getWidthSize(context) * 0.1)),
              SizedBox(
                width: getWidthSize(context) * 0.05,
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          AppConst.isLogged
                              ? AppTranslations.welcome
                              : AppTranslations.hi,
                          style: getMediumStyle(
                              fontSize: 14.sp, color: AppColors.grey)),
                      Text(
                          AppConst.isLogged
                              ? cubit.loginModel.data?.name ?? ""
                              : AppTranslations.guest,
                          style: getSemiBoldStyle(
                              color: AppColors.blue, fontSize: 18.sp))
                    ]),
              ),
            ]
            else ...[
              Expanded(
                child: Text(widget.title!,
                    style: getSemiBoldStyle(
                        color: AppColors.blue, fontSize: 18.sp)),
              ),
            ],
            SizedBox(
              width: getWidthSize(context) * 0.05,
            ),
            AppConst.isLogged
                ? GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.notificationScreen);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Badge(
                              backgroundColor: AppColors.primary,
                              isLabelVisible: cubit
                                      .loginModel.data?.notifications
                                      .toString() !=
                                  "0",
                              alignment: AlignmentDirectional.topStart,
                              child: SvgPicture.asset(AppIcons.notification)),
                        )),
                  )
                : SizedBox(),
          ]),
        );
      },
    );
  }
}
