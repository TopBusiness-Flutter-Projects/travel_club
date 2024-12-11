import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/remote/service.dart';

import '../data/login_repo_impl.dart';
import 'state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(LoginStateInitial());
  LoginRepoImpl api;
}
