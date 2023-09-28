import 'package:flutter/material.dart';
import 'package:quiz_app/core/presentation/styles/border_styles.dart';
import 'package:quiz_app/core/presentation/styles/color_styles.dart';
import 'package:quiz_app/core/presentation/styles/position_styles.dart';
import 'package:quiz_app/core/presentation/styles/text_styles.dart';
import 'package:quiz_app/features/game_configuration/domain/category_model.dart';

class CategoryTile extends StatelessWidget {
  final String name;
  final bool selected;
  final Category category;
  final Function(Category) selectCategory;

  const CategoryTile(
      {super.key,
      required this.name,
      this.selected = false,
      required this.category,
      required this.selectCategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingVerMedium,
      child: GestureDetector(
        onTap: () => selectCategory(category),
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width - 40,
          padding: kPaddingHorMedium,
          decoration: BoxDecoration(
            borderRadius: kBorderRadiusAllMedium,
            color: selected ? kColorSecondary : kColorGreyMedium,
          ),
          child: Row(
            children: [
              Image.asset("assets/images/aa_pattern.png"),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  name,
                  style: kTextHeadline2,
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: kColorWhite,
                size: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
