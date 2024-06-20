import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mentis/core/api/repository.dart';
import 'package:mentis/core/models/general_response.dart';
import 'package:mentis/core/models/letter_model.dart';

import '../../feature/auth/sign_up/sign_up_cubit.dart';
import '../dio/dio_helper.dart';
import '../models/edit_profile_model.dart';
import '../models/get_doctor_model.dart';
import '../models/login_response.dart';
import '../models/profile_model.dart';
import '../models/recover_password.dart';
import '../models/reset_pass_model.dart';
import '../models/show_doctor_model.dart';

class RepoImpl extends Repository {
  final DioHelper dioHelper;
  RepoImpl(this.dioHelper);

  @override
  Future<Either<dynamic, LoginResponse>> login(
      {required String email, required String password}) async {
    return responseHandling<LoginResponse>(
      onSuccess: () async {
        final r = await dioHelper.post(
          'login',
          data: {'email': email, 'password': password},
        );
        return LoginResponse.fromJson(jsonDecode(r.data));
      },
    );
  }

  @override
  Future<Either<dynamic, GeneralResponse>> logout() async {
    return responseHandling<GeneralResponse>(
      onSuccess: () async {
        final f = await dioHelper.post('logout');
        return GeneralResponse.fromJson(jsonDecode(f.data));
      },
    );
  }

  @override
  Future<Either<dynamic, LoginResponse>> signup(SignUpParams params) async {
    return responseHandling<LoginResponse>(
      onSuccess: () async {
        final f = await dioHelper.post('register', data: params.toMap());
        return LoginResponse.fromJson(jsonDecode(f.data));
      },
    );
  }

  @override
  Future<Either<dynamic, ResetPassResponse>> resetPassword({
    required String userId,
    required String oldPassword,
    required String password,
    required String passwordConfirmation,
  }) {
    return responseHandling<ResetPassResponse>(
      onSuccess: () async {
        final f = await dioHelper.post(
          'reset/password',
          data: {
            'user_id': userId,
            'old_password': oldPassword,
            'password': password,
            'password_confirmation': passwordConfirmation,
          },
        );
        return ResetPassResponse.fromJson(jsonDecode(f.data));
      },
    );
  }

  @override
  Future<Either<dynamic, RecoverPasswordResponse>> recoverPassword({required String email}) {
    return responseHandling<RecoverPasswordResponse>(
      onSuccess: () async {
        final f = await dioHelper.post(
          'recover/password',
          data: {'email': email},
        );
        return RecoverPasswordResponse.fromJson(jsonDecode(f.data));
      },
    );
  }

  @override
  Future<Either<dynamic, GeneralResponse>> checkCode(
      {required String email, required String code}) {
    return responseHandling<GeneralResponse>(
      onSuccess: () async {
        final f = await dioHelper.post(
          'check/code',
          data: {
            'email': email,
            'code': code,
          },
        );
        return GeneralResponse.fromJson(jsonDecode(f.data));
      },
    );
  }

  @override
  Future<Either<dynamic, GetDoctorResponse>> getAllDoctor({String? search}) {
    return responseHandling<GetDoctorResponse>(
      onSuccess: () async {
        final f = await dioHelper.get(
          'doctors/all',
          queryParams: {
            'search': search,
          },
        );
        return GetDoctorResponse.fromJson(jsonDecode(f.data));
      },
    );
  }

  @override
  Future<Either<dynamic, ShowDoctorResponse>> showDoctor(String id) {
    return responseHandling<ShowDoctorResponse>(
      onSuccess: () async {
        final f = await dioHelper.get('doctors/show/$id');
        return ShowDoctorResponse.fromJson(jsonDecode(f.data));
      },
    );
  }

  @override
  Future<Either<dynamic, EditProfileModel>> editProfile({
    required String phone,
    required String email,
  }) {
    return responseHandling<EditProfileModel>(
      onSuccess: () async {
        final f = await dioHelper.post('users/edit/profile',
            data: FormData.fromMap({
              'email': email,
              'phone': phone,
            }));
        return EditProfileModel.fromJson(jsonDecode(f.data));
      },
    );
  }

  @override
  Future<Either<dynamic, ProfileModel>> profile() {
    return responseHandling<ProfileModel>(
      onSuccess: () async {
        final f = await dioHelper.get('patients/edit');

        return ProfileModel.fromJson(jsonDecode(f.data));
      },
    );
  }

  @override
  Future<Either<dynamic, LetterModelResponse>> letters() {
    return responseHandling<LetterModelResponse>(
      onSuccess: () async {
        final r = await dioHelper.get('letters');
        return LetterModelResponse.fromJson(jsonDecode(r.data));
      },
    );
  }
}

extension on Repository {
  dynamic onServerErrorBase(dynamic e) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.badResponse:
          Object? msg;
          if (e.response?.data is Map) {
            msg = e.response?.data['error_msg'];
            msg ??= e.response?.data['message'];
          } else {
            msg = e.response?.data;
          }
          return msg ?? e.error;
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.connectionError:
          if (e.error is SocketException) {
            return 'تعذر الإتصال بالخادم، أعد المحاولة لاحقًا';
          }
          return e.message ?? e.error.toString();
        default:
          return e.toString();
      }
    }
    return e.toString();
  }

  Future<Either<String, T>> responseHandling<T>({
    required Future<T> Function() onSuccess,
    Future<String> Function(Exception exception)? onOtherError,
  }) async {
    try {
      final f = await onSuccess();
      return Right(f);
    } on SocketException {
      return const Left('Please Check Your Internet Connection');
    } on Exception catch (e) {
      if (onOtherError != null) {
        final f = await onOtherError(e);
        return Left(f.toString());
      }
      final f = onServerErrorBase(e);
      return Left(f.toString());
    }
  }
}
