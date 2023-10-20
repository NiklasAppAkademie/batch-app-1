import 'package:flutter/material.dart';
import 'package:quiz_app/features/game_configuration/domain/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  Category? _selectedCategory;

  Category? get selectedCategory => _selectedCategory;

  setSelectedCategory(Category category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
