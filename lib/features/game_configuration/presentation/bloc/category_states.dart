import 'package:quiz_app/features/game_configuration/domain/category_model.dart';

abstract class CategoryState {}

class InitialCategoryState extends CategoryState {}

class LoadingCategoryState extends CategoryState {}

class LoadedCategoryState extends CategoryState {
  LoadedCategoryState({required this.categories, this.selectedCategory});

  List<Category> categories;
  Category? selectedCategory;
}

class ErrorCategoryState extends CategoryState {}
