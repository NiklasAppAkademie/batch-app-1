import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/data/remote_data_source.dart';
import 'package:quiz_app/features/game_configuration/domain/category_model.dart';

class CategoryRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<List<Category>> fetchCategoriesFromServer() async {
    try {
      QuerySnapshot collection = await firestore.collection("categories").get();

      List<Map<String, dynamic>> rawData = collection.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      List<Category> categories =
          rawData.map((val) => Category.fromJson(val)).toList();

      // dynamic response = await remoteDataSource.getData(
      //     "https://run.mocky.io/v3/6f0cc8e3-1e9f-4c00-8452-af1eda920146");
      // List<Category> categories =
      //     (response as List).map((val) => Category.fromJson(val)).toList();
      return categories;
    } catch (err) {
      debugPrint(err.toString());
      return [];
    }
  }

  Future createCagtegoryOnServer(Category category) async {
    remoteDataSource.postData("irgendeinen Link", category);
  }
}
