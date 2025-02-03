//small conatiner
import '../../../../../../core/exports.dart';
import 'custom_booking_transportation_body.dart';

class CustomBookingTransportationContainerSmall extends StatelessWidget {
  const CustomBookingTransportationContainerSmall({super.key, this.isDetails =true});

 final bool isDetails;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child:GestureDetector(
          onTap: (){
            
          } ,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomContainerWithShadow(
              border: true,
              child: Row(children: [

                // image
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                        color: AppColors.white,

                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                            image: NetworkImage(
                               ""),
                            fit: BoxFit.cover)),
                  ),
                ),

                //
                Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SizedBox(height: 10.h,),
                        //title
                  
                        Text("title".toString()??"",overflow: TextOverflow.ellipsis,style: getSemiBoldStyle(fontSize: 14.sp),maxLines: 2,),
                        SizedBox(height: 20.h,),
                        //row
                        if(isDetails)...[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${"seatsNum".toString()??""}'+""+AppTranslations.seats,style: getMediumStyle(fontSize: 12.sp,color: AppColors.lbny),),
                                // Spacer(),
                                SizedBox(width: 10.w,),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(AppTranslations.morning+" "+'${"time".toString()??""}',style: getBoldStyle(fontSize: 14.sp,color: AppColors.primary),),
                                ),
                              ]),
                        ],

                        SizedBox(height: 2.h,),
                       
                        Text("discription".toString()??"",style: getMediumStyle(fontSize: 12.sp,color: AppColors.grey),),
                      ],
                    ),
                  ),
                )
              ],),
            ),
          ),
        )
    );
  }
}