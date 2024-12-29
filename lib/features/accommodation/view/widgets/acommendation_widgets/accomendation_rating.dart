import 'package:flutter/cupertino.dart';
import 'package:flutter_rating/flutter_rating.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/accomendation_cubit.dart';

class HotelsModel {
  final String title;
  final String? discription;
  final String image;
  final int rate;
  final bool? isFavorite;
  bool? isFavoriteTrue;


  HotelsModel(
      {this.isFavoriteTrue = false,
      required this.title,
      required this.rate,
      this.isFavorite = true,
      this.discription,
      required this.image,
      });
}

class CustomWidgetRating extends StatefulWidget {
  const CustomWidgetRating({super.key, required this.hotelsModel});
  final HotelsModel? hotelsModel;

  @override
  State<CustomWidgetRating> createState() => _CustomWidgetRatingState();
}

class _CustomWidgetRatingState extends State<CustomWidgetRating> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.detailsAccomendation);
          },
          child: CustomContainerWithShadow(
            child: Row(children: [
              //stack image and heart
              Stack(
                children: [
                  Container(
                    height: getHeightSize(context) * 0.23,
                    width: getWidthSize(context) * 0.4,
                    decoration: BoxDecoration(
                        color: AppColors.white,

                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                            image: NetworkImage(
                                widget.hotelsModel?.image.toString()??""),
                            fit: BoxFit.cover)),
                  ),
                  widget.hotelsModel?.isFavorite==true?
                  Positioned(
                      top: 4.h,
                      right: 6.w,
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            widget.hotelsModel!.isFavoriteTrue = !(widget.hotelsModel!.isFavoriteTrue ?? false);
                          });

                        },
                        child: CircleAvatar(
                          backgroundColor:  widget.hotelsModel?.isFavoriteTrue==true?AppColors.red: AppColors.lightWhite,
                          child: Icon(
                            CupertinoIcons.heart,
                            color:  widget.hotelsModel?.isFavoriteTrue==true?AppColors.white: AppColors.secondPrimary,
                            size: 25.sp,
                          ),
                        ),
                      )
                  ):Container()
                ],
              ),
              //  SizedBox(width: 5.w,),
              //
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 10.h,),
                      Text(widget.hotelsModel?.title.toString()??"",overflow: TextOverflow.ellipsis,style: getSemiBoldStyle(fontSize: 14.sp),maxLines: 2,),

                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          StarRating(
                              rating: widget.hotelsModel?.rate.toDouble()??1,
                              allowHalfRating: false, size: 14.sp,
                              onRatingChanged: (rating){
                                //   => setState(() => this.rating = rating
                              }),
                        ],
                      ),
                      SizedBox(height: 2.h,),
                      widget.hotelsModel?.discription==null?SizedBox():
                      Text(widget.hotelsModel?.discription.toString()??"",style: getMediumStyle(fontSize: 12.sp,color: AppColors.grey),),
                    ],
                  ),
                ),
              )
            ],),
          ),
        ));
  }
}
