import 'dart:async';
import 'package:meta/meta.dart';

import '../../../model/firebase/favorite_model.dart';
import 'favorite_bloc.dart';
import 'favorite_provider.dart';
import 'favorite_state.dart';

@immutable
abstract class FavoriteEvent {
  Stream<FavoriteState> applyAsync(
      {FavoriteState currentState, FavoriteBloc bloc});
}

class InitialFavoriteEvent extends FavoriteEvent {
  final String query;

  InitialFavoriteEvent(this.query);

  @override
  Stream<FavoriteState> applyAsync(
      {FavoriteState currentState, FavoriteBloc bloc}) async* {
    yield InitialFavoriteState();
  }
}

class FetchingFavoriteEvent extends FavoriteEvent {
  @override
  Stream<FavoriteState> applyAsync(
      {FavoriteState currentState, FavoriteBloc bloc}) async* {}
}

class PostingFavoriteEvent extends FavoriteEvent {
  final Favorite favorite;

  PostingFavoriteEvent(this.favorite);

  @override
  Stream<FavoriteState> applyAsync(
      {FavoriteState currentState, FavoriteBloc bloc}) async* {
    await FavoriteProvider.postFavKaraoke(favorite);
    yield currentState;
  }
}
