import 'package:flutter/material.dart';
import 'package:quiz_app/core/presentation/styles/color_styles.dart';
import 'package:quiz_app/core/presentation/styles/position_styles.dart';
import 'package:quiz_app/core/presentation/styles/text_styles.dart';
import 'package:quiz_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:quiz_app/core/presentation/widgets/primary_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorGreyDark,
      body: Padding(
        padding: kPaddingLarge,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/logo_white.png"),
              Image.asset("assets/images/illustration_tutor.png"),
              const Column(
                children: [
                  Text(
                    "Willkommen in der Quiz App",
                    style: kTextHeadline2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et.",
                    style: kTextBody,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              PrimaryButton(
                  text: "Los Geht's",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnboardingPage()));
                  })
            ]),
      ),
    );
  }
}
