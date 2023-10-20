import 'package:flutter/material.dart';

import 'package:quiz_app/core/presentation/styles/color_styles.dart';
import 'package:quiz_app/core/presentation/styles/position_styles.dart';
import 'package:quiz_app/core/presentation/widgets/custom_app_bar.dart';
import 'package:quiz_app/core/presentation/widgets/primary_button.dart';
import 'package:quiz_app/features/game/presentation/game_page.dart';
import 'package:quiz_app/features/game_configuration/presentation/widgets/category_list.dart';

class CategorySelectionPage extends StatelessWidget {
  const CategorySelectionPage({super.key});

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
            const CategoryList(),
            PrimaryButton(
              text: "Weiter",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const GamePage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
