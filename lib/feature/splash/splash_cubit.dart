import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/api/di.dart';
import '../../core/local/cache_helper.dart';
import '../../core/local/enum_init.dart';
import '../../core/local/user_preferences/user_preferences_helper.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  static SplashCubit get(context) => BlocProvider.of(context);
  bool openAnimation = false;
  int splashDuration = 3;
  bool hideBtn = false;

  switchAnimation() {
    Future.delayed(Duration(seconds: splashDuration), () {
      openAnimation = true;
      runSplash();
    });
  }

  runSplash() {
    Future.delayed(const Duration(milliseconds: 500), () async {
      bool isLogged = di<CacheHelper>().getBool(CachingKey.isLogged);
      if (isLogged == true) {
        String? token = UserPreferencesHelper().getUserTokenPreference();
        log('Hello Sama => $token');
        log('isLogged ==> $isLogged');

        emit(AuthenticatedState());
        hideBtn = false;
      } else {
        emit(UnAuthenticatedState());
        hideBtn = true;
      }
    });
  }
}
