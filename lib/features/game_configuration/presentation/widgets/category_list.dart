import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/game_configuration/presentation/bloc/category_bloc.dart';
import 'package:quiz_app/features/game_configuration/presentation/bloc/category_states.dart';
import 'package:quiz_app/features/game_configuration/presentation/widgets/category_tile.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is LoadedCategoryState) {
        return Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: state.categories
                .map(
                  (val) => CategoryTile(
                    category: val,
                  ),
                )
                .toList(),
          ),
        );
      } else if (state is ErrorCategoryState) {
        return const Center(
          child: Icon(
            Icons.error,
            color: Colors.red,
          ),
        );
      }
      return const CircularProgressIndicator();
    });
  }
}
