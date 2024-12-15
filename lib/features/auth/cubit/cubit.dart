import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/remote/service.dart';

import '../../../core/exports.dart';
import '../data/login_repo_impl.dart';
import 'state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(LoginStateInitial());
  LoginRepoImpl api;
  //login
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController phoneControllerForgetPass = TextEditingController();
  late TextEditingController passwordControllerLogin = TextEditingController();
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  //forget pass
  GlobalKey<FormState> formKeyForgetPass = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyNewPass = GlobalKey<FormState>();
  //sign up
  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController phoneControllerSignUp = TextEditingController();
  late TextEditingController passwordControllerSignUp = TextEditingController();
  //otp screen
  int secondsRemaining = 60;
  late Timer timer;
  final TextEditingController pinController = TextEditingController(); // Controller for PIN input
//start time
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // if (secondsRemaining > 0) {
      //   secondsRemaining--;
      //   emit(StartTimer());
      // } else {
      //   resetPin();
      // }
      if(secondsRemaining > 0){
        secondsRemaining--;
        emit(StartTimer());
      }

    });
  }
//reset pin
  void resetPin() {
    if(secondsRemaining==0){
      timer.cancel();
      secondsRemaining = 60; // Reset the timer
      pinController.clear(); // 45Clear the PIN input// Stop the timer
      emit(ResetPin());
      startTimer(); // Restart the timer
    }

  }
}
