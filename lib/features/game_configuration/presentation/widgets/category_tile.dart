import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/presentation/styles/border_styles.dart';
import 'package:quiz_app/core/presentation/styles/color_styles.dart';
import 'package:quiz_app/core/presentation/styles/position_styles.dart';
import 'package:quiz_app/core/presentation/styles/text_styles.dart';
import 'package:quiz_app/features/game_configuration/domain/category_model.dart';
import 'package:quiz_app/features/game_configuration/presentation/bloc/category_bloc.dart';
import 'package:quiz_app/features/game_configuration/presentation/bloc/category_events.dart';
import 'package:quiz_app/features/game_configuration/presentation/bloc/category_states.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      bool selected =
          category == (state as LoadedCategoryState).selectedCategory;
      return Padding(
        padding: kPaddingVerMedium,
        child: GestureDetector(
          onTap: () => context
              .read<CategoryBloc>()
              .add(SelectCategory(category: category)),
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
