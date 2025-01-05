import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_club/core/preferences/preferences.dart';
import 'package:travel_club/core/remote/service.dart';
import 'package:travel_club/core/utils/appwidget.dart';

import '../../../core/exports.dart';
import '../data/models/login_model.dart';
import '../data/login_repo_impl.dart';
import 'state.dart';

//ya29.a0ARW5m75XCuAi6zuyPKuHI-Y0anNF2A8jgdJjEw21BRvMneo1dz6YmaGSj-2mx2p264ym5XLZ9HjevPHjvbY7qSeJ8gC4Ckg7SBcCmCF10B69q8wuMsA9nw5woRRfydexChhj-k8slstayN-1wYjtQc5UIHFH7a-cRUauVxJ0UwaCgYKAW4SARMSFQHGX2MiiiHA8cakZ1f7WtPCKv-CBg0177
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(LoginStateInitial());
  LoginRepoImpl api;
  //login
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController phoneControllerForgetPass =
      TextEditingController();
  late TextEditingController passwordControllerLogin = TextEditingController();
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  //forget pass
  GlobalKey<FormState> formKeyForgetPass = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyNewPass = GlobalKey<FormState>();
  //sign up
  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyPinCode = GlobalKey<FormState>();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController phoneControllerSignUp = TextEditingController();
  late TextEditingController passwordControllerSignUp = TextEditingController();
  late TextEditingController confirmPasswordControllerSignUp =
      TextEditingController();
  //otp screen
  int secondsRemaining = 60;
  late Timer timer;
  final TextEditingController pinController =
      TextEditingController(); // Controller for PIN input
//start time
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // if (secondsRemaining > 0) {
      //   secondsRemaining--;
      //   emit(StartTimer());
      // } else {
      //   resetPin();
      // }
      if (secondsRemaining > 0) {
        secondsRemaining--;
        emit(StartTimer());
      }
    });
  }

//reset pin
  void resetPin() {
    if (secondsRemaining == 0) {
      timer.cancel();
      secondsRemaining = 60; // Reset the timer
      pinController.clear(); // 45Clear the PIN input// Stop the timer
      emit(ResetPin());
      startTimer(); // Restart the timer
    }
  }

  // Sign in with google
  String userGmail = '';
  String userPhoto = '';
  String userName = '';
  String? accessToken = '';
  Future<UserCredential?> signInWithGoogle() async {
    await signOutFromGmail();
    print("Starting Google Sign-In process...");

    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/userinfo.profile',
          'openid',
        ],
      );

      // Trigger Google Sign-In
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      print("Google Sign-In successful: ${googleUser != null}");

      // Handle user cancellation
      if (googleUser == null) {
        print("Google Sign-In was cancelled by the user.");
        emit(FailureSignInWithGoogleState(error: 'Sign-in cancelled by user'));
        return null;
      }

      // Retrieve authentication tokens
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      print("Access Token retrieved: ${googleAuth.accessToken != null}");
      print("Access Token retrieved: ${googleAuth.accessToken.toString()}");
      print("ID Token retrieved: ${googleAuth.idToken != null}");

      // Validate tokens
      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        print("Missing required authentication tokens.");
        emit(FailureSignInWithGoogleState(
            error: 'Missing authentication tokens'));
        throw Exception('Missing Google authentication tokens.');
      }

      // Create Firebase credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Store the access token locally if needed
      accessToken = googleAuth.accessToken;

      // Emit success state for Google Sign-In
      emit(SuccessSignInWithGoogleState());
      print("Firebase credential created successfully. Signing in...");

      try {
        // Sign in to Firebase with additional error handling
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        print(
            "Firebase Sign-In successful. User ID: ${userCredential.user?.uid}");
        return userCredential;
      } on FirebaseAuthException catch (e) {
        print("Firebase Auth Exception: ${e.code} - ${e.message}");
        emit(FailureSignInWithGoogleState(
          error: _getFirebaseErrorMessage(e.code),
        ));
        return null;
      }
    } on PlatformException catch (e) {
      print(
          "Platform Exception during Google Sign-In: ${e.code}, ${e.message}");
      emit(FailureSignInWithGoogleState(error: e.message));
    } catch (e) {
      print("Unexpected error during Google Sign-In: $e");
      emit(FailureSignInWithGoogleState(error: e.toString()));
    }

    return null;
  }

// Helper function to provide user-friendly error messages
  String _getFirebaseErrorMessage(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email address but different sign-in credentials.';
      case 'invalid-credential':
        return 'The credential data is malformed or has expired.';
      case 'operation-not-allowed':
        return 'Google sign-in is not enabled for this project.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'user-not-found':
        return 'No user found for this credential.';
      default:
        return 'An unknown error occurred during sign-in.';
    }
  }

  Future<GoogleSignInAccount?> signOutFromGmail() async {
    emit(LoadingSignOutGoogleState());
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signOut();

    emit(SuccessSignOutGoogleState());

    return googleUser;
  }

  String countryCode = '+20';
  // login
  LoginModel loginModel = LoginModel();
  login(BuildContext context) async {
    emit(LoadingLoginState());
    AppWidget.createProgressDialog(context, AppTranslations.loading);
    final response = await api.login(
      phone: countryCode.replaceFirst('+', '') + phoneController.text,
      password: passwordControllerLogin.text,
    );
    response.fold((l) {
      Navigator.pop(context);
      errorGetBar(AppTranslations.error);
      emit(FailureLoginState());
    }, (r) {
      print("code: ${r.status.toString()}");
      if (r.status != 200 && r.status != 201) {
        signOutFromGmail();
        Navigator.pop(context);
        errorGetBar(r.msg!);
      } else {
        loginModel = r;
        emit(SuccessLoginState());
        Navigator.pop(context);
        successGetBar(r.msg);
        prefs.setBool("ISLOGGED", true);
        Preferences.instance.setUser(r);

        ///
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.mainRoute, (route) => false);
      }
    });
  }

  // login
  register(BuildContext context, {bool isResend = false}) async {
    emit(LoadingLoginState());
    AppWidget.createProgressDialog(context, AppTranslations.loading);
    final response = await api.register(
        isCheckOtp: false,
        phone: countryCode.replaceFirst('+', '') + phoneController.text,
        password: passwordControllerSignUp.text,
        name: nameController.text,
        passwordConfirmation: confirmPasswordControllerSignUp.text);
    response.fold((l) {
      Navigator.pop(context);
      errorGetBar(AppTranslations.error);
      emit(FailureLoginState());
    }, (r) {
      Navigator.pop(context);
      print("code: ${r.status.toString()}");
      if (r.status != 200 && r.status != 201) {
        errorGetBar(r.msg!);
      } else {
        emit(SuccessLoginState());
        successGetBar(r.msg);
        isResend
            ? resetPin()
            : Navigator.pushNamed(context, Routes.otpScreen, arguments: false);
      }
    });
  }

  checkOtp(BuildContext context) async {
    emit(LoadingLoginState());
    AppWidget.createProgressDialog(context, AppTranslations.loading);
    final response = await api.register(
        isCheckOtp: true,
        otp: pinController.text,
        phone: countryCode.replaceFirst('+', '') + phoneController.text,
        password: passwordControllerSignUp.text,
        name: nameController.text,
        passwordConfirmation: confirmPasswordControllerSignUp.text);
    response.fold((l) {
      Navigator.pop(context);
      errorGetBar(AppTranslations.error);
      emit(FailureLoginState());
    }, (r) {
      Navigator.pop(context);
      print("code: ${r.status.toString()}");
      if (r.status != 200 && r.status != 201) {
        errorGetBar(r.msg!);
      } else {
        emit(SuccessLoginState());
        successGetBar(r.msg);
        prefs.setBool("ISLOGGED", true);
        Preferences.instance.setUser(r);

        Navigator.pushNamedAndRemoveUntil(
            context, Routes.apply, (route) => false);
      }
    });
  }
}
