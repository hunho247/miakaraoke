import 'dart:async';
import 'package:meta/meta.dart';

import 'youtube_bloc.dart';
import 'youtube_provider.dart';
import 'youtube_state.dart';

@immutable
abstract class YoutubeEvent {
  Stream<YoutubeState> applyAsync(
      {YoutubeState currentState, YoutubeBloc bloc});
}

class InitialYoutubeEvent extends YoutubeEvent {
  final String query;

  InitialYoutubeEvent(this.query);

  @override
  Stream<YoutubeState> applyAsync(
      {YoutubeState currentState, YoutubeBloc bloc}) async* {
    yield YoutubeState.initial();
  }
}

class FetchingYoutubeEvent extends YoutubeEvent {
  @override
  Stream<YoutubeState> applyAsync(
      {YoutubeState currentState, YoutubeBloc bloc}) async* {
    yield YoutubeState.success();
  }
}
