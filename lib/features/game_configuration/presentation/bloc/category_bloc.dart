import 'package:bloc/bloc.dart';
import 'package:quiz_app/features/game_configuration/application/category_service.dart';
import 'package:quiz_app/features/game_configuration/presentation/bloc/category_events.dart';
import 'package:quiz_app/features/game_configuration/presentation/bloc/category_states.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryService categoryService = CategoryService();

  CategoryBloc() : super(InitialCategoryState()) {
    on<LoadCategories>((event, emit) async {
      emit(LoadingCategoryState());
      try {
        final categories = await categoryService.fetchCategories();
        emit(LoadedCategoryState(categories: categories));
      } catch (err) {
        emit(ErrorCategoryState());
      }
    });

    on<SelectCategory>((event, emit) {
      emit(LoadedCategoryState(
          categories: (state as LoadedCategoryState).categories,
          selectedCategory: event.category));
    });
  }
}
