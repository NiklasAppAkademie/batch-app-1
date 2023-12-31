import 'package:quiz_app/features/game_configuration/data/category_repository.dart';
import 'package:quiz_app/features/game_configuration/domain/category_model.dart';

class CategoryService {
  CategoryRepository categoryRepository = CategoryRepository();

  Future<List<Category>> fetchCategories() async {
    var categories = await categoryRepository.fetchCategoriesFromServer();
    return categories;
  }

  createNewCategory(Category category) async {
    return categoryRepository.createCagtegoryOnServer(category);
  }
}
