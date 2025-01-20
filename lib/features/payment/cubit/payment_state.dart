abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class AccountLanguageChanged extends PaymentState {}
//get account

class SuccessCheckCopouneState extends PaymentState {}
class FailureCheckCopouneState extends PaymentState {}
class LoadingCheckCopouneState extends PaymentState {}


