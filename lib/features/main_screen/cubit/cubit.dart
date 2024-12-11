import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/remote/service.dart';

import '../data/main_repo.dart';
import 'state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(this.api) : super(MainInitial());

  MainRepoImpl api;
}
