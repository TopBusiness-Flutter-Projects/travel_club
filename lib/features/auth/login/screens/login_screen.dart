import 'package:flutter/material.dart';
import 'package:travel_club/core/utils/app_colors.dart';

import '../../widgets/custom_container.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondPrimary,
      body:
        Column(children: [
          CustomContainer()
        ],)
      // Center(
      //   child: ElevatedButton(
      //       onPressed: () {
      //         Navigator.pushReplacementNamed(context, Routes.mainRoute);
      //       },
      //       child: const Text('Nav To Main Screen')),
      // ),
    );
  }
}
