import '../../../feature/auth/login/login_cubit.dart';

abstract class IUserPreferences {
  void saveUserPreference({required LoginResponse userData});

  LoginResponse? getUserPreference();

  String? getUserTokenPreference();

  void clearUserPreference();

  void saveSeenOnBoarding(bool status);

  bool getSeenOnBoarding();

  void logout();
}
