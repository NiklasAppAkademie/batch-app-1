import 'package:flutter/material.dart';
import 'package:quiz_app/core/presentation/styles/color_styles.dart';
import 'package:quiz_app/core/presentation/styles/position_styles.dart';
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
  String avatarImagePath = "";

  Future<void> createUser() async {
    User newUser = User(usernameController.text, avatarImagePath, false,
        DateTime.now(), DateTime.now());
  }

  void setAvatarImagePath(imagePath) {
    avatarImagePath = imagePath ?? "";
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
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: kPaddingVerLarge,
                child: Column(
                  children: [
                    CustomImagePicker(
                      setImage: setAvatarImagePath,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextfield(
                      title: "Username",
                      controller: usernameController,
                    ),
                  ],
                ),
              ),
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
