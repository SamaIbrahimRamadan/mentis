import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/repository.dart';

part 'recover_password_state.dart';

class RecoverPasswordCubit extends Cubit<RecoverPasswordState> {
  final Repository repo;
  RecoverPasswordCubit(this.repo) : super(RecoverPasswordInitial());

  static RecoverPasswordCubit of(context) => BlocProvider.of(context);

  Future<void> recoverPassword({required String email}) async {
    emit(RecoverPasswordLoading());
    final res = await repo.recoverPassword(email: email);
    res.fold(
      (l) => emit(RecoverPasswordFailure(l.toString())),
      (r) => emit(RecoverPasswordSuccess()),
    );
  }
}
