import 'package:flutter/cupertino.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/residence/view/screens/lodge_details.dart';

import '../../../../../core/exports.dart';
import '../../../data/models/lodges_model.dart';

class HotelsModel {
  final String title;
  final String? discription;
  final String image;
  final int rate;
  final int? id;
  final bool? isFavorite;
  bool? isFavoriteTrue;

  HotelsModel({
    this.isFavoriteTrue = false,
    required this.title,
    this.id,
    required this.rate,
    this.isFavorite = true,
    this.discription,
    required this.image,
  });
}

class CustomLodgeContainer extends StatefulWidget {
  const CustomLodgeContainer({super.key, required this.lodgesModel});
  final LodgeModel lodgesModel;

  @override
  State<CustomLodgeContainer> createState() => _CustomLodgeContainerState();
}

class _CustomLodgeContainerState extends State<CustomLodgeContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.lodgeDetailsRoute,
                arguments:
                    LodgeDetailsArguments(lodgeId: widget.lodgesModel.id!));
          },
          child: CustomContainerWithShadow(
            height: getHeightSize(context) * 0.17,
            child: Row(
              children: [
                //stack image and heart
                Stack(
                  children: [
                    CustomNetworkImage(
                      image: widget.lodgesModel?.media ?? "",
                      borderRadius: 20.r,
                      width: getWidthSize(context) * 0.3,
                      height: getHeightSize(context) * 0.17,
                    ),
                    widget.lodgesModel?.isFav == true
                        ? Positioned(
                            top: 4.h,
                            right: 6.w,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  // widget.hotelsModel!.isFavoriteTrue = !(widget.hotelsModel!.isFavoriteTrue ?? false);
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor:
                                    widget.lodgesModel?.isFav ?? false
                                        ? AppColors.red
                                        : AppColors.lightWhite,
                                child: Icon(
                                  CupertinoIcons.heart,
                                  color: widget.lodgesModel?.isFav ?? false
                                      ? AppColors.white
                                      : AppColors.secondPrimary,
                                  size: 25.sp,
                                ),
                              ),
                            ))
                        : Container()
                  ],
                ),
                //  SizedBox(width: 5.w,),
                //
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 3,
                          child: SizedBox(),
                        ),
                        Text(
                          widget.lodgesModel?.name.toString() ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(fontSize: 14.sp),
                          maxLines: 2,
                        ),
                        Flexible(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Row(
                          children: [
                            StarRating(
                                rating: double.parse(
                                    (widget.lodgesModel.rate ?? 0.0)
                                        .toString()),
                                allowHalfRating: false,
                                size: 14.sp,
                                onRatingChanged: (rating) {
                                  //   => setState(() => this.rating = rating
                                }),
                          ],
                        ),
                        Flexible(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        widget.lodgesModel?.users == null
                            ? SizedBox()
                            : Text(
                                '${widget.lodgesModel?.users.toString() ?? ""}' +
                                    " " +
                                    AppTranslations.personRating,
                                style: getMediumStyle(
                                    fontSize: 12.sp, color: AppColors.grey),
                              ),
                        Flexible(
                          flex: 2,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
