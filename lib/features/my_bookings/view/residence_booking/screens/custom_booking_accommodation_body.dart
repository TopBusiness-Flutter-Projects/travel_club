import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../../config/routes/app_routes.dart';

import '../../../../../core/widgets/show_loading_indicator.dart';
import '../../../cubit/my_bookings_cubit.dart';
import '../../../cubit/my_bookings_state.dart';
import '../widgets/big_container.dart';



//body
class AccommodationBookingBody extends StatefulWidget {
  AccommodationBookingBody({super.key});

  @override
  State<AccommodationBookingBody> createState() => _AccommodationBookingBodyState();
}

class _AccommodationBookingBodyState extends State<AccommodationBookingBody> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<MyReservationsCubit>();
    return BlocBuilder<MyReservationsCubit, MyReservationsState>(builder: (BuildContext context, state) {
      return
      cubit.residenceReservationModel?.data==null?
      Expanded(
        child: Center(
          child: CustomLoadingIndicator(),
        ),
      ):
      cubit.residenceReservationModel?.data?.reservations?.isEmpty??false?Center(child: Text('لا يوجد حجوزات'),):
       Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: cubit.residenceReservationModel?.data!.reservations?.length??0,
        itemBuilder: (BuildContext context, int index) {
          return    GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, Routes.detailsBooking);
              },
              child: CustomBookingAccommodationContainerBig(residenceReservationModel: cubit.residenceReservationModel?.data!.reservations?[index],));
        },),
    );
      },);
    // TODO: implement build
  }
}
