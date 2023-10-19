import 'package:flutter/material.dart';
import 'package:quiz_app/features/onboarding/application/onboarding_service.dart';

class OnboardingProvider extends ChangeNotifier {
  OnboardingService onboardingService = OnboardingService();
  TextEditingController usernameController = TextEditingController();
  String _avatarImagePath = "";
  bool _agbAccepted = false;

  String get avatarImagePath => _avatarImagePath;
  bool get agbAccepted => _agbAccepted;

  void setAvatarImagePath(imagePath) {
    _avatarImagePath = imagePath ?? "";
    notifyListeners();
  }

  void setAgbAccepted(bool? val) {
    _agbAccepted = val ?? false;
    notifyListeners();
  }

  void createUser() {
    onboardingService.createUser(
        name: usernameController.text,
        agbAccepted: agbAccepted,
        avatarImagePath: avatarImagePath);
  }
}
