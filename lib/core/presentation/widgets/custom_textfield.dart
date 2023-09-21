import 'package:flutter/material.dart';
import 'package:quiz_app/core/presentation/styles/border_styles.dart';
import 'package:quiz_app/core/presentation/styles/color_styles.dart';
import 'package:quiz_app/core/presentation/styles/input_styles.dart';
import 'package:quiz_app/core/presentation/styles/position_styles.dart';
import 'package:quiz_app/core/presentation/styles/text_styles.dart';

class CustomTextfield extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  const CustomTextfield(
      {super.key, required this.title, required this.controller});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.title,
              style: kTextInputTitleLight,
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          decoration: const BoxDecoration(
              color: kColorGreyMedium, borderRadius: kBorderRadiusAllMedium),
          child: Padding(
            padding: kPaddingHorLarge,
            child: TextField(
              controller: widget.controller,
              style: kTextInputLight,
              cursorColor: kColorWhite,
              decoration: kTextfieldMedium,
            ),
          ),
        ),
      ],
    );
  }
}
