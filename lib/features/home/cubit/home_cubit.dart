import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/home/data/models/home_model.dart';
import '../data/repo/home_repo_impl.dart';
import 'home_state.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:vibration/vibration.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(HomeInitial());
  HomeRepoImpl api;
  int moduleslenth = 5;
  GetHomeModel homeModel = GetHomeModel();
  getHomeData() async {
    emit(LoadingHomeData());
    final res = await api.getHome();
    res.fold((l) {
      emit(ErrorGetHomeData());
    }, (r) {
      homeModel = r;
      // getUserData();
      emit(SucessGetHomeData());
    });
  }

  final AudioPlayer _audioPlayer = AudioPlayer();
  Future<void> playSuccessAudio() async {
    try {
      await _audioPlayer.play(AssetSource('sounds/success.mp3'));
    } catch (e) {
      print("Error playing audio: $e");
    }
  }
  
  void triggerVibration() async {
    final hasCustomVibrationsSupport =
        await Vibration.hasCustomVibrationsSupport();
    if (hasCustomVibrationsSupport != null && hasCustomVibrationsSupport) {
      Vibration.vibrate(pattern: [500, 1000, 500, 1000]);
    } else {
      Vibration.vibrate();
      await Future.delayed(Duration(milliseconds: 500));
      Vibration.vibrate();
    }
  }
  Future<void> playAudioAndVibrate() async {
    try {
      playSuccessAudio(); // Play the success audio
      triggerVibration(); // Trigger vibration
    } catch (e) {
      print("Error occurred while playing audio or triggering vibration: $e");
    }
  }
}
