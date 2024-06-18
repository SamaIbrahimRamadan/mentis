import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentis/feature/splash/views/splash_screen.dart';

import 'core/api/cubit/cubit.dart';
import 'core/api/cubit/state.dart';
import 'core/api/di.dart';
import 'core/navigator/named_navigator_impl.dart';
import 'core/navigator/named_navigator_routes.dart';
import 'feature/auth/login/login_cubit.dart';
import 'feature/home/view-model/home_cubit.dart';
import 'feature/splash/splash_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NetworkCubit>(
            create: (BuildContext context) => di<NetworkCubit>()),
        BlocProvider<LoginCubit>(
            create: (BuildContext context) => di<LoginCubit>()),
        BlocProvider(
            create: (BuildContext context) =>
                di<SplashCubit>()..switchAnimation()),
        BlocProvider(
            create: (BuildContext context) =>
                di<HomeCubit>() /*..getHomeData()*/),
        // BlocProvider(create: (BuildContext context) => di<BottomBarCubit>()..getLocalData()),
      ],
      child: BlocListener<NetworkCubit, NetworkStates>(
        listenWhen: (previous, current) {
          return previous.runtimeType != current.runtimeType;
        },
        listener: (BuildContext context, NetworkStates state) {
          switch (state.runtimeType) {
            case UnauthenticatedState:
              NamedNavigatorImpl.pushNamed(Routes.kLogin, clean: true);
              return;
            case SocketErrorState:
              break;
            case ClientErrorState:
              break;
            case ServerErrorState:
              break;
            case ErrorState:
              break;
            default:
          }
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: NamedNavigatorImpl.onGenerateRoute,
          navigatorKey: NamedNavigatorImpl.navigatorState,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
