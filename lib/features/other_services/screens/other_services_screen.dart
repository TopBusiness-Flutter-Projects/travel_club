// ignore_for_file: deprecated_member_use

import 'package:travel_club/core/exports.dart';

class OtherServicesScreen extends StatefulWidget {
  const OtherServicesScreen({super.key});
  @override
  State<OtherServicesScreen> createState() => _OtherServicesScreenState();
}

class _OtherServicesScreenState extends State<OtherServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      body: Center(child: Text('Other Services Screen')),
    );
  }
}
