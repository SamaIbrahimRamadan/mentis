import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentis/core/models/profile_model.dart';

import '../../../core/api/di.dart';
import '../../../core/api/repository.dart';
import '../../../core/local/cache_helper.dart';
import '../../../core/local/enum_init.dart';
import '../../../core/local/user_preferences/user_preferences_helper.dart';
import '../../../core/navigator/named_navigator_impl.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final Repository repository;

  ProfileCubit(this.repository) : super(InitialProfileState());

  static ProfileCubit of(context) => BlocProvider.of(context);

  void saveUserDate(ProfileModelData userModel) {
    UserPreferencesHelper().saveProfilePreference(userData: userModel);
  }

  ProfileModelData? profileData;

  Future<void> getProfile() async {
    emit(LoadingProfileState());
    final f = await repository.profile();
    f.fold(
      (l) => emit(ErrorProfileState()),
      (r) {
        profileData = r.data;
        di<CacheHelper>().put(CachingKey.profile, true);
        saveUserDate(profileData!);
        emit(SuccessProfileState(r.data));
      },
    );
  }

  void editProfile({required String phone, required String email}) async {
    emit(LoadingUpdateProfileState());
    final f = await repository.editProfile(phone: phone, email: email);
    f.fold(
      (l) => emit(ErrorUpdateProfileState()),
      (r) {
        // profileData = r.data;
        NamedNavigatorImpl.pop();
        //PopUpHelper.showSnakeBar(message: r.message.toString(), isError: false);
        emit(SuccessUpdateProfileState());
      },
    );
  }

  void logout() async {
    emit(LoadingProfileState());
    final f = await repository.logout();
    f.fold(
      (l) {
        emit(ErrorLogoutState());
      },
      (r) {
        emit(SuccessLogoutState());
      },
    );
  }

  String getInitials(String fullName) {
    List<String> nameSplit = fullName.split(' ');
    String initials = '';
    for (String name in nameSplit) {
      if (name.isNotEmpty) {
        initials += name[0];
      }
    }
    return initials;
  }
}
