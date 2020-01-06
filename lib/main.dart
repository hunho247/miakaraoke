import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'screens/MainScreen.dart';
import 'models/ThemeModel.dart';
import 'models/KaraokeLibraryModel.dart';
import 'models/BookmarkModel.dart';
import 'models/RecordingModel.dart';

void main(List<String> args) {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<BookmarkModel>(
      create: (context) => BookmarkModel(),
    ),
    ChangeNotifierProvider<KaraokeLibraryModel>(
      create: (context) => KaraokeLibraryModel(),
    ),
    ChangeNotifierProvider<RecordingModel>(
      create: (context) => RecordingModel(),
    ),
    ChangeNotifierProvider<ThemeChanger>(
      create: (context) => ThemeChanger(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ThemeChanger theme = Provider.of<ThemeChanger>(context);
    return new MaterialApp(
      home: new Splash(),
      theme: theme.getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new MainScreen(),
    );
  }
}
