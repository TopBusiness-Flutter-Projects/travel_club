import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/routes/app_routes.dart';
import '../../../../../core/widgets/show_loading_indicator.dart';
import '../../../cubit/my_bookings_cubit.dart';
import '../../../cubit/my_bookings_state.dart';
import '../widgets/big_container_food.dart';




//body
class FoodBookingBody extends StatelessWidget {
  FoodBookingBody({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var cubit = context.read<MyReservationsCubit>();
  return BlocBuilder<MyReservationsCubit, MyReservationsState>(builder: (BuildContext context, state) {
    return  Expanded(
    child:cubit.foodReservationModel.data == null
        ? Center(
      child:  CustomLoadingIndicator(),
    )
        : cubit.foodReservationModel.data?.reservations?.isEmpty??true
        ? Center(
      child: Text('no_reservation'.tr()),
    )
        : SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: cubit.foodReservationModel.data?.reservations?.length??0,
                itemBuilder: (BuildContext context, int index) {
                  return    GestureDetector(
                      onTap: (){
          
                        Navigator.pushNamed(context, Routes.detailsBookingFood);
                      },
                      child: CustomBookingFoodContainerBig(
                        foodModel: FoodModel(
                          numofnights: cubit.foodReservationModel.data?.reservations?[index].process.toString()??"",
                          price: cubit.foodReservationModel.data?.reservations?[index].totalPrice??"0",
                          title: cubit.foodReservationModel.data?.reservations?[index].restaurant??"",
                          date:  cubit.foodReservationModel.data?.reservations?[index].date??"0",
                          rate:  cubit.foodReservationModel.data?.reservations?[index].rate,
                            numOfBooking: cubit.foodReservationModel.data?.reservations?[index].transactionId??"",
                            status:true),));
                },),
            ]
          ),
        ),
  );  },); }
}
