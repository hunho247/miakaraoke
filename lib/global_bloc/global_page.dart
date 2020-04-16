import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miakaraoke/utils/definition.dart';
import 'package:miakaraoke/widgets/waiting_screen.dart';

import 'index.dart';
import 'main_screen.dart';

class GlobalPage extends StatefulWidget {
  @override
  _GlobalPageState createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {
  @override
  void initState() {
    super.initState();
    _setupApp();
  }

  _setupApp() {
    GlobalBloc().darkModeOn =
        Definitions.prefs.getBool(Definitions.darkModePref) ?? false;

    GlobalBloc().add(InitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: GlobalBloc(),
      listener: (context, state) {},
      child: BlocBuilder<GlobalBloc, GlobalState>(
        bloc: GlobalBloc(),
        builder: (
          BuildContext context,
          GlobalState state,
        ) {
          return MaterialApp(
            title: 'Chatty Parrot',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: Definitions.googleSansFamily,
              primarySwatch: Colors.red,
              primaryColor:
                  GlobalBloc().darkModeOn ? Colors.black : Colors.white,
              disabledColor: Colors.grey,
              cardColor: GlobalBloc().darkModeOn ? Colors.black : Colors.white,
              canvasColor:
                  GlobalBloc().darkModeOn ? Colors.black : Colors.grey[50],
              brightness:
                  GlobalBloc().darkModeOn ? Brightness.dark : Brightness.light,
              buttonTheme: Theme.of(context).buttonTheme.copyWith(
                  colorScheme: GlobalBloc().darkModeOn
                      ? ColorScheme.dark()
                      : ColorScheme.light()),
              appBarTheme: AppBarTheme(
                elevation: 0.0,
              ),
            ),
            home: _buildHomePage(context, state),
          );
        },
      ),
    );
  }

  Widget _buildHomePage(BuildContext context, GlobalState state) {
    if (state is InGlobalState) {
      return MainScreen();
    } else if (state is LogginginState) {
      return WaitingScreen();
    } else {
      return MainScreen();
    }
  }
}
