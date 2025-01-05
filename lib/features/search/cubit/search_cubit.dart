import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/exports.dart';
import '../data/repo/search_repo_impl.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.api) : super(SearchInitial());
  TextEditingController searchController = TextEditingController();
  SearchRepoImpl? api;
  int selectedIndex=0;
  List<String>categories=[
    AppTranslations.accommodation,
    AppTranslations.transportation,
    AppTranslations.food,
    AppTranslations.entertainment
  ];
  void changeContainer(int index){
    selectedIndex=index;
    emit(IndexChanged());
  }
}
