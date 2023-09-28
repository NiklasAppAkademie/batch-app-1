import 'package:flutter/material.dart';
import 'package:quiz_app/core/presentation/styles/color_styles.dart';
import 'package:quiz_app/core/presentation/styles/text_styles.dart';

class AGBRequest extends StatefulWidget {
  final Function(bool?)? setAgbAccepted;
  final bool agbAccepted;
  const AGBRequest({super.key, this.setAgbAccepted, required this.agbAccepted});

  @override
  State<AGBRequest> createState() => _AGBRequestState();
}

class _AGBRequestState extends State<AGBRequest> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Transform.scale(
          scale: 2,
          child: Checkbox(
              focusColor: kColorPrimary,
              fillColor: MaterialStateProperty.resolveWith(
                (states) {
                  if (widget.agbAccepted) {
                    return kColorPrimary;
                  } else {
                    return kColorGreyMedium;
                  }
                },
              ),
              value: widget.agbAccepted,
              onChanged: widget.setAgbAccepted),
        ),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
          child: Text(
            "Hiermit akzeptiere ich die AGB und Dateschnutzerklärung der App Akademie GmbH",
            style: kTextInputTitleLight,
          ),
        )
      ],
    );
  }
}
