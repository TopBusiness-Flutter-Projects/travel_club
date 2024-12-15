import 'package:pinput/pinput.dart';
import 'package:travel_club/features/auth/cubit/cubit.dart';
import 'package:travel_club/features/auth/cubit/state.dart';

import '../../../../core/exports.dart';

class PinInputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

var cubit= context.read<LoginCubit>();
    return BlocBuilder<LoginCubit,LoginState>(builder: (BuildContext context, state) { return Pinput(
      controller: cubit.pinController, // Attach the controller
      length: 5,
      defaultPinTheme: PinTheme(
        width: 70.w,
        height: 70.w,
        textStyle: getMediumStyle(
          fontSize: 14.sp,
          color: AppColors.secondPrimary,
        ),
        decoration: BoxDecoration(
          color: AppColors.lightWhite2,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.lightWhite2, width: 2),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 70.w,
        height: 70.w,
        textStyle: getMediumStyle(
          fontSize: 14.sp,
          color: AppColors.primary,
        ),
        decoration: BoxDecoration(
          color: AppColors.lightWhite2,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary, width: 2),
        ),
      ),
      showCursor: true,
      onCompleted: (pin) {
        print("Entered PIN: $pin");
      },
    ); }, );
  }
}
