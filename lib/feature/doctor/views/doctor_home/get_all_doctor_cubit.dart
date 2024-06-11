import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/repository.dart';
import '../../../../core/models/get_doctor_model.dart';

part 'get_all_doctor_state.dart';

class GetAllDoctorCubit extends Cubit<GetAllDoctorState> {
  final Repository repository;
  GetAllDoctorCubit(this.repository) : super(GetAllDoctorInitial());
  static GetAllDoctorCubit get(context) => BlocProvider.of(context);

  GetDoctorResponse? doctorData;
  Future<void> getAllDoctor() async {
    emit(GetAllDoctorLoading());

    final response = await repository.getAllDoctor();
    response.fold(
      (l) => emit(GetAllDoctorError(l.toString())),
      (r) {
        doctorData = r;
        emit(GetAllDoctorSuccess());
      },
    );
  }
}
