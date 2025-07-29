import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/widgets/no_data_widget.dart';
import '../../../../../../config/routes/app_routes.dart';
import '../../../../../core/widgets/show_loading_indicator.dart';
import '../../../cubit/my_bookings_cubit.dart';
import '../../../cubit/my_bookings_state.dart';
import '../widgets/big_container_entertainment.dart';




//body
class EntertainmentBookingBody extends StatelessWidget {
  EntertainmentBookingBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MyReservationsCubit>();

    // TODO: implement build
    return BlocBuilder<MyReservationsCubit, MyReservationsState>(
      builder: (context, state) {
      return  Expanded(
        child:cubit.entertainmentReservationModel.data == null
            ? Center(
          child: CustomLoadingIndicator(),
        )
            : cubit.entertainmentReservationModel.data!.reservations!.isEmpty
            ? Center(
          child: NoDataWidget(title: 'no_reservation'.tr()),
        )
            : SingleChildScrollView(
          child: Column(
            children:[
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: cubit.entertainmentReservationModel.data!.reservations?.length??0,
                itemBuilder: (BuildContext context, int index) {
                  return    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, Routes.detailsBookingEntertainment,
                            arguments: cubit.entertainmentReservationModel.data!.reservations![index]
                        );
                      },
                      child: CustomBookingEntertainmentContainerBig(entertainmentModel: EntertainmentModel(
                          numofnights: cubit.entertainmentReservationModel.data!.reservations![index].process.toString(),
                          price:cubit.entertainmentReservationModel.data!.reservations![index].totalPrice.toString(),
                          title:cubit.entertainmentReservationModel.data!.reservations![index].wayService.toString(),
                          date: cubit.entertainmentReservationModel.data!.reservations![index].date.toString(),
                          rate: cubit.entertainmentReservationModel.data!.reservations![index].rate,
                          numOfBooking: cubit.entertainmentReservationModel.data!.reservations![index].transactionId.toString() ,
                          status:true
                      ),));
                },),
            ]
          ),
        ),
      );
    });
  }
}
