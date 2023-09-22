import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quiz_app/core/presentation/styles/color_styles.dart';
import 'package:quiz_app/core/presentation/styles/position_styles.dart';
import 'package:quiz_app/core/presentation/styles/text_styles.dart';
import 'package:quiz_app/core/presentation/widgets/custom_app_bar.dart';
import 'package:quiz_app/core/presentation/widgets/primary_button.dart';
import 'package:quiz_app/features/onboarding/domain/user_model.dart';

class CategorySelectionPage extends StatefulWidget {
  const CategorySelectionPage({super.key});

  @override
  State<CategorySelectionPage> createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  Box<User> userBox = Hive.box<User>("userBox");

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
            Image.file(File(userBox.get("1")?.avatarImagePath ?? "")),
            Text(
              userBox.get("1")?.username ?? "Kein Nutzer gefunden",
              style: kTextHeadline2,
            ),
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
