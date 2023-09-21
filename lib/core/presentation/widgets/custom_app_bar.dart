import 'package:flutter/material.dart';
import 'package:quiz_app/core/presentation/styles/text_styles.dart';
import 'package:quiz_app/core/presentation/widgets/secondary_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final Function()? onLeftAction;

  const CustomAppBar({super.key, required this.text, this.onLeftAction});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SecondaryIconButton(
            icon: Icons.chevron_left,
            onPressed: onLeftAction ??
                () {
                  Navigator.pop(context);
                },
          ),
          Text(
            text,
            style: kTextHeadline2,
          ),
          const SizedBox(
            height: 60,
            width: 60,
          )
        ],
      ),
    );
  }
}
