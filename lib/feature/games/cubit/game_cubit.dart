import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/api/repository.dart';
import '../../../core/models/letter_model.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final Repository repo;
  GameCubit(this.repo) : super(GameInitialState());

  static GameCubit of(context) => BlocProvider.of(context);
  LetterModelResponse? model;
  Future<void> getGameLetters() async {
    emit(GameLoadingState());
    final res = await repo.letters();
    res.fold(
      (l) => emit(GameErrorState(l.toString())),
      (r) {
        model = r;
        emit(GameSuccessState());
      },
    );
  }
}
