import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_club/features/my_bookings/data/models/transportation_reservation_model.dart';
import '../../../../../../config/routes/app_routes.dart';

import '../../../cubit/my_bookings_cubit.dart';
import '../../../cubit/my_bookings_state.dart';
import 'reserved_container.dart';


//body
class TransportationBookingBody extends StatelessWidget {
  TransportationBookingBody({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<MyReservationsCubit, MyReservationsState>(
      builder: (BuildContext context, state) {
        return Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return CustomTransportationReservedContainer(
                    transportationReservation:TransportationReservation()
                    ,
                 
                    isDetails: true,
                  );
                },
              ),
              SizedBox(
                height: 100.h,
              )
            ],
          ),
        ));
      },
    );
  }
}
