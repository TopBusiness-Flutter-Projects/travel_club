import 'package:flutter_rating/flutter_rating.dart';

import '../../../../core/exports.dart';

class CustomContainerCompanies extends StatelessWidget {
   CustomContainerCompanies({super.key,this.isDetails});
 bool ?isDetails;
  @override
  Widget build(BuildContext context) {
    return CustomContainerWithShadow(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(ImageAssets.logoImage,height: 61.h,width: 60.w,),
          ),
          SizedBox(width:5.w,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("شركة سيكرت ترافيل",style: getSemiBoldStyle(fontSize: 14.sp,),),
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    Row(
                      children: [
                        StarRating(
                            rating: 4, size: 14.sp,
                            allowHalfRating: false,
                            onRatingChanged: (rating){
                              //   => setState(() => this.rating = rating
                            }),
                      ],
                    ),
                    SizedBox(width: 5.w,),
                    Flexible(child: Text("200"+AppTranslations.personRateCompany,style:
                    isDetails==true?
                    getMediumStyle(fontSize: 12.sp,color: AppColors.grey):
                    getUnderLine(color: AppColors.primary,fontSize: 12.sp),maxLines: 1,))
                  ],)
              ],),
          )
        ]
          ,
        )
    );
  }
}
