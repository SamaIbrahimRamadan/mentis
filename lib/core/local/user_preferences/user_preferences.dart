import '../../models/login_response.dart';

abstract class IUserPreferences {
  void saveUserPreference({required LoginResponse userData});

  LoginResponse? getUserPreference();

  String? getUserTokenPreference();

  void clearUserPreference();

  void saveSeenOnBoarding(bool status);

  bool getSeenOnBoarding();

  void logout();
}
