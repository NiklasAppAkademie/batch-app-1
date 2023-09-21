import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/core/presentation/styles/border_styles.dart';
import 'package:quiz_app/core/presentation/styles/color_styles.dart';

class CustomImagePicker extends StatefulWidget {
  final Function setImage;

  const CustomImagePicker({super.key, required this.setImage});

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  String? imagePath;

  void selectImage() async {
    XFile? tempFilePath =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    String? tempImagePath = tempFilePath?.path;
    setState(() {
      imagePath = tempImagePath;
    });
    widget.setImage(imagePath);
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
        child: InkWell(
          borderRadius: kBorderRadiusAllMedium,
          onTap: selectImage,
          child: imagePath != null
              ? Image.file(
                  File(imagePath ?? ""),
                  fit: BoxFit.cover,
                )
              : const Center(
                  child: Icon(
                  Icons.camera,
                  color: kColorWhite,
                  size: 100.0,
                )),
        ),
      ),
    );
  }
}
