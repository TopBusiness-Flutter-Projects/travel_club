abstract class AccountState {}

class AccountInitial extends AccountState {}
class AccountLanguageChanged extends AccountState {}
//get account

class GetAccountLoading extends AccountState {}
class GetAccountSuccess extends AccountState {}
class GetAccountError extends AccountState {}
