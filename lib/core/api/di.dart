import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:mentis/core/api/repository.dart';
import 'package:mentis/core/api/repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../feature/auth/login/login_cubit.dart';
import '../../feature/home/view-model/home_cubit.dart';
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
  final userAgent = await userAgentClientHintsHeader();
  di.registerLazySingleton<NetworkCubit>(() => NetworkCubit());
  di.registerLazySingleton<DioHelper>(
    () => DioImpl(
      userAgent: userAgent.values.first.toString(),
      baseURL: dotenv.env['BASE_URL']!,
      onRequest: di<NetworkCubit>().onRequestCallback,
      onError: di<NetworkCubit>().onErrorCallback,
    ),
  );

  di.registerFactory<SplashCubit>(() => SplashCubit());
  di.registerLazySingleton<Repository>(() => RepoImpl(di<DioHelper>()));
  di.registerLazySingleton<CacheHelper>(() => CacheImpl(di<SharedPreferences>()));
  di.registerFactory<LoginCubit>(() => LoginCubit(di<Repository>()));
  di.registerFactory<HomeCubit>(() => HomeCubit(di<Repository>()));

  /// ========================================================================
}

// UserModel? get userData => UserPreferencesHelper().getUserPreference();
