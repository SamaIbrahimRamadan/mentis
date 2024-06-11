import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/api/di.dart';
import '../../../core/api/repository.dart';
import '../../../core/local/cache_helper.dart';
import '../../../core/local/enum_init.dart';
import '../../../core/local/user_preferences/user_preferences_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Repository repo;
  LoginCubit(this.repo) : super(LoginInitial());

  static LoginCubit of(context) => BlocProvider.of(context);

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final res = await repo.login(email: email, password: password);
    res.fold(
      (l) => emit(LoginFailure(l.toString())),
      (r) {
        di<CacheHelper>().put(CachingKey.isLogged, true);
        UserPreferencesHelper().saveUserPreference(userData: r);
        emit(LoginSuccess());
      },
    );
  }
}
