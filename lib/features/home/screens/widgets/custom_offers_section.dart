import 'package:flutter/cupertino.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/network_image.dart';

import '../../cubit/home_cubit.dart';
import '../../cubit/home_state.dart';
import '../../data/models/home_model.dart';

class CustomOffersSection extends StatelessWidget {
  const CustomOffersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
  return BlocBuilder<HomeCubit, HomeState>(builder: (BuildContext context, state) {
    return Column(
    children: [
      Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppTranslations.newOffers,
                style: getBoldStyle(fontSize: 16.sp)),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/offers');
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
          height: getHeightSize(context) * 0.34,
          child: ListView.builder(
            itemBuilder: (context, index) => CustomOffersContainer(
              isLast: index == 2,
              offerModel:cubit.homeModel.data?.offers?[index] ,
            ),
            itemCount: cubit.homeModel.data?.offers?.length,
            scrollDirection: Axis.horizontal,
          ))
    ],
  );
    },);
  }
}

class CustomOffersContainer extends StatelessWidget {
   CustomOffersContainer({
    this.isLast = false,
    this.isHome = true,


    this.offerModel,
    super.key,

  });
  final bool isLast;
  final bool isHome;
  Offer? offerModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (BuildContext context, state) { return Padding(
      padding: EdgeInsetsDirectional.only(
          start: getHorizontalPadding(context),
          end: isLast ? getHorizontalPadding(context) : 0,
          bottom: getHeightSize(context) * 0.01),
      child: CustomContainerWithShadow(
          width: isHome ? getWidthSize(context) * 0.8 : null,
          height: isHome ? null : getHeightSize(context) * 0.34,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: CustomNetworkImage(
                  //"https://media.istockphoto.com/id/1859856017/fi/valokuva/nopea-internet-yhteys-nopeustestaa-verkon-kaistanleveystekniikka-mies-joka-k%C3%A4ytt%C3%A4%C3%A4-nopeaa.jpg?s=1024x1024&w=is&k=20&c=ffjK54jdpR-8egYRmNMGzFqWEh42B9HSAEO1_waKD0U=",
                  // "https://lotel.efaculty.tech/storage/cities/85531735112807.webp",
                 // fit: BoxFit.cover,
                  width: isHome
                      ? getWidthSize(context) * 0.8
                      : getWidthSize(context),
                  height: getHeightSize(context) * 0.2, image: offerModel?.image??"",
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
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: AutoSizeText(
                              maxLines: 1,
                              offerModel?.title??"",
                              style: getMediumStyle(fontSize: 14.sp),
                            ),
                          ),
                          // Icon(
                          //   CupertinoIcons.heart,
                          //   color: AppColors.primary,
                          //   size: 25.sp,
                          // )
                        ],
                      ),
                      AutoSizeText(
                        // AppTranslations.newOffers +
                        //     " " +
                        // AppTranslations.newOffers +
                        // " " +
                        // AppTranslations.newOffers +
                        offerModel?.description??""  ,
                        maxLines: 2,
                        style: getRegularStyle(
                            color: AppColors.grey, fontSize: 14.sp),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    ); },);
  }
}
