import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/core/presentation/styles/border_styles.dart';
import 'package:quiz_app/core/presentation/styles/color_styles.dart';
import 'package:quiz_app/core/presentation/styles/position_styles.dart';
import 'package:quiz_app/core/presentation/styles/text_styles.dart';
import 'package:quiz_app/features/game_configuration/domain/category_model.dart';
import 'package:quiz_app/features/game_configuration/presentation/providers/category_provider.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, provider, child) {
      bool selected = category == provider.selectedCategory;
      return Padding(
        padding: kPaddingVerMedium,
        child: GestureDetector(
          onTap: () => provider.setSelectedCategory(category),
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
                    category.name,
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
    });
  }
}
