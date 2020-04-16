library youtube_state;

import 'package:built_value/built_value.dart';

part 'youtube_state.g.dart';

abstract class YoutubeState
    implements Built<YoutubeState, YoutubeStateBuilder> {
  bool get isLoading;

  String get error;

  bool get isInitial => !isLoading && error == '';

  bool get isSuccessful => !isLoading && error == '';

  YoutubeState._();

  factory YoutubeState([updates(YoutubeStateBuilder b)]) = _$YoutubeState;

  factory YoutubeState.initial() {
    return YoutubeState((b) => b
      ..isLoading = false
      ..error = '');
  }

  factory YoutubeState.loading() {
    return YoutubeState((b) => b
      ..isLoading = true
      ..error = '');
  }

  factory YoutubeState.failure(String error) {
    return YoutubeState((b) => b
      ..isLoading = false
      ..error = error);
  }

  factory YoutubeState.success() {
    return YoutubeState((b) => b
      ..isLoading = false
      ..error = '');
  }
}
