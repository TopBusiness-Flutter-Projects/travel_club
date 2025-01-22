import 'package:travel_club/core/widgets/custom_button.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/residence_cubit.dart';
import '../widgets/linear_progress.dart';

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
                    Navigator.pushNamed(context, Routes.doneBooking,
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
