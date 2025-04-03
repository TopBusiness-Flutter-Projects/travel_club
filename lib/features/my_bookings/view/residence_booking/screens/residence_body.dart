import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/my_bookings/view/residence_booking/screens/details_screen.dart';

import '../../../cubit/my_bookings_cubit.dart';
import '../../../cubit/my_bookings_state.dart';
import '../widgets/big_container.dart';

//body
class ResidenceReservedBody extends StatefulWidget {
  const ResidenceReservedBody({super.key});

  @override
  State<ResidenceReservedBody> createState() => _ResidenceReservedBodyState();
}

class _ResidenceReservedBodyState extends State<ResidenceReservedBody> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MyReservationsCubit>();
    return BlocBuilder<MyReservationsCubit, MyReservationsState>(
      builder: (BuildContext context, state) {

        return Expanded(
          child: cubit.residenceReservationModel?.data == null
              ? Center(
                  child: CustomLoadingIndicator(),
                )
              : cubit.residenceReservationModel?.data!.reservations!.isEmpty??false
                  ? Center(
                      child: Text('no_reservation'.tr()),
                    )
                  : SingleChildScrollView(
                    child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 90.h),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: cubit.residenceReservationModel?.data!
                                  .reservations!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, Routes.detailsReservationResidence,
                                          arguments:
                                              ResidenceDetailsBookingArguments(
                                                  residenceReservationModel: cubit
                                                      .residenceReservationModel
                                                      !.data!
                                                      .reservations![index]));
                                    },
                                    child: CustomBookingAccommodationContainerBig(
                                      residenceReservationModel: cubit
                                          .residenceReservationModel
                                          !.data!
                                          .reservations![index],
                                      goTolodgeDetails: false,
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),
                  ),
        );
      },
    );
    // TODO: implement build
  }
}
