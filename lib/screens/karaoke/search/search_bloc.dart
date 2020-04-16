import 'dart:async';
import 'package:bloc/bloc.dart';

import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  static final SearchBloc _eventBlocSingleton = SearchBloc._internal();

  factory SearchBloc() {
    return _eventBlocSingleton;
  }

  SearchBloc._internal();

  SearchState get initialState => SearchState.initial();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield state;
    }
  }
}
