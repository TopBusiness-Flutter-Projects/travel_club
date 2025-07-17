import 'package:flutter_html/flutter_html.dart';

import '../../../core/exports.dart';
import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<AccountCubit>();
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
            appbarTitle: AppTranslations.privacy,
            body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getVerticalPadding(context) * 3,
                        ),

                        Text(
                          AppTranslations.privacyAndSecurity,
                          style: getSemiBoldStyle(fontSize: 24.sp),
                        ),
                        SizedBox(
                          height: getVerticalPadding(context) * .5,
                        ),
                        if (state is GetSettingError )...[
                          Center(child: Text(state.error.toString()))

                        ]
                        //  Text("Error In Server please try again in another time")
                        else if (state is GetSettingLoading || cubit.getSettingModel.data == null)...[
                          Center(child: CustomLoadingIndicator())

                        ]
                        else...[
                            Html(
                              data:cubit.getSettingModel.data?.aboutUs?.toString()??"" ,
                            ),
                          ],

                        SizedBox(
                          height: getVerticalPadding(context) * 1,
                        ),
                        // Text(
                        //   AppTranslations.cancellationPolicy,
                        //   style: getSemiBoldStyle(fontSize: 24.sp),
                        // ),
                        // SizedBox(
                        //   height: getVerticalPadding(context) * .5,
                        // ),
                        // Text(
                        //   "وتنامت عدد مع. لقهر معركة لبلجيكا، ابح كل جوي. أسركارثة المشتّتون بل, وبعض وبداية الصفحة غزو قد, أي بحثتعداد الجن",
                        //   style: getMediumStyle(
                        //       fontSize: 14.sp, color: AppColors.grey),
                        // ),
                      ]),
                )));
      },
    );
  }
}
