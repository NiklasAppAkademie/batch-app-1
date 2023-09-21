import 'package:flutter/material.dart';
import 'package:quiz_app/core/presentation/styles/border_styles.dart';
import 'package:quiz_app/core/presentation/styles/color_styles.dart';

class SecondaryIconButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;

  const SecondaryIconButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Material(
        color: kColorGreyMedium,
        borderRadius: kBorderRadiusAllMedium,
        child: InkWell(
          borderRadius: kBorderRadiusAllMedium,
          onTap: onPressed,
          child: Center(
              child: Icon(
            icon,
            color: kColorWhite,
            size: 40.0,
          )),
        ),
      ),
    );
  }
}
