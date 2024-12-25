import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/features/accommodation/view/booking_accommodation/screens/widgets/linear_progress.dart';
import 'package:travel_club/features/main_screen/cubit/cubit.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/accomendation_cubit.dart';

class DonePaymentScreen extends StatelessWidget {
  const DonePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccomendationCubit, AccomendationState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
          appbarTitle: AppTranslations.paymentProcess,
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
                LinearProgress(
                  value: 1,
                ),
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
                  AppTranslations.bookingSuccessMessage + '${917897291}',
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
                SizedBox(
                  width: getWidthSize(context) / 2,
                  child: CustomButton(
                    title: AppTranslations.goToBookings,
                    onTap: () {
                      context.read<MainCubit>().changePage(1);
                      Navigator.pushNamed(context, Routes.mainRoute);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
