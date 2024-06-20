part of 'game_cubit.dart';

class GameState {}

class GameInitialState extends GameState {}

class GameLoadingState extends GameState {}

class GameSuccessState extends GameState {}

class GameErrorState extends GameState {
  final String message;

  GameErrorState(this.message);
}
