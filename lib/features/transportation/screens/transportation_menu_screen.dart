// ignore_for_file: deprecated_member_use

import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/features/location/screens/transportation_map.dart';
import 'package:travel_club/features/transportation/screens/widgets/custom_company_container.dart';

class TransportationMenuScreen extends StatefulWidget {
  const TransportationMenuScreen({super.key});
  @override
  State<TransportationMenuScreen> createState() =>
      _TransportationMenuScreenState();
}

class _TransportationMenuScreenState extends State<TransportationMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
        appbarTitle: AppTranslations.transportation,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: getVerticalPadding(context)),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
            child: Text(AppTranslations.companiesMenu,
                style: getRegularStyle( fontSize: 14.sp)),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => CustomCompanyContainer())),
        ]));
  }
}
