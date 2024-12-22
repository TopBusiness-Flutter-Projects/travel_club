import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import '../data/repo/account_repo_impl.dart';
import 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this.api) : super(AccountInitial());
  AccountRepoImpl api;
  GlobalKey<FormState> formInfo = GlobalKey<FormState>();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController passController = TextEditingController();
  String? selectedLanguage = 'Arabic';
  void changeLanguage(String newLanguage) {
    selectedLanguage = newLanguage; // Update the selected language
    emit(AccountLanguageChanged()); // Emit a new state to notify the UI
  }

}
