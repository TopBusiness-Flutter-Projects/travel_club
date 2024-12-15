import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/repo/details_accomendation_repo_impl.dart';

part 'details_accomendation_png_state.dart';

class DetailsAccomendationCubit extends Cubit<DetailsAccomendationState> {
  DetailsAccomendationCubit(this.api) : super(DetailsAccomendationPngInitial());
  DetailsAccomendationRepoImpl  ?api ;
 int currentIndex = 0;
 void changeIndex(int index) {
   currentIndex = index;
   emit(ChangeIndex());
 }
  final List<String> imageUrls = [
    'https://via.placeholder.com/600x400', // Replace with your image URLs
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
  ];
}
