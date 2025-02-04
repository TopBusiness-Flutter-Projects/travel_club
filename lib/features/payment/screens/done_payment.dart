import 'package:travel_club/features/main_screen/cubit/cubit.dart';
import 'package:travel_club/features/my_bookings/cubit/my_bookings_cubit.dart';
import 'package:travel_club/features/payment/cubit/payment_cubit.dart';
import 'package:travel_club/features/payment/data/models/check_payment_status_model.dart';

import '../../../core/exports.dart';
import '../../residence/cubit/residence_cubit.dart';

class DonePaymentScreen extends StatelessWidget {
  const DonePaymentScreen({
    super.key,
    required this.paymentModel,
  });
  final PaymentModel paymentModel;
  @override
  Widget build(BuildContext context) {
   return WillPopScope(
          onWillPop: () async {
            context.read<MainCubit>().changePage(0);
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.mainRoute,
              (route) => false,
            );
            return false;
          },
          child: CustomScreen(
            appbarTitle: AppTranslations.paymentProcess,
            appBarOnPresses: () {
              context.read<MainCubit>().changePage(0);
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.mainRoute,
                (route) => false,
              );
            },
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20.h,
                  ),
                  //linear done
                  // if (isFood == false) ...[
                  //   LinearProgress(
                  //     value: 1,
                  //   ),
                  // ],
                  SizedBox(
                    height: getHeightSize(context) / 4,
                  ),
                  //image
                  Center(child: SvgPicture.asset(AppIcons.correctGreen)),
                  SizedBox(
                    height: 10.h,
                  ),
                  //text
                  Text(
                    AppTranslations.bookingSuccess,
                    style: getSemiBoldStyle(
                      fontSize: 20.sp,
                      color: AppColors.green,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //message
                  Text(
                    AppTranslations.bookingSuccessMessage +
                        '${paymentModel.transactionId.toString()}',
                    style: getMediumStyle(
                      fontSize: 14.sp,
                      color: AppColors.grey,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  //custom button
     
                  CustomButton(
                    width: getWidthSize(context) / 2,
                    title: AppTranslations.goToBookings,
                    onTap: () {
                      context.read<MyReservationsCubit>().selectedModuleId =  context.read<PaymentCubit>().currentModuleId;
                      context.read<MainCubit>().changePage(1);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.mainRoute,
                        (route) => false,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
  }
}
