import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/core/presentation/providers/app_provider.dart';
import 'package:quiz_app/core/presentation/styles/color_styles.dart';
import 'package:quiz_app/core/presentation/styles/position_styles.dart';
import 'package:quiz_app/core/presentation/widgets/custom_app_bar.dart';
import 'package:quiz_app/core/presentation/widgets/custom_image_picker.dart';
import 'package:quiz_app/core/presentation/widgets/custom_textfield.dart';
import 'package:quiz_app/core/presentation/widgets/primary_button.dart';
import 'package:quiz_app/features/game_configuration/presentation/pages/category_selection_page.dart';
import 'package:quiz_app/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:quiz_app/features/onboarding/presentation/widgets/agb_request.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorGreyDark,
      body: Padding(
        padding: kPaddingLarge,
        child: Consumer2<OnboardingProvider, AppProvider>(
            child: const CustomAppBar(
              text: "Onboarding",
            ),
            builder: (context, onboardingProvider, appProvider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  child!,
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: kPaddingVerLarge,
                      children: [
                        const CustomImagePicker(),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextfield(
                          title: "Username",
                          controller: onboardingProvider.usernameController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AGBRequest(
                          setAgbAccepted: onboardingProvider.setAgbAccepted,
                          agbAccepted: onboardingProvider.agbAccepted,
                        ),
                      ],
                    ),
                  ),
                  PrimaryButton(
                    text: "Weiter",
                    onPressed: () {
                      onboardingProvider.createUser();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CategorySelectionPage()));
                    },
                  ),
                ],
              );
            }),
      ),
    );
  }
}
