import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/api/di.dart';
import '../../../core/api/repository.dart';
import '../../../core/local/cache_helper.dart';
import '../../../core/local/enum_init.dart';
import '../../../core/local/user_preferences/user_preferences_helper.dart';
import '../../../core/models/login_response.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final Repository repository;
  SignUpCubit(this.repository) : super(SignUpInitial());

  static SignUpCubit of(context) => BlocProvider.of(context);

  Future<void> signup(SignUpParams params) async {
    emit(SignUpLoading());
    final f = await repository.signup(params);
    f.fold(
      (l) => emit(SignUpError(l.toString())),
      (r) {
        di<CacheHelper>().put(CachingKey.isLogged, true);
        LoginResponse response = r;
        UserPreferencesHelper().saveUserPreference(userData: response);
        emit(SignUpSuccess());
      },
    );
  }
}

class SignUpParams {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String idNumber;
  final String password;
  final String passwordConfirmation;

  SignUpParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.idNumber,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'id_number': idNumber,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}
