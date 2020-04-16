import 'dart:async';
import 'package:meta/meta.dart';

import 'show_bloc.dart';
import 'show_state.dart';

@immutable
abstract class ShowEvent {
  Future<ShowState> applyAsync({ShowState currentState, ShowBloc bloc});
}

class InitShowEvent extends ShowEvent {
  @override
  Future<ShowState> applyAsync(
      {ShowState currentState, ShowBloc bloc}) async {
    return InitShowState();
  }
}
