import 'package:flutter/material.dart';
import 'package:quiz_app/core/presentation/styles/color_styles.dart';
import 'package:quiz_app/core/presentation/styles/position_styles.dart';
import 'package:quiz_app/core/presentation/widgets/custom_app_bar.dart';
import 'package:quiz_app/core/presentation/widgets/custom_image_picker.dart';
import 'package:quiz_app/core/presentation/widgets/custom_textfield.dart';
import 'package:quiz_app/core/presentation/widgets/primary_button.dart';
import 'package:quiz_app/features/game_configuration/presentation/pages/category_selection_page.dart';
import 'package:quiz_app/features/onboarding/application/onboarding_service.dart';
import 'package:quiz_app/features/onboarding/presentation/widgets/agb_request.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  OnboardingService onboardingService = OnboardingService();
  TextEditingController usernameController = TextEditingController();
  String avatarImagePath = "";
  bool agbAccepted = false;

  Future<void> onNextPressed() async {
    onboardingService.createUser(
        name: usernameController.text,
        agbAccepted: agbAccepted,
        avatarImagePath: avatarImagePath);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CategorySelectionPage()));
  }

  void setAvatarImagePath(imagePath) {
    avatarImagePath = imagePath ?? "";
  }

  void setAgbAccepted(bool? val) {
    setState(() {
      agbAccepted = val ?? false;
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
              text: "Onboarding",
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: kPaddingVerLarge,
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
                  const SizedBox(
                    height: 20,
                  ),
                  AGBRequest(
                    setAgbAccepted: setAgbAccepted,
                    agbAccepted: agbAccepted,
                  ),
                ],
              ),
            ),
            PrimaryButton(
              text: "Weiter",
              onPressed: onNextPressed,
            ),
          ],
        ),
      ),
    );
  }
}
