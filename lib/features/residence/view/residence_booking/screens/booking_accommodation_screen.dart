
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/residence/cubit/residence_cubit.dart';
import 'package:travel_club/features/residence/view/residence_booking/screens/widgets/custom_container_booking.dart';
import 'package:travel_club/features/residence/view/residence_booking/screens/widgets/custom_member_widget.dart';
import 'package:travel_club/features/residence/view/residence_booking/screens/widgets/custom_rounded_button.dart';
import '../../../../transportation/cubit/transportation_cubit.dart';
import '../../../../transportation/screens/widgets/custom_from_to_date.dart';
class AccommodationBooking extends StatefulWidget {
  const AccommodationBooking({super.key});
  @override
  State<AccommodationBooking> createState() => _AccommodationBookingState();
}
class _AccommodationBookingState extends State<AccommodationBooking> {
  @override
  //
 bool isSend=false;
  void initState() {
    isSend=false;
    context.read<ResidenceCubit>().sum=0;
    context.read<ResidenceCubit>().selectedRooms=[];
    context.read<ResidenceCubit>().lodgesRoomsModel.data=null;
    // TODO: implement initState
    context.read<TransportationCubit>().goOnly=false;
 //   context.read<AccomendationCubit>().getRoomsLodges(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<ResidenceCubit>();
   return BlocBuilder<ResidenceCubit,ResidenceState>(builder: (BuildContext context, state) {
     return CustomScreen(
     //   onTapp: (){
     //   Navigator.pushNamed(context, Routes.bestChoosenScreen);
     // },
       isBooking: true,appbarTitle: AppTranslations.booking,
       body:
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             SizedBox(height: 20.h,),
             //text
             Text(AppTranslations.selectGoingAndReturn,style: getMediumStyle(fontSize: 14.sp),),
             SizedBox(height: 20.h,),
//custom member
             const CustomMemberWidget(),
SizedBox(height: 10.h,),
//from and to date
             const CustomFromToDate(),
             SizedBox(height: 20.h,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               //crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 if(isSend||cubit.lodgesRoomsModel.data!=null)...[
                   Text(AppTranslations.chooseTheBestOption,style: getMediumStyle(fontSize: 14.sp),),
                   Spacer(),
                 ],
                 Center(
                   child: SizedBox(
                     width: 179.w,
                     child: CustomButton(title: AppTranslations.showHotels,width: 179.w,
                       onTap: (){
                       setState(() {
                         isSend=true;
                       });
                       print("send");
                     cubit.getRoomsLodges(context: context);
                     },
                     ),
                   ),
                 )
               ],
             ),
             //custom contanier
             !isSend?Container():
             cubit.lodgesRoomsModel.data==null?Expanded(child: const Center(child: CustomLoadingIndicator(),)):
             Expanded(
               child: ListView.builder(
                 shrinkWrap: true,
                 itemCount: cubit.lodgesRoomsModel.data?.length,
                 itemBuilder: (BuildContext context, int index) {
                   return CustomContainerBooking(
                     room: cubit.lodgesRoomsModel.data?[index],
                     widgetBottom:  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("السعر ل ٤ ليالي",style: getRegularStyle(fontSize: 14.sp,color: AppColors.grey),),
                           Text('${cubit.lodgesRoomsModel.data?[index].totalPrice}'+" "+AppTranslations.currency,style: getSemiBoldStyle(fontSize: 16.sp,color: AppColors.primary),),
                           Text(AppTranslations.withoutTax,style: getRegularStyle(fontSize: 12.sp,color:AppColors.grey ),),
                         ],),
                       CustomRoundedButton(
                         isBooking: true,
                         icon:
                         cubit.selectedRooms.any((room) => room.id == cubit.lodgesRoomsModel.data?[index].id)
                         ?Icons.remove: Icons.add ,
                         title:  cubit.selectedRooms.any((room) => room.id == cubit.lodgesRoomsModel.data?[index].id)
                             ?AppTranslations.remove:AppTranslations.add  ,onTap: (){
                         cubit.addOrRemoveRoom(cubit.lodgesRoomsModel.data![index] );
                         //       Navigator.pushNamed(context, Routes.secondBookingAccommodation);
                       },
                       )                          ],),);
                 },
               ),
             ),
           ],
         ),

       ),

       widget:
          !isSend?null:cubit.selectedRooms.isEmpty?null:
       CustomContainerWithShadow(
           height: 74.h,
           child:
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Text(cubit.sum.toString(),style: getSemiBoldStyle(fontSize: 16.sp),),

               CustomButton(title: AppTranslations.bookNow,width: 179.w,onTap: (){
                 Navigator.pushNamed(context, Routes.bestChoosenScreen);
               },)
             ],)
       ),
     );
   },);
  }
}
