import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/core/widgets/custom_button.dart';

import '../../../../../core/exports.dart';

class CustomContainerFood extends StatelessWidget {
  CustomContainerFood({super.key,this.isDetails,this.isBooking});
  bool ?isDetails;
  bool ?isBooking=true;

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithShadow(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(width:5.w,),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("مطعم صبحي كابر روض الفرج",style: getSemiBoldStyle(fontSize: 14.sp,),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("200"+AppTranslations.personRateCompany,style:
                            isDetails==true?
                            getMediumStyle(fontSize: 12.sp,color: AppColors.grey):
                            getUnderLine(color: AppColors.primary,fontSize: 12.sp),maxLines: 1,),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               children: [
                                 SvgPicture.asset(AppIcons.point),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 7.0,right: 7.0),
                                   child: Text("مفتوح الان",style: getMediumStyle(fontSize: 12.sp,color: AppColors.green),),
                                 )
                             ]),
                           ),
                          ],
                        ),
                        Row(
                          children: [
                          SvgPicture.asset(AppIcons.location),
                            Flexible(child: Text("٢٠ شارع الملك الصالح / العين السخنه /مصر",maxLines: 2,style: getRegularStyle(fontSize: 12.sp),)),
                            SizedBox(width: 5.w,),
                             isBooking==false?Flexible(child: Container()):
                            Flexible(child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CustomButton(title: 'حجز طاولة',onTap: (){
                                Navigator.pushNamed(context, Routes.bookTable);

                              },),
                            ))
                        ]),

                      ],
                    )
                  ],),
              ),
            )
          ],));
  }
}
