import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_club/features/my_bookings/data/models/transportation_reservation_model.dart';
import '../../../../../core/widgets/show_loading_indicator.dart';
import '../../../cubit/my_bookings_cubit.dart';
import '../../../cubit/my_bookings_state.dart';
import '../widgets/reserved_container.dart';

//body
class TransportationReservedBody extends StatelessWidget {
  const TransportationReservedBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<MyReservationsCubit>();
    return BlocBuilder<MyReservationsCubit, MyReservationsState>(
      builder: (BuildContext context, state) {
        return Expanded(
            child:
            cubit.transportationReservationModel.data == null
                ? Center(
              child: CustomLoadingIndicator(),
            )
                : cubit.transportationReservationModel.data!.reservations!.isEmpty
                ? Center(
              child: Text('no_reservation'.tr()),
            )
                :
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount:  cubit.transportationReservationModel.data!.reservations!.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomTransportationReservedContainer(
                  transportationReservation: cubit.transportationReservationModel.data!.reservations![index] ,
                  isDetails: true,
                );
              },
            )
        );
      },
    );
  }
}
