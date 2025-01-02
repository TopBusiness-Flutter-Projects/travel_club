abstract class LoginState {}

class LoginStateInitial extends LoginState {}
//otp screen
class StartTimer extends LoginState {}
class ResetPin extends LoginState {}
class LoadingLoginState extends LoginState {}
class FailureLoginState extends LoginState {}
class SuccessLoginState extends LoginState {}
class SuccessSignOutGoogleState extends LoginState {}
class LoadingSignOutGoogleState extends LoginState {}
class SuccessSignInWithGoogleState extends LoginState {}
class FailureSignInWithGoogleState extends LoginState {
  String? error;
  FailureSignInWithGoogleState({ this.error});
}
