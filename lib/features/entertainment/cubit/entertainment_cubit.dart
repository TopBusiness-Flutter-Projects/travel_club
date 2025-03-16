import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';

import '../../../core/exports.dart';
import '../data/model/get_orginization_model.dart';
import '../data/model/get_ways_model.dart';
import '../data/repo/entertainment_repo_impl.dart';

part 'entertainment_state.dart';

class EntertainmentCubit extends Cubit<EntertainmentState> {
  EntertainmentCubit(this.api) : super(EntertainmentInitial());
  EntertainmentRepoImpl api;
  bool isServiceSelected = false;
  int currentIndex = 0;
  void onSelectedDateSingle({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(9999),
    );

    if (picked != null) {
      selectedDate = picked;

      updateDateStrings();
      emit(DateChangedState());
    }
  }
  void updateDateStrings() {

    singleDate = DateFormat('yyyy-MM-dd', 'en')
        .format(selectedDate); // تاريخ اليوم كقيمة افتراضية
  }
  String singleDate = DateFormat('yyyy-MM-dd', 'en').format(DateTime.now());
  DateTime selectedDate = DateTime.now();
  bool ?isFavoriteTrue=false;
  final List<String> imageUrls = [
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
  ];
void changeIndex(bool index) {
  isServiceSelected = index;
  emit(ChangeIndex());
}
  /////get catogrey
  GetWaysModel getWaysModel = GetWaysModel();
  getWays() async {
    emit(LoadingGetWays());
    final res = await api.GetWays();
    res.fold((l) {
      emit(ErrorGetWays());
    }, (r) {

      getWaysModel = r;

      emit(LoadedGtWays());
    });
  }
  //get orginization
  GetOrganizationsModel? getOrganizationsModel ;
  getOrginization({required String id}) async {
    emit(LoadingOrganizers());
    final res = await api.getOrganizations(id:id);
    res.fold((l) {
      emit(ErrorOrganizers());
    }, (r) {

      getOrganizationsModel = r;

      emit(LoadedOrganizers());
    });
  }
}
