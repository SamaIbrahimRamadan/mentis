import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:mentis/core/api/repository.dart';
import 'package:mentis/core/api/repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/auth/login/cubits/login/login_cubit.dart';
import '../../feature/auth/login/cubits/recover_password/recover_password_cubit.dart';
import '../../feature/auth/sign_up/sign_up_cubit.dart';
import '../../feature/doctor/views/doctor_home/get_all_doctor_cubit.dart';
import '../../feature/games/cubit/game_cubit.dart';
import '../../feature/home/view-model/home_cubit.dart';
import '../../feature/profile/cubit/profile_cubit.dart';
import '../../feature/splash/splash_cubit.dart';
import '../dio/dio_helper.dart';
import '../dio/wrapper.dart';
import '../local/cache_helper.dart';
import 'cubit/cubit.dart';

GetIt di = GetIt.I;

Future init() async {
  await dotenv.load(fileName: '.env');
  final sp = await SharedPreferences.getInstance();
  di.registerLazySingleton<SharedPreferences>(() => sp);
  // di.registerLazySingleton<AppNavigator>(() => AppNavigator());
  //final userAgent = await userAgentClientHintsHeader();
  di.registerLazySingleton<NetworkCubit>(() => NetworkCubit());
  di.registerLazySingleton<DioHelper>(
    () => DioImpl(
      userAgent:
          'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Mobile Safari/537.36',
      baseURL: dotenv.env['BASE_URL']!,
      onRequest: di<NetworkCubit>().onRequestCallback,
      onError: di<NetworkCubit>().onErrorCallback,
    ),
  );

  di.registerFactory<SplashCubit>(() => SplashCubit());
  di.registerLazySingleton<Repository>(() => RepoImpl(di<DioHelper>()));
  di.registerLazySingleton<CacheHelper>(() => CacheImpl(di<SharedPreferences>()));
  di.registerFactory<LoginCubit>(() => LoginCubit(di<Repository>()));
  di.registerFactory<RecoverPasswordCubit>(() => RecoverPasswordCubit(di<Repository>()));
  di.registerFactory<SignUpCubit>(() => SignUpCubit(di<Repository>()));
  di.registerFactory<HomeCubit>(() => HomeCubit(di<Repository>()));
  di.registerFactory<ProfileCubit>(() => ProfileCubit(di<Repository>())..getProfile());

  di.registerFactory<GameCubit>(() => GameCubit(di<Repository>()));

  di.registerFactory<GetAllDoctorCubit>(() => GetAllDoctorCubit(di<Repository>()));
}
