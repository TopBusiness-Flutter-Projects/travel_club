import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/features/residence%20module/view/residence_booking/widgets/linear_progress.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/residence_cubit.dart';

class PaymentProcessScreen extends StatelessWidget {
  const PaymentProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResidenceCubit, ResidenceState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
          appbarTitle: AppTranslations.paymentProcess,
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 30.h,
              ),
              //process
              LinearProgress(
                value: .50,
              ),
              SizedBox(
                height: 30.h,
              ),
//button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  title: AppTranslations.payNow,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.donePayment,
                        arguments: false);
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
