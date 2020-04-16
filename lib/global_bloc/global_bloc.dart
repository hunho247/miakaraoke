import 'dart:async';
import 'package:bloc/bloc.dart';

import 'index.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  static final GlobalBloc _globalBlocSingleton = GlobalBloc._internal();

  factory GlobalBloc() {
    return _globalBlocSingleton;
  }

  GlobalBloc._internal();

  bool darkModeOn = false;

  GlobalState get initialState => UnGlobalState();

  @override
  Stream<GlobalState> mapEventToState(
    GlobalEvent event,
  ) async* {
    try {
      yield UnGlobalState();
      yield await event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield state;
    }
  }
}
