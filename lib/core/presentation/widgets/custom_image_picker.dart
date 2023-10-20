import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/core/presentation/styles/border_styles.dart';
import 'package:quiz_app/core/presentation/styles/color_styles.dart';
import 'package:quiz_app/features/onboarding/presentation/providers/onboarding_provider.dart';

class CustomImagePicker extends StatelessWidget {
  const CustomImagePicker({super.key});

  void selectImage(BuildContext context) async {
    XFile? tempFilePath =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    String? tempImagePath = tempFilePath?.path;
    Provider.of<OnboardingProvider>(context, listen: false)
        .setAvatarImagePath(tempImagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: MediaQuery.of(context).size.width - 40,
      decoration: const BoxDecoration(borderRadius: kBorderRadiusAllMedium),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: kColorGreyMedium,
        borderRadius: kBorderRadiusAllMedium,
        child:
            Consumer<OnboardingProvider>(builder: (context, provider, child) {
          return InkWell(
            borderRadius: kBorderRadiusAllMedium,
            onTap: () => selectImage(context),
            child: provider.avatarImagePath.isNotEmpty
                ? Image.file(
                    File(provider.avatarImagePath),
                    fit: BoxFit.cover,
                  )
                : const Center(
                    child: Icon(
                    Icons.camera,
                    color: kColorWhite,
                    size: 100.0,
                  )),
          );
        }),
      ),
    );
  }
}
