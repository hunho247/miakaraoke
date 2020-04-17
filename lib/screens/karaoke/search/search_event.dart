import 'dart:async';
import 'package:meta/meta.dart';
import 'package:miakaraoke/model/youtube/video_model.dart';

import 'search_bloc.dart';
import 'search_provider.dart';
import 'search_state.dart';

@immutable
abstract class SearchEvent {
  Stream<SearchState> applyAsync({SearchState currentState, SearchBloc bloc});
}

class InitialSearchEvent extends SearchEvent {
  final String query;

  InitialSearchEvent(this.query);

  @override
  Stream<SearchState> applyAsync(
      {SearchState currentState, SearchBloc bloc}) async* {
    if (query.isEmpty) {
      yield SearchState.initial();
    } else {
      yield SearchState.loading();

      try {
        final searchResult = await SearchProvider.searchVideos(query);
        yield SearchState.success(searchResult);
      } on YoutubeSearchError catch (e) {
        yield SearchState.failure(e.message);
      } on NoSearchResultsException catch (e) {
        yield SearchState.failure(e.message);
      }
    }
  }
}

class FetchingSearchEvent extends SearchEvent {
  @override
  Stream<SearchState> applyAsync(
      {SearchState currentState, SearchBloc bloc}) async* {
    try {
      final nextPageResults = await SearchProvider.fetchNextResultPage();

      yield SearchState.success(currentState.searchResults + nextPageResults);
    } on NoNextPageTokenException catch (_) {
      yield currentState.rebuild((b) => b..hasReachedEndOfResults = true);
    } on SearchNotInitiatedException catch (e) {
      yield SearchState.failure(e.message);
    } on YoutubeSearchError catch (e) {
      yield SearchState.failure(e.message);
    }
  }
}
