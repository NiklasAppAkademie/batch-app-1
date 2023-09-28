import 'package:flutter/material.dart';

import 'package:quiz_app/core/presentation/styles/color_styles.dart';
import 'package:quiz_app/core/presentation/styles/position_styles.dart';
import 'package:quiz_app/core/presentation/widgets/custom_app_bar.dart';
import 'package:quiz_app/core/presentation/widgets/primary_button.dart';
import 'package:quiz_app/features/game/presentation/game_page.dart';
import 'package:quiz_app/features/game_configuration/domain/category_model.dart';
import 'package:quiz_app/features/game_configuration/presentation/widgets/category_list.dart';

class CategorySelectionPage extends StatefulWidget {
  const CategorySelectionPage({super.key});

  @override
  State<CategorySelectionPage> createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  Category? selectedCategory;

  setSelectedCategory(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }

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
            CategoryList(
              selectedCategory: selectedCategory,
              selectCategory: setSelectedCategory,
            ),
            PrimaryButton(
              text: "Weiter",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            GamePage(category: selectedCategory!)));
              },
            )
          ],
        ),
      ),
    );
  }
}
