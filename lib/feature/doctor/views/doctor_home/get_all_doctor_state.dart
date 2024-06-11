part of 'get_all_doctor_cubit.dart';

class GetAllDoctorState {}

class GetAllDoctorInitial extends GetAllDoctorState {}

class GetAllDoctorLoading extends GetAllDoctorState {}

class GetAllDoctorSuccess extends GetAllDoctorState {}

class GetAllDoctorError extends GetAllDoctorState {
  final String message;
  GetAllDoctorError(this.message);
}
