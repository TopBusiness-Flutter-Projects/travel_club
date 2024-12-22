import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/features/accommodation/view/booking_accommodation/screens/widgets/linear_progress.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/accomendation_cubit.dart';

class PaymentProcessScreen extends StatelessWidget {
  const PaymentProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccomendationCubit,AccomendationState>(builder: (BuildContext context, state) {  return  CustomScreen(
      appbarTitle:  AppTranslations.paymentProcess,
      body:Column(
        children: <Widget>[
          SizedBox(height: 30.h,),
          //process
          LinearProgress(value: .50,),
          SizedBox(height: 30.h,),
//button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              title:AppTranslations.payNow,
              onTap: (){
Navigator.pushNamed(context, Routes.donePayment );
            },),
          )
        ],
      ),

    );
    },);
  }
}
