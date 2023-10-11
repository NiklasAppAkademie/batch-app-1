import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive/hive.dart';
import 'package:quiz_app/features/game_configuration/presentation/pages/category_selection_page.dart';
import 'package:quiz_app/features/onboarding/domain/user_model.dart';
import 'package:quiz_app/features/onboarding/presentation/pages/welcome_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Box<User> userBox = Hive.box<User>("userBox");
  bool isLoggedIn = false;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      FlutterNativeSplash.remove();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // isLoggedIn = userBox.containsKey("1");
    return MaterialApp(
        home: isLoggedIn ? const CategorySelectionPage() : const WelcomePage());
  }
}
