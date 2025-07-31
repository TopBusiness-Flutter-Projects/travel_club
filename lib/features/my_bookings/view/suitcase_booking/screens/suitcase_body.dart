import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/no_data_widget.dart';
import 'package:travel_club/features/my_bookings/view/residence_booking/screens/details_screen.dart';

import '../../../cubit/my_bookings_cubit.dart';
import '../../../cubit/my_bookings_state.dart';
import '../widgets/big_container.dart';
import 'details_screen.dart';

//body
class SuitCaseReservedBody extends StatefulWidget {
  const SuitCaseReservedBody({super.key});

  @override
  State<SuitCaseReservedBody> createState() => _SuitCaseReservedBodyState();
}

class _SuitCaseReservedBodyState extends State<SuitCaseReservedBody> {
  @override
  void initState() {
   

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MyReservationsCubit>();
    return BlocBuilder<MyReservationsCubit, MyReservationsState>(
      builder: (BuildContext context, state) {

        return Expanded(
          child: cubit.suitcaseReservationModel?.data == null
              ? Center(
                  child: CustomLoadingIndicator(),
                )
              : cubit.suitcaseReservationModel?.data!.reservations?.isEmpty??false
                  ? Center(
                      child: NoDataWidget(title: 'no_reservation'.tr()),
                    )
                  : SingleChildScrollView(
                    child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 90.h),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: cubit.suitcaseReservationModel?.data!
                                  .reservations!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, Routes.suitcaseBookingDetailsRoute,
                                          arguments:
                                              SuitCaseDetailsBookingArguments(
                                                  suitcaseReservationModel: cubit
                                                      .suitcaseReservationModel
                                                      !.data!
                                                      .reservations![index]));
                                    },
                                    child: CustomBookingAccommodationContainerBig(
                                      suitcaseReservationModel: cubit
                                          .suitcaseReservationModel
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
