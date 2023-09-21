import 'package:flutter/material.dart';
import 'package:quiz_app/core/presentation/styles/border_styles.dart';
import 'package:quiz_app/core/presentation/styles/color_styles.dart';
import 'package:quiz_app/core/presentation/styles/input_styles.dart';
import 'package:quiz_app/core/presentation/styles/position_styles.dart';
import 'package:quiz_app/core/presentation/styles/text_styles.dart';
import 'package:quiz_app/core/presentation/widgets/custom_app_bar.dart';
import 'package:quiz_app/core/presentation/widgets/custom_image_picker.dart';
import 'package:quiz_app/core/presentation/widgets/custom_textfield.dart';
import 'package:quiz_app/core/presentation/widgets/primary_button.dart';
import 'package:quiz_app/features/game_configuration/presentation/pages/category_selection_page.dart';
import 'package:quiz_app/features/onboarding/domain/user_model.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  TextEditingController usernameController = TextEditingController();

  Future<void> createUser() async {
    User newUser = User(
        usernameController.text, "", false, DateTime.now(), DateTime.now());
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
              text: "Onboarding",
            ),
            const CustomImagePicker(),
            CustomTextfield(
              title: "Username",
              controller: usernameController,
            ),
            PrimaryButton(
              text: "Weiter",
              onPressed: () async {
                await createUser();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategorySelectionPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
