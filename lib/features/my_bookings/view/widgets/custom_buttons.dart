import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/my_bookings/cubit/my_bookings_cubit.dart';

import 'show_rate_bottom_sheet.dart';

class RateReservationButton extends StatelessWidget {
  const RateReservationButton({
    super.key, required this.reservationId,required this.id
  });
  final int reservationId;
  final int id;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      isBordered: true,
      title: AppTranslations.experienceEvaluation,
      onTap: () {
        showAddRateBottomSheet(context, reservationId: reservationId, id: id);
      },
    );
  }
}

class CancelReservationButton extends StatelessWidget {
  const CancelReservationButton({
    super.key,
    required this.reservationid,
  });

  final int reservationid;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MyReservationsCubit>();
    return CustomButton(
      isBordered: true,
      title: AppTranslations.cancelBooking,
      onTap: () {
        cubit.cancelReservation(context, reservationId: reservationid);
      },
    );
  }
}
