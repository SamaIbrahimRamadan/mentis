import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/api/repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final Repository repository;

  ProfileCubit(this.repository) : super(InitialProfileState());

  static ProfileCubit of(context) => BlocProvider.of(context);
  // ProfileData? profileData;
  String userExtiontion = '';

  // void getProfile() async {
  //   emit(LoadingProfileState());
  //   final f = await repository.profile();
  //   f.fold(
  //     (l) {
  //       emit(ErrorProfileState());
  //     },
  //     (r) {
  //       // profileData = r.data;
  //       // userExtiontion = getInitials(profileData!.name!);
  //       emit(SuccessProfileState());
  //     },
  //   );
  // }

  // void editProfile({required String name, required String email}) async {
  //   emit(LoadingUpdateProfileState());
  //   final f = await repository.editProfile(name: name, email: email);
  //   f.fold(
  //     (l) => emit(ErrorUpdateProfileState()),
  //     (r) {
  //       // profileData = r.data;
  //       // userExtiontion = getInitials(profileData!.name!);
  //       NamedNavigatorImpl.pop();
  //       PopUpHelper.showSnakeBar(message: r.message.toString(), isError: false);
  //       emit(SuccessUpdateProfileState());
  //     },
  //   );
  // }

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
