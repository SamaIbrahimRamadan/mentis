import '../../api/di.dart';
import '../../models/login_response.dart';
import '../../models/profile_model.dart';
import '../../navigator/named_navigator_impl.dart';
import '../../navigator/named_navigator_routes.dart';
import '../cache_helper.dart';
import '../enum_init.dart';
import 'user_preferences.dart';

class UserPreferencesHelper implements IUserPreferences {
  @override
  void saveUserPreference({required LoginResponse? userData}) {
    di<CacheHelper>().put(CachingKey.userData, userData);
  }

  @override
  LoginResponse? getUserPreference() {
    if (di<CacheHelper>().get(CachingKey.userData) != null) {
      return LoginResponse.fromJson(di<CacheHelper>().get(CachingKey.userData));
    } else {
      return null;
    }
  }

  @override
  String? getUserTokenPreference() {
    String? accessToken;
    if (di<CacheHelper>().has(CachingKey.userData)) {
      LoginResponse model = LoginResponse.fromJson(di<CacheHelper>().get(CachingKey.userData));
      accessToken = model.data;
    }
    return accessToken;
  }

  @override
  void clearUserPreference() {
    di<CacheHelper>().clear(CachingKey.userData);
    di<CacheHelper>().clear(CachingKey.isLogged);
  }

  @override
  bool getSeenOnBoarding() => di<CacheHelper>().getBool(CachingKey.onBoarding);

  @override
  void saveSeenOnBoarding(bool status) {
    di<CacheHelper>().put(CachingKey.onBoarding, status);
  }

  @override
  void logout() {
    di<CacheHelper>().logOut();
    di<CacheHelper>().clear(CachingKey.userData);
    NamedNavigatorImpl.pushNamed(Routes.kLogin, clean: true);
  }

  @override
  void saveProfilePreference({required ProfileModelData? userData}) {
    di<CacheHelper>().put(CachingKey.profile, userData);
  }

  @override
  ProfileModelData? getProfilePreference() {
    if (di<CacheHelper>().get(CachingKey.profile) != null) {
      return ProfileModelData.fromJson(di<CacheHelper>().get(CachingKey.profile));
    } else {
      return null;
    }
  }
}
