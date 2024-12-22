import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/app_translations.dart';
import '../data/repo/details_accomendation_repo_impl.dart';
import '../view/widgets/hotels_widgets/custom_check_box.dart';

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
 //filter results
  //starsFilters
  List<StarsFilter> starsFilters = [
    StarsFilter(text: AppTranslations.oneStar ,isChecked: false ),
    StarsFilter(text: AppTranslations.twoStars ,isChecked: false),
    StarsFilter(text:"3 "+ AppTranslations.stars ,isChecked: false),
    StarsFilter(text:"4 "+ AppTranslations.stars ,isChecked: false),
    StarsFilter(text:"5 "+ AppTranslations.stars ,isChecked: false),
  ];
  //list orders
  List<StarsFilter> ordersFilters = [
    StarsFilter(text: AppTranslations.mostRating ,isChecked: false ),
    StarsFilter(text: AppTranslations.mostPrice ,isChecked: false),
    StarsFilter(text: AppTranslations.orderResults ,isChecked: false),
    StarsFilter(text:AppTranslations.nearest ,isChecked: false),
    StarsFilter(text: AppTranslations.lowestPrice ,isChecked: false),
  ];
  //facilitoes
  List<StarsFilter> Facilities = [


    StarsFilter(text: "جراج خاص", isChecked: false ),
    StarsFilter(text: "جراج خاص", isChecked: false ),
    StarsFilter(text: "جراج خاص", isChecked: false ),
    StarsFilter(text: "جراج خاص", isChecked: false ),
    StarsFilter(text: "جراج خاص", isChecked: false ),

  ];
  //current index stars
 int? currentIndexCheckbox ;
 //curent index facilitoes
 int? currentIndexFacilities ;

 //change stars check
  void changeIndexCheckbox(int index) {
    currentIndexCheckbox = index;
    emit(ChangeIndex());
  }
  //change facilities check
  void changeIndexFacilities(int index) {
    currentIndexFacilities = index;
    emit(ChangeIndex());
  }
  //remove filter
  void removeFilter() {
    // currentIndexCheckbox=-1;
    // currentIndexFacilities = -1;
    for(int i=0;i<=starsFilters.length!;i++){
      starsFilters[i].isChecked=false;
      Facilities[i].isChecked=false;
      emit(ChangeIndex());
    }


  }
}

