import 'dart:async';
import 'package:bloc/bloc.dart';

import 'youtube_event.dart';
import 'youtube_state.dart';

class YoutubeBloc extends Bloc<YoutubeEvent, YoutubeState> {
  static final YoutubeBloc _eventBlocSingleton = YoutubeBloc._internal();

  factory YoutubeBloc() {
    return _eventBlocSingleton;
  }

  YoutubeBloc._internal();

  YoutubeState get initialState => YoutubeState.success();

  @override
  Stream<YoutubeState> mapEventToState(YoutubeEvent event) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield state;
    }
  }
}
