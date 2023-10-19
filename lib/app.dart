import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/features/game_configuration/presentation/pages/category_selection_page.dart';
import 'package:quiz_app/features/onboarding/domain/user_model.dart';
import 'package:quiz_app/features/onboarding/presentation/pages/welcome_page.dart';
import 'package:quiz_app/features/onboarding/presentation/providers/onboarding_provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Box<User> userBox = Hive.box<User>("userBox");
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    // isLoggedIn = userBox.containsKey("1");
    return ChangeNotifierProvider(
      create: (context) => OnboardingProvider(),
      child: MaterialApp(
          themeMode: ThemeMode.light,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const WelcomePage()),
    );
  }
}
