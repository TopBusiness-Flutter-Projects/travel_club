// ignore_for_file: deprecated_member_use

import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/features/location/screens/transportation_map.dart';

class TransportationMapScreen extends StatefulWidget {
  const TransportationMapScreen({super.key});
  @override
  State<TransportationMapScreen> createState() =>
      _TransportationMapScreenState();
}

class _TransportationMapScreenState extends State<TransportationMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: getHeightSize(context),
        child: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                height: getHeightSize(context),
                child: TransportationMap()),
            Column(children: [
              SizedBox(height: getVerticalPadding(context) * 2),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getHorizontalPadding(context)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackButton(),
                      Text(
                        AppTranslations.transportation,
                        style: getSemiBoldStyle(
                            color: AppColors.black, fontSize: 16.sp),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                    ]),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getHorizontalPadding(context) * 2.5),
                child: CustomButton(
                    title: AppTranslations.transportationResults,
                    onTap: () {
                      Navigator.pushNamed(
                          context, Routes.transportationMenuRoute);
                    }),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
