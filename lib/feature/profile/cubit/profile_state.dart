part of 'profile_cubit.dart';

abstract class ProfileState {}

class InitialProfileState extends ProfileState {}

class LoadingProfileState extends ProfileState {}

class ErrorProfileState extends ProfileState {}

class SuccessProfileState extends ProfileState {}

class LoadingLogoutState extends ProfileState {}

class ErrorLogoutState extends ProfileState {}

class SuccessLogoutState extends ProfileState {}

class SuccessUpdateProfileState extends ProfileState {}

class ErrorUpdateProfileState extends ProfileState {}

class LoadingUpdateProfileState extends ProfileState {}
