import 'package:flutter/material.dart';

import 'package:quiz_app/core/presentation/styles/color_styles.dart';
import 'package:quiz_app/core/presentation/styles/position_styles.dart';
import 'package:quiz_app/core/presentation/styles/text_styles.dart';
import 'package:quiz_app/core/presentation/widgets/custom_app_bar.dart';
import 'package:quiz_app/core/presentation/widgets/primary_button.dart';
import 'package:quiz_app/features/game_configuration/application/category_service.dart';
import 'package:quiz_app/features/game_configuration/domain/category_model.dart';

class CategorySelectionPage extends StatefulWidget {
  const CategorySelectionPage({super.key});

  @override
  State<CategorySelectionPage> createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  CategoryService categoryService = CategoryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorGreyDark,
      body: Padding(
        padding: kPaddingLarge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomAppBar(
              text: "Kategorien",
            ),
            FutureBuilder(
                future: categoryService.fetchCategories(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Category> categoryList = snapshot.data ?? [];
                    return Expanded(
                      child: ListView(
                        children: categoryList
                            .map(
                              (val) => Padding(
                                padding: kPaddingVerLarge,
                                child: Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width - 40,
                                  color: kColorSecondary,
                                  child: Center(
                                    child: Text(
                                      val.name,
                                      style: kTextHeadline2,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    );
                  }
                  return const Text(
                    "Lädt",
                    style: kTextBody,
                  );
                }),
            PrimaryButton(
              text: "Weiter",
              onPressed: () {
                debugPrint("Weiter");
              },
            )
          ],
        ),
      ),
    );
  }
}
