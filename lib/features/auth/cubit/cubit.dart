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
  late TextEditingController passwordControllerLogin = TextEditingController();
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  //sign up
  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController phoneControllerSignUp = TextEditingController();
  late TextEditingController passwordControllerSignUp = TextEditingController();


}
