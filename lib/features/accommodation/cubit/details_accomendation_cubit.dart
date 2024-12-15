import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/repo/details_accomendation_repo_impl.dart';

part 'details_accomendation_png_state.dart';

class DetailsAccomendationCubit extends Cubit<DetailsAccomendationState> {
  DetailsAccomendationCubit(this.api) : super(DetailsAccomendationPngInitial());
  DetailsAccomendationRepoImpl  ?api ;
}
