import 'package:flutter/cupertino.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/home/cubit/home_cubit.dart';
import 'package:travel_club/features/home/cubit/home_state.dart';

import '../../data/models/home_model.dart';

class CustomBagSection extends StatelessWidget {
  const CustomBagSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit =context.read<HomeCubit>();
  return BlocBuilder<HomeCubit,HomeState>(builder: (BuildContext context, state) {   return Column(
    children: [
      Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppTranslations.bestBags,
                style: getBoldStyle(fontSize: 16.sp)),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.bags);
              },
              child: Text(
                AppTranslations.more,
                style:
                getUnderLine(color: AppColors.primary, fontSize: 14.sp),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: getHeightSize(context) * 0.01,
      ),
      SizedBox(
          height: getHeightSize(context) * 0.3,
          child: ListView.builder(
            itemBuilder: (context, index) =>
                CustomBagContainer(
                  suitcase: cubit.homeModel?.data?.suitcases?[index],
                    isLast: index == 2),
            itemCount: cubit.homeModel?.data?.suitcases?.length,

            scrollDirection: Axis.horizontal,
          ))
    ],
  ); },);
  }
}

class CustomBagContainer extends StatelessWidget {
   CustomBagContainer({
    this.isLast = false,
    this.isHome = true,
    this.suitcase,
    super.key,
  });
  final bool isLast;
  final bool isHome;
  Suitcase? suitcase;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: getHorizontalPadding(context),
          end: isLast ? getHorizontalPadding(context) : 0,
          bottom: getHeightSize(context) * 0.01),
      child: CustomContainerWithShadow(
          width: isHome ? getWidthSize(context) * 0.55 : getWidthSize(context),
          height: isHome ? null : getHeightSize(context) * 0.3,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: CustomNetworkImage(
                  //"https://media.istockphoto.com/id/1859856017/fi/valokuva/nopea-internet-yhteys-nopeustestaa-verkon-kaistanleveystekniikka-mies-joka-k%C3%A4ytt%C3%A4%C3%A4-nopeaa.jpg?s=1024x1024&w=is&k=20&c=ffjK54jdpR-8egYRmNMGzFqWEh42B9HSAEO1_waKD0U=",
                 // fit: BoxFit.cover,
                  width: isHome
                      ? getWidthSize(context) * 0.55
                      : getWidthSize(context),
                  height: getHeightSize(context) * 0.2, image: suitcase?.image.toString()??"",
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getHorizontalPadding(context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        // AppTranslations.newOffers +
                        //     " " +
                            // AppTranslations.newOffers +
                            // " " +
                            // AppTranslations.newOffers +
                        suitcase?.title.toString()??"",
                        maxLines: 1,
                        style: getMediumStyle(fontSize: 14.sp),
                      ),
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: AutoSizeText(
                              maxLines: 1,
                              suitcase?.price.toString()??"",
                              // AppTranslations.newOffers,
                              style: getRegularStyle(
                                  color: AppColors.grey, fontSize: 14.sp),
                            ),
                          ),
                          // Icon(
                          //   CupertinoIcons.heart,
                          //   color: AppColors.primary,
                          //   size: 25.sp,
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
