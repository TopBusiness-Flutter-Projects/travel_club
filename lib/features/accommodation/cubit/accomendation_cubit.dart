import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/repo/details_accomendation_repo_impl.dart';

part 'accomendation_state.dart';

class AccomendationCubit extends Cubit<AccomendationState> {
  AccomendationCubit(this.api) : super(DetailsAccomendationPngInitial());
  DetailsAccomendationRepoImpl  ?api ;
 int currentIndex = 0;
 void changeIndex(int index) {
   currentIndex = index;
   emit(ChangeIndex());
 }
  final List<String> imageUrls = [
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
  ];
}
