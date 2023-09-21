import 'package:flutter/material.dart';
import 'package:quiz_app/core/presentation/styles/border_styles.dart';
import 'package:quiz_app/core/presentation/styles/color_styles.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({super.key});

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: Material(
        color: kColorGreyMedium,
        borderRadius: kBorderRadiusAllMedium,
        child: InkWell(
          borderRadius: kBorderRadiusAllMedium,
          onTap: () {},
          child: Center(
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
