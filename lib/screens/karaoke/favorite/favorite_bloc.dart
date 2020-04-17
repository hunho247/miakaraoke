import 'dart:async';
import 'package:bloc/bloc.dart';

import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  static final FavoriteBloc _eventBlocSingleton = FavoriteBloc._internal();

  factory FavoriteBloc() {
    return _eventBlocSingleton;
  }

  FavoriteBloc._internal();

  FavoriteState get initialState => InitialFavoriteState();

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield state;
    }
  }
}
