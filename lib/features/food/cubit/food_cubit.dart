import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/food/data/models/get_menu_meals_model.dart';

import '../data/models/get_catogrey_model.dart';
import '../data/models/get_restaurant_details_model.dart';
import '../data/models/get_resturant_model.dart';
import '../data/repo/food_repo_impl.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit(this.api) : super(FoodInitial());
  FoodRepoImpl api;
  //// Amer ////

  CatogreyDataFood? selectedMenuCat;

  void changeMenuCat(CatogreyDataFood categoryDataFood) {
    selectedMenuCat = categoryDataFood;
    getMenuMeals();
    emit(ChangeIndexFood());
  }

  /////get catogrey
  GetCategoryFoodModel categoryMenuModel = GetCategoryFoodModel();
  getMenuCategory() async {
    emit(LoadingGetCatogery());
    final res = await api.getMenuCategory();
    res.fold((l) {
      emit(ErrorGetCatogery());
    }, (r) {
      if (r.data?.isEmpty ?? true) {
      } else {
        changeMenuCat(r.data?.first ?? CatogreyDataFood());
      }
      categoryMenuModel = r;

      emit(LoadedGetCatogery());
    });
  }

  GetMenuMealsModel getMenuMealsModel = GetMenuMealsModel();
  getMenuMeals() async {
    getMenuMealsModel = GetMenuMealsModel();
    emit(LoadingGetCatogery());
    final res =
        await api.getMenuMeals(menuId: selectedMenuCat?.id.toString() ?? "1");
    res.fold((l) {
      emit(ErrorGetCatogery());
    }, (r) {
      getMenuMealsModel = r;
      for (var basketItem in cartItems) {
        for (MealModel product in getMenuMealsModel.data!) {
          if (product.id == basketItem.id) {
            product.userQty = basketItem.userQty; //! Update quantity
          }
        }
      }

      emit(LoadedGetCatogery());
    });
  }

  List<MealModel> cartItems = [];
  double totalBasket() {
    double total = 0.0;
    for (int i = 0; i < cartItems.length; i++) {
      total += (cartItems[i].userQty *
          (double.parse(cartItems[i].priceAfterDiscount.toString())));
    }
    return total;
  }

  void addOrRemoveFromBasket(
    BuildContext context, {
    required bool isAdd,
    required MealModel product,
  }) {
    emit(LoadingTheQuantityCount());

    // Create a local copy of the product to ensure we're working with the correct state
    final targetProduct = cartItems.firstWhere(
      (item) => item.id == product.id,
      orElse: () => product,
    );

    if (isAdd) {
      _handleAddToBasket(context, targetProduct);
    } else {
      _handleRemoveFromBasket(targetProduct);
    }

    // Update quantities across all product lists
    _syncProductQuantities();

    emit(LoadingTheQuantityCount());
    totalBasket();
  }

  void _handleAddToBasket(BuildContext context, MealModel product) {
    // if (product.userQty < product.stock! ) {
    bool existsInBasket = cartItems.any((item) => item.id == product.id);

    if (!existsInBasket) {
      product.userQty++;
      cartItems.add(product);
      emit(LoadingTheQuantityCount());
      debugPrint(
          'Product added to basket: ${product.id}, Quantity: ${product.userQty}');
    } else {
      product.userQty++;
      emit(LoadingTheQuantityCount());
      debugPrint(
          'Updated quantity for product ${product.id}: ${product.userQty}');
    }
    // } else {
    //   debugPrint(
    //       'Cannot add more. Stock limit reached for product: ${product.id}');
    //   // showErrorSnackBar(context, tr("stock_limit_reached"));
    // }
  }

  void _handleRemoveFromBasket(MealModel product) {
    debugPrint(
        "Removing product. Current userOrderedQuantity: ${product.userQty}");

    if (product.userQty > 0) {
      // Create a local copy of the quantity to verify the change
      final previousQty = product.userQty;
      product.userQty--;

      // Verify the quantity was actually decreased
      if (product.userQty == previousQty - 1) {
        emit(LoadingTheQuantityCount());
        debugPrint(
            'Product quantity decreased: ${product.id}, New Quantity: ${product.userQty}');

        if (product.userQty == 0) {
          cartItems.removeWhere((item) => item.id == product.id);
          debugPrint('Product removed from basket: ${product.id}');
        }
      } else {
        debugPrint(
            'Error: Quantity not properly decreased for product: ${product.id}');
      }
    } else {
      debugPrint(
          'Cannot remove. Product quantity is already zero for product: ${product.id}');
    }
  }

  void _syncProductQuantities() {
    // Sync with getAllProductsModel
    if (getMenuMealsModel.data != null) {
      for (var product in getMenuMealsModel.data!) {
        final basketItem = cartItems.firstWhere(
          (item) => item.id == product.id,
          orElse: () => MealModel(),
        );
        if (basketItem != null) {
          product.userQty = basketItem.userQty;
        }
      }
    }

    // // Sync with getFarmStoreModel
    // if (getFarmStoreModel.data?.topSelling != null) {
    //   for (var product in getFarmStoreModel.data!.topSelling!) {
    //     final basketItem = cartItems.firstWhere(
    //       (item) => item.id == product.id,
    //       orElse: () => ProductModel(),
    //     );
    //     if (basketItem != null) {
    //       product.userQty = basketItem.userQty;
    //     }
    //   }
    // }

    // // Sync with getProductModel
    // if (getProductModel.data?.product != null) {
    //   final basketItem = cartItems.firstWhere(
    //     (item) => item.id == getProductModel.data!.product!.id,
    //     orElse: () => ProductModel(),
    //   );
    //   if (basketItem != null) {
    //     getProductModel.data!.product!.userQty = basketItem.userQty;
    //   }
    // }
  }

  void clearCart() {
    cartItems.clear();
    emit(LoadingTheQuantityCount());
    totalBasket();
  }

  //// Amer ////

  CatogreyDataFood selectedIndex =
      CatogreyDataFood(id: 0, name: "all_foods".tr());
  FoodRepoImpl api;
  CatogreyDataFood selectedIndex = CatogreyDataFood(id: 0, name: "all_foods".tr());
  int selectedIndexFavourite = 0;
  bool? isFavoriteTrue = false;
  void changeIndex(CatogreyDataFood categoryDataFood) {
    selectedIndex = categoryDataFood;
    getRestaurant();
    emit(ChangeIndexFood());
  }

  // void changeFavourite() {
  //    isFavoriteTrue = !(isFavoriteTrue ?? false);
  //    emit(ChangeFavourite());
  //  }
  void changeFavourite(int index) {
    if (index == selectedIndexFavourite) {
      isFavoriteTrue = !(isFavoriteTrue ?? false);
      emit(ChangeFavourite());
    }
    // emit(ChangeFavourite());
  }

  bool isServiceSelected = false;
  void changeIndexService(bool index) {
    isServiceSelected = index;
    emit(ChangeIndexFood());
  }

  final List<String> imageUrls = [
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
    'https://th.bing.com/th/id/OIP.FtudhIBH-HYhxMpS4TU-sAHaE8?rs=1&pid=ImgDetMain', // Replace with your image URLs
  ];
  int currentIndex = 0;
  int selectedIndexMenue = 0; // Default selected index is the first button

//
  void changeIndexMenue(int index) {
    selectedIndexMenue = index;
    emit(ChangeIndexFood());
  }

  int itemsQty = 0;

  void addOrRemoveMenuCart(bool isAdd) {
    if (isAdd) {
      itemsQty++;
    } else {
      if (itemsQty > 0) {
        itemsQty--;
      }
    }
    emit(ChangeCount());
  } // Change the count of items

  String singleDate = DateFormat('yyyy-MM-dd', 'en').format(DateTime.now());
  DateTime selectedDate = DateTime.now();
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

//get catogrey
  GetCategoryFoodModel categoryModel = GetCategoryFoodModel();
  getCategoryData() async {
    emit(LoadingGetCatogery());
    final res = await api.getCatogrey();
    res.fold((l) {
      emit(ErrorGetCatogery());
    }, (r) {
      List<CatogreyDataFood> list = r.data ?? [];
      //  list = list.reversed.toList();

      //list.add(CatogreyDataFood(id: 0, name: "All".tr()));
      list.insert(0, CatogreyDataFood(id: 0, name: "all_foods".tr()));
      //  list = list.reversed.toList();
      categoryModel.data = list;
      getRestaurant();
      emit(LoadedGetCatogery());
    });
  }

//get food
//   String ?catogreyId;
  GetRestaurantModel? getRestaurantModel;
  getRestaurant() async {
    getRestaurantModel = null;
    emit(LoadingGetFood());
    final res = await api?.getRestuarnt(id: selectedIndex.id.toString());
    res?.fold((l) {
    final res = await api.getRestuarnt(id: selectedIndex.id .toString());
    res.fold((l) {

      emit(ErrorGetFood());
    }, (r) {
      if (r.status == 404) {
        emit(ErrorGetCatogery());
      }
      getRestaurantModel = r;
      emit(LoadedGetFood());
    });
  }

  GetRestaurantDetailsModel? getRestaurantDetailsModel;
  getRestaurantDetails({String? id}) async {
    // getRestaurantDetailsModel = null;
  GetRestaurantDetailsModel? getRestaurantDetailsModel ;
  getRestaurantDetails({String ?id}) async {
     getRestaurantDetailsModel = null;
    emit(LoadingGetFoodDetails());
    final res = await api?.getRestaurantDetails(id: id.toString());
    res?.fold((l) {
    final res = await api.getRestaurantDetails(id: id .toString());
    res.fold((l) {
      emit(ErrorGetFoodDetails());
    }, (r) {
      if (r.status == 404) {
        emit(ErrorGetFoodDetails());
      }

      getRestaurantDetailsModel = r;
      if(r.data!.hasMenu==1){
        selectedIndexMenue = 0;
      }else{
        selectedIndexMenue = 1;
      }
      emit(LoadedGetFoodDetails());
    });
  }

}
