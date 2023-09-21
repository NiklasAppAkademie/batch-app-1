import 'package:flutter/material.dart';
import 'package:quiz_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:quiz_app/features/onboarding/presentation/pages/welcome_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: WelcomePage());
  }
}
