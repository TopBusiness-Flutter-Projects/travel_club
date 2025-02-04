//small conatiner
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../../core/exports.dart';
import '../../../data/models/transportation_reservation_model.dart';

class CustomBookingTransportationContainerSmall extends StatelessWidget {
  const CustomBookingTransportationContainerSmall({super.key, this.isDetails =true,required this.transportationReservation});
  final TransportationReservation transportationReservation;

 final bool isDetails;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      } ,
      child: CustomContainerWithShadow(
        border: true,
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100.h,
              width: 120.w,
              decoration: BoxDecoration(
                 // color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          transportationReservation.companyImage.toString()??""),
                      fit: BoxFit.cover)),
            ),
          ),
          //
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(transportationReservation.bus.toString()??"",overflow: TextOverflow.ellipsis,style: getSemiBoldStyle(fontSize: 14.sp),maxLines: 2,),
                SizedBox(height: 20.h,),
                //row
                if(isDetails)...[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transportationReservation.capacity.toString()+""+AppTranslations.seats,style: getMediumStyle(fontSize: 12.sp,color: AppColors.lbny),),
                        //   Spacer(),
                        //  SizedBox(width: 30.w,),

                          Text(transportationReservation.departureTime.toString(),style: getBoldStyle(fontSize: 14.sp,color: AppColors.primary),),
                        ]),
                  ),
                ],

                SizedBox(height: 2.h,),

              ],
            ),
          )
        ],),
      ),
    );
  }
}