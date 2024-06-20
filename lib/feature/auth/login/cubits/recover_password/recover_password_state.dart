part of 'recover_password_cubit.dart';

class RecoverPasswordState {}

class RecoverPasswordInitial extends RecoverPasswordState {}

class RecoverPasswordLoading extends RecoverPasswordState {}

class RecoverPasswordSuccess extends RecoverPasswordState {}

class RecoverPasswordFailure extends RecoverPasswordState {
  final String message;

  RecoverPasswordFailure(this.message);
}
