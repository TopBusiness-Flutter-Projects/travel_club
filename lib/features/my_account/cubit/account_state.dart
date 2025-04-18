abstract class AccountState {}

class AccountInitial extends AccountState {}
class AccountLanguageChanged extends AccountState {}
//get account

class GetAccountLoading extends AccountState {}
class GetAccountSuccess extends AccountState {}
class GetAccountError extends AccountState {}
class GetSettingLoading extends AccountState {}
class GetSettingSuccess extends AccountState {}
class GetSettingError extends AccountState {
  String error;
  GetSettingError({required this.error});
}
