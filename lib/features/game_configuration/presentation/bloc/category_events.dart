import 'package:quiz_app/features/game_configuration/domain/category_model.dart';

abstract class CategoryEvent {}

class LoadCategories extends CategoryEvent {}

class SelectCategory extends CategoryEvent {
  SelectCategory({required this.category});

  final Category category;
}
