import '../../models/login_response.dart';
import '../../models/profile_model.dart';

abstract class IUserPreferences {
  void saveUserPreference({required LoginResponse userData});

  LoginResponse? getUserPreference();

  String? getUserTokenPreference();

  void clearUserPreference();

  void saveSeenOnBoarding(bool status);

  bool getSeenOnBoarding();

  void logout();

  void saveProfilePreference({required ProfileModelData userData});

  ProfileModelData? getProfilePreference();
}
