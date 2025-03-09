import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/food/data/models/get_menu_meals_model.dart';
import 'package:travel_club/features/location/cubit/location_cubit.dart';

import '../../../core/utils/appwidget.dart';
import '../../auth/data/models/default_model.dart';
import '../../residence/data/models/addRoomReservation_model.dart';
import '../../residence/data/models/rooms_model.dart';
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
  getMenuCategory({required String restaurantId}) async {
    clearCart();
    emit(LoadingGetCatogery());
    final res = await api.getMenuCategory(restaurantId: restaurantId);
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
      // for (var basketItem in cartItems) {
      //   for (MealModel product in getMenuMealsModel.data!) {
      //     if (product.id == basketItem.id) {
      //       product.userQty = basketItem.userQty; //! Update quantity
      //     }
      //   }
      // }

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
  }

  void clearCart() {
    cartItems.clear();
    emit(LoadingTheQuantityCount());
    totalBasket();
  }

  //// Amer ////

  CatogreyDataFood selectedIndex =
      CatogreyDataFood(id: 0, name: "all_foods".tr());

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

  String countryCode = '+20';
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  String singleDate = DateFormat('yyyy-MM-dd', 'en').format(DateTime.now());
  DateTime selectedDate = DateTime.now();
  void onSelectedDateSingle({required BuildContext context}) async {
    var picked = await DatePicker.showSimpleDatePicker(
      context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(9999),
      dateFormat: "dd/MMMM/yyyy",
      backgroundColor: AppColors.primary,
      textColor: AppColors.white,
      itemTextStyle: getMediumStyle(color: AppColors.white),
      locale: DateTimePickerLocale.en_us,
      looping: false,
    );
    if (picked != null) {
      selectedDate = picked;
      updateDateStrings();
      emit(DateChangedState());
    }
  }

  void updateDateStrings() {
    singleDate = DateFormat('yyyy-MM-dd', 'en').format(selectedDate);
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

    final res = await api.getRestuarnt(id: selectedIndex.id.toString());
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
  getRestaurantDetails(BuildContext context, {required String id}) async {
    getMenuMealsModel = GetMenuMealsModel();
    categoryMenuModel = GetCategoryFoodModel();
    clearCart();
    getRestaurantDetailsModel = null;
    emit(LoadingGetFoodDetails());

    final res = await api.getRestaurantDetails(id: id);
    res.fold((l) {
      emit(ErrorGetFoodDetails());
    }, (r) {
      if (r.status == 404) {
        emit(ErrorGetFoodDetails());
      } else {
        getRestaurantDetailsModel = r;
        if (r.data!.hasMenu == 1) {
          selectedIndexMenue = 0;
          getMenuCategory(restaurantId: id);
        } else {
          selectedIndexMenue = 1;
        }
        context.read<LocationCubit>().getAddressFromLatLng(
            double.tryParse(r.data?.latitude.toString() ?? "") ?? 0,
            double.tryParse(r.data?.longitude.toString() ?? "") ?? 0);
        emit(LoadedGetFoodDetails());
      }
    });
  }

  AddRoomReservationModel addRoomReservationModel = AddRoomReservationModel();
  // List<RoomModel> selectedRooms = [];
  TextEditingController countUsers = TextEditingController();
  TextEditingController nameUser = TextEditingController();
  TextEditingController phoneUser = TextEditingController();
  DefaultPostModel defaultPostModel = DefaultPostModel();

  addRestaurantReservation(BuildContext context, String restaurantId) async {
    AppWidget.createProgressDialog(context, AppTranslations.loading);
    emit(ReservationLoading());
    // List<int> selectedRoomsIds = [];
    // for (int i = 0; i < selectedRooms.length; i++) {
    //   if (selectedRooms[i].recommend == null) {
    //     selectedRoomsIds.add(selectedRooms[i].id!);
    //   } else if (selectedRooms[i].recommend!.isSelectedRecommend) {
    //     selectedRoomsIds.add(selectedRooms[i].recommend!.id!);
    //   } else {
    //     selectedRoomsIds.add(selectedRooms[i].id!);
    //   }
    // }
    final response = await api.addRestaurantReservation(
        restaurant_id: restaurantId,
        user_name: nameUser.text,
        date: singleDate.toString(),
        client_count: countUsers.text,
        restaurant_menu_ids: cartItems.map((e) => e.id).toList(),
        counts: cartItems.map((e) => e.userQty).toList(),
        user_phone: phoneUser.text
        // fromDay: context.read<TransportationCubit>().fromDate,
        // toDay: context.read<TransportationCubit>().toDate,
        // guest: counter,
        //  rooms: selectedRoomsIds
        );
    response.fold((l) {
      Navigator.pop(context);
      errorGetBar(AppTranslations.error);
      emit(ReservationError());
    }, (r) {
      defaultPostModel = r;
      Navigator.pop(context);
      print("code: ${r.status.toString()}");
      if (r.status != 200 && r.status != 201) {
        errorGetBar(r.msg!);
      } else {
        Navigator.pushNamed(context, Routes.secondBookingResidence);
        emit(ReservationLoaded());
        successGetBar(r.msg);
      }
    });
  }
}
