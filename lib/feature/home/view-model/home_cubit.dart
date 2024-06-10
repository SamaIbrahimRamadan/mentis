import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentis/feature/feedback/views/feedback_page.dart';
import 'package:mentis/feature/games/views/games.dart';
import 'package:mentis/feature/home/views/home_page.dart';
import 'package:mentis/feature/notes/views/note_page.dart';
import 'package:mentis/feature/profile/views/profile_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int select = 0;
  void selectPage(int value) {
    select = value;
    emit(BottomBar());
  }

  final pages = [
    const HomePage(),
    const FeedbackPage(),
    const GamesScreen(),
    const NotePage(),
    const ProfileScreen()
  ];
}
