import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/repo/entertainment_repo_impl.dart';

part 'entertainment_state.dart';

class EntertainmentCubit extends Cubit<EntertainmentState> {
  EntertainmentCubit(this.entertainmentRepoImpl) : super(EntertainmentInitial());
  EntertainmentRepoImpl? entertainmentRepoImpl;
  bool isServiceSelected = false;
void changeIndex(bool index) {
  isServiceSelected = index;
  emit(ChangeIndex());
}
}
