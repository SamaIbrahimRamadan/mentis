import 'dart:io';

import 'package:bloc/bloc.dart';

import 'api/di.dart';
import 'bloc_observer.dart';

Future<void> initServices() async {
  await init();
  HttpOverrides.global = MyHttpOverrides();
  Bloc.observer = BlocObserverService();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
