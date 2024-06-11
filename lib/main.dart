import 'package:flutter/material.dart';

import 'app.dart';
import 'core/init_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}
