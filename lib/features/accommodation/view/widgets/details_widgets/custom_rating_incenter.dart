import 'package:flutter_rating/flutter_rating.dart';

import '../../../../../core/exports.dart';

class CustomRatingIncenter extends StatelessWidget {
  const CustomRatingIncenter({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: getHeightSize(context) * 0.12,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AutoSizeText(
            "مراسي ريزورت العين السخنه البحر الاحمر",
            maxLines: 1,
            textAlign: TextAlign.center,
            style: getSemiBoldStyle(
              color: AppColors.secondPrimary,
              fontSize: 14.sp,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                Row(
                  children: [
                    StarRating(
                        rating: 4,
                        allowHalfRating: false,
                        onRatingChanged: (rating){
                          //   => setState(() => this.rating = rating
                        }),
                  ],
                ),
                SizedBox(height: 5.h,),
                AutoSizeText(
                  "٢٠٠ فرد قام بتقيم الفندق",
                  style: getUnderLine(
                    color: AppColors.primary,
                    fontSize: 12.sp,
                  ),

                )   ],),
              //     Spacer(),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, Routes.bookingAccomodation );
              }, child: Text("احجز الان",style: getSemiBoldStyle(color: AppColors.white,fontSize: 14.sp),),style:ElevatedButton.styleFrom(backgroundColor: AppColors.primary),)

            ],)

        ],
      ),
    );
  }
}
