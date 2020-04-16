import 'dart:async';
import 'package:bloc/bloc.dart';

import 'show_event.dart';
import 'show_state.dart';


class ShowBloc extends Bloc<ShowEvent, ShowState> {
  static final ShowBloc _eventBlocSingleton = ShowBloc._internal();

  factory ShowBloc() {
    return _eventBlocSingleton;
  }

  ShowBloc._internal();

  ShowState get initialState => InitShowState();

  @override
  Stream<ShowState> mapEventToState(ShowEvent event) async* {
    try {
      yield await event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield state;
    }
  }
}
