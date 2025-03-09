import 'package:flutter/cupertino.dart';
import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/food/data/models/get_resturant_model.dart';
import '../../../core/exports.dart';
import '../../../core/widgets/custom_fav_widget.dart';
import '../cubit/food_cubit.dart';

class SmallContainerFood extends StatelessWidget {
  const SmallContainerFood({
    super.key,
    required this.resturantData,
  });

  final ResturantData resturantData;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FoodCubit>();
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (BuildContext context, state) {
        return CustomContainerWithShadow(
            color: AppColors.secondPrimary,
            reduis: 30.r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CustomNetworkImage(
                        image: resturantData.media ?? "",
                        borderRadius: 20.r,
                        height: getHeightSize(context) * .2,
                        width: double.infinity),
                    // cubit.isFavorite==true?
                    // resturantData.isFav == false
                    //     ?
                    // Positioned(
                    //         top: 4.h,
                    //         right: 6.w,
                    //         child: GestureDetector(
                    //           onTap: () {
                    //              cubit.changeFavourite(index!);
                    //           },
                    //           child: CircleAvatar(
                    //             backgroundColor: cubit.isFavoriteTrue == true
                    //                 ? AppColors.red
                    //                 : AppColors.lightWhite,
                    //             child: Icon(
                    //               CupertinoIcons.heart,
                    //               color: cubit.isFavoriteTrue == true
                    //                   ? AppColors.white
                    //                   : AppColors.secondPrimary,
                    //               size: 25.sp,
                    //             ),
                    //           ),
                    //         ))
                    //     : Positioned(
                    //         top: 4.h,
                    //         right: 6.w,
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             // cubit.changeFavourite(index!);
                    //           },
                    //           child: CircleAvatar(
                    //             backgroundColor: AppColors.red,
                    //             child: Icon(
                    //               CupertinoIcons.heart,
                    //               color: AppColors.white,
                    //               size: 25.sp,
                    //             ),
                    //           ),
                    //         )),
                    Positioned(
                        top: 4.h,
                        right: 6.w,
                        child:CustomFavWidget(
                          isFavScreen:  resturantData.isFav??false,
                          isFav: resturantData.isFav??false,
                          id:resturantData.id.toString(), )),
                    //image in bottom
                    Positioned(
                        bottom: -20.h,
                        left: 6.w,
                        child: CustomNetworkImage(
                          image: resturantData.logo ?? "",
                          borderRadius: 20.r,
                          width: 57.w,
                          height: 57.w,
                        ))
                    //:Container()
                  ],
                ),
              ],
            ));
      },
    );
  }
}
