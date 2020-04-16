import 'package:meta/meta.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:miakaraoke/utils/definition.dart';

import 'index.dart';

@immutable
abstract class GlobalEvent {
  Future<GlobalState> applyAsync({GlobalState currentState, GlobalBloc bloc});
}

class DarkModeEvent extends GlobalEvent {
  final bool darkOn;

  DarkModeEvent(this.darkOn);

  @override
  Future<GlobalState> applyAsync(
      {GlobalState currentState, GlobalBloc bloc}) async {
    try {
      bloc.darkModeOn = darkOn;
      Definitions.prefs.setBool(Definitions.darkModePref, darkOn);
      return InGlobalState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return ErrorGlobalState(_?.toString());
    }
  }
}

class InitEvent extends GlobalEvent {
  @override
  Future<GlobalState> applyAsync(
      {GlobalState currentState, GlobalBloc bloc}) async {
    return InGlobalState();
  }
}
