import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miakaraoke/utils/definition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global_bloc/global_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //* Forcing only portrait orientation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white));

  // * Get Shared Preference Instance for whole app
  Definitions.prefs = await SharedPreferences.getInstance();

  runApp(GlobalPage());
}
