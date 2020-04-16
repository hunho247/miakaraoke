import 'package:http/http.dart' as http;
import 'package:built_collection/built_collection.dart';
import 'package:miakaraoke/model/detail_model.dart';
import 'package:miakaraoke/model/search_model.dart';
import 'package:miakaraoke/network/youtube_data_source.dart';

class SearchProvider {
  static YoutubeDataSource _youtubeDataSource =
      YoutubeDataSource(http.Client());

  static String _lastSearchQuery;
  static String _nextPageToken;

  static Future<BuiltList<SearchItem>> searchVideos(String query) async {
    final searchResult = await _youtubeDataSource.searchVideos(query: query);
    _cacheValues(query: query, nextPageToken: searchResult.nextPageToken);
    if (searchResult.items.isEmpty) throw NoSearchResultsException();
    return searchResult.items;
  }

  static Future<BuiltList<SearchItem>> fetchNextResultPage() async {
    if (_lastSearchQuery == null) {
      throw SearchNotInitiatedException();
    }

    if (_nextPageToken == null) {
      throw NoNextPageTokenException();
    }

    final nextPageSearchResult = await _youtubeDataSource.searchVideos(
      query: _lastSearchQuery,
      pageToken: _nextPageToken,
    );

    _cacheValues(
      query: _lastSearchQuery,
      nextPageToken: nextPageSearchResult.nextPageToken,
    );

    return nextPageSearchResult.items;
  }

  static Future<VideoItem> fetchVideoInfo({String id}) async {
    final videoResponse = await _youtubeDataSource.fetchVideoInfo(id: id);
    if (videoResponse.items.isEmpty) throw NoSuchVideoException();
    return videoResponse.items[0];
  }

  static void _cacheValues({String query, String nextPageToken}) {
    _lastSearchQuery = query;
    _nextPageToken = nextPageToken;
  }
}

class NoSearchResultsException implements Exception {
  final message = 'No results';
}

class SearchNotInitiatedException implements Exception {
  final message = 'Cannot get the next result page without searching first.';
}

class NoNextPageTokenException implements Exception {}

class NoSuchVideoException implements Exception {
  final message = 'No such video';
}
