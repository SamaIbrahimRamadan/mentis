import 'package:dartz/dartz.dart';

import '../../feature/auth/login/login_cubit.dart';

abstract class Repository {
  Future<Either<dynamic, LoginResponse>> login({required String email, required String password});
}
