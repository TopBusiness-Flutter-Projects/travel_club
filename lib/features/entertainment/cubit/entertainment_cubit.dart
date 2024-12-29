import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/repo/entertainment_repo_impl.dart';

part 'entertainment_state.dart';

class EntertainmentCubit extends Cubit<EntertainmentState> {
  EntertainmentCubit(this.entertainmentRepoImpl) : super(EntertainmentInitial());
  EntertainmentRepoImpl? entertainmentRepoImpl;
  bool isServiceSelected = false;
  int currentIndex = 0;


  final List<String> imageUrls = [
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
  ];
void changeIndex(bool index) {
  isServiceSelected = index;
  emit(ChangeIndex());
}
}
