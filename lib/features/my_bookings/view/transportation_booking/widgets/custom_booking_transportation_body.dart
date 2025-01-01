import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../config/routes/app_routes.dart';



import '../../../cubit/my_bookings_cubit.dart';
import '../../../cubit/my_bookings_state.dart';
import 'big_container.dart';
//model
class TransportationBookingModel {
  final String title;
  final String? seatsNum;
  final String? time;
  final String? discription;
  final String? image;
  final bool? isFavorite;
  final void Function()? onTap;

  TransportationBookingModel(    {this.discription,required this.title,required this.seatsNum,required this.time,this.isFavorite=true,required this.image, this.onTap});
}

//body
class TransportationBookingBody extends StatelessWidget {
  TransportationBookingBody({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return BlocBuilder<MyBookingsCubit,MyBookingsState>(builder: (BuildContext context, state) { return  Expanded(
  child: SingleChildScrollView(
    child: Column(children: [
      ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return    GestureDetector(
              onTap: (){
                // Navigator.pushNamed(context, Routes.detailsBooking);
                 Navigator.pushNamed(context, Routes.detailsbookingTransportation);
              },
              child: CustomBookingTransportationContainerBig(ispaid: index%2==0,isDetails: true,));
        },),
      SizedBox(height: 100.h,)
    ],),
  )
); },);  }
}
