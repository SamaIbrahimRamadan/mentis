import 'package:dartz/dartz.dart';
import 'package:mentis/core/models/edit_profile_model.dart';

import '../../feature/auth/sign_up/sign_up_cubit.dart';
import '../models/general_response.dart';
import '../models/get_doctor_model.dart';
import '../models/letter_model.dart';
import '../models/login_response.dart';
import '../models/profile_model.dart';
import '../models/recover_password.dart';
import '../models/reset_pass_model.dart';
import '../models/show_doctor_model.dart';

abstract class Repository {
  Future<Either<dynamic, LoginResponse>> login({required String email, required String password});
  Future<Either<dynamic, LoginResponse>> signup(SignUpParams params);
  Future<Either<dynamic, GeneralResponse>> logout();

  Future<Either<dynamic, GeneralResponse>> checkCode({required String email, required String code});
  Future<Either<dynamic, ResetPassResponse>> resetPassword({
    required String userId,
    required String oldPassword,
    required String password,
    required String passwordConfirmation,
  });
  Future<Either<dynamic, RecoverPasswordResponse>> recoverPassword({required String email});
  Future<Either<dynamic, GetDoctorResponse>> getAllDoctor({String? search});
  Future<Either<dynamic, ShowDoctorResponse>> showDoctor(String id);

  Future<Either<dynamic, ProfileModel>> profile();
  Future<Either<dynamic, EditProfileModel>> editProfile(
      {required String phone, required String email});

  Future<Either<dynamic, LetterModelResponse>> letters();
}
