import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/menu_model.dart';
import '../../data/reposatiry/menu_repo.dart';
import 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this.menuRepo) : super(MenuInitial());
  final MenuRepository menuRepo;
  XFile? image;

  TextEditingController mealNameController = TextEditingController();
  TextEditingController mealPriceController = TextEditingController();
  TextEditingController mealDecController = TextEditingController();
  GlobalKey<FormState> addToMenuKey = GlobalKey<FormState>();
  List<String> categoryList = [
    'Beef',
    'Chicken',
    'Fish',
    'Seafood',
    'Pork',
    'Lamb',
    'Vegetarian',
    'Vegan',
    'Gluten-free',
  ];
  String selectedItem = 'Beef';
  void changeItem(item) {
    selectedItem = item;
    emit(ChangeItemState());
  }

  String groupVal = 'quantity';
  void changeGroupVal(val) {
    groupVal = val;
    emit(ChangeGroupValState());
  }

  void addDishToMenu() async {
    emit(AddDishLoadingState());
    final result = await menuRepo.addDishToMenu(
      image: image!,
      mealName: mealNameController.text,
      mealPrice: double.parse(mealPriceController.text),
      mealDesc: mealDecController.text,
      mealCategory: selectedItem,
      howToSell: groupVal,
    );
    result.fold(
        (l) => emit(AddDishErrorState()), (r) => emit(AddDishSuccessState()));
  }

  void deleteDish(id) async {
    emit(DeleteDishLoadingState());
    final result = await menuRepo.deleteMeal(id: id);
    result.fold((l) => emit(DeleteDishErrorState()),
        (r) => emit(DeleteDishSuccessState()));
  }

  List<MealModel> meals = [];

  void getAllMeals() async {
    emit(GetAllChefMealsLoadingState());
    final result = await menuRepo.getMeal();
    result.fold((l) => emit(GetAllChefMealsErrorState()), (r) {
      meals = r.meals;
      emit(GetAllChefMealsSuccessState());
    });
  }

  //change image from use
  void changeImage(value) {
    image = value;
    emit(ChangeImageState());
  }
}
