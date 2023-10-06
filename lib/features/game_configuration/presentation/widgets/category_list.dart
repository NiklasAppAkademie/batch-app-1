import 'package:flutter/material.dart';
import 'package:quiz_app/features/game_configuration/application/category_service.dart';
import 'package:quiz_app/features/game_configuration/domain/category_model.dart';
import 'package:quiz_app/features/game_configuration/presentation/widgets/category_tile.dart';

class CategoryList extends StatefulWidget {
  final Category? selectedCategory;
  final Function(Category) selectCategory;
  const CategoryList(
      {super.key, this.selectedCategory, required this.selectCategory});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final CategoryService categoryService = CategoryService();
  Future<List<Category>>? categories;

  @override
  void initState() {
    categories = categoryService.fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: categories,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Category> categoryList = snapshot.data ?? [];
            return Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: categoryList
                    .map(
                      (val) => CategoryTile(
                        name: val.name,
                        selected: widget.selectedCategory == val,
                        category: val,
                        selectCategory: widget.selectCategory,
                      ),
                    )
                    .toList(),
              ),
            );
          }
          return const CircularProgressIndicator();
        });
  }
}
