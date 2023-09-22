import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quiz_app/core/presentation/styles/color_styles.dart';
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
  Box<User> userBox = Hive.box<User>("userBox");
  TextEditingController usernameController = TextEditingController();
  String avatarImagePath = "";
  bool agbAccepted = false;

  Future<void> createUser() async {
    User newUser = User("1", usernameController.text, avatarImagePath,
        agbAccepted, DateTime.now(), DateTime.now());
    userBox.put("1", newUser);
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
                  Row(
                    children: [
                      Checkbox(
                          focusColor: kColorPrimary,
                          fillColor: MaterialStateProperty.resolveWith(
                            (states) {
                              // If the button is pressed, return green, otherwise blue
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.green;
                              }
                              return kColorPrimary;
                            },
                          ),
                          value: agbAccepted,
                          onChanged: setAgbAccepted),
                      const Expanded(
                        child: Text(
                          "Hiermit akzeptiere ich die AGB und Dateschnutzerklärung der App Akademie GmbH",
                          style: kTextInputTitleLight,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            PrimaryButton(
              text: "Weiter",
              onPressed: () async {
                // await createUser();
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
