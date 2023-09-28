import 'package:quiz_app/core/data/remote_data_source.dart';
import 'package:quiz_app/features/game_configuration/domain/category_model.dart';

class CategoryRepository {
  RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<List<Category>> fetchCategoriesFromServer() async {
    try {
      dynamic response = await remoteDataSource.getData(
          "https://run.mocky.io/v3/6f0cc8e3-1e9f-4c00-8452-af1eda920146");
      List<Category> categories =
          (response as List).map((val) => Category.fromJson(val)).toList();
      return categories;
    } catch (err) {
      return [];
    }
  }

  Future createCagtegoryOnServer(Category category) async {
    remoteDataSource.postData("irgendeinen Link", category);
  }
}
