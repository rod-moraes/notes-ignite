import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/core.dart';

void main() async {
  // INICIA A APLICAÇÃO FLUTTER
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const AppWidget());
}
