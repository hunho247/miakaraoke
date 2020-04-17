library search_model;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'common_model.dart';
import 'serializers.dart';

part 'search_model.g.dart';

abstract class Id implements Built<Id, IdBuilder> {
  String get videoId;

  Id._();

  factory Id([updates(IdBuilder b)]) = _$Id;

  String toJson() {
    return json.encode(serializers.serializeWith(Id.serializer, this));
  }

  static Id fromJson(String jsonString) {
    return serializers.deserializeWith(Id.serializer, json.decode(jsonString));
  }

  static Serializer<Id> get serializer => _$idSerializer;
}

abstract class SearchSnippet
    implements Built<SearchSnippet, SearchSnippetBuilder> {
  String get publishedAt;
  String get channelId;
  String get title;
  String get description;
  Thumbnails get thumbnails;
  String get channelTitle;

  SearchSnippet._();

  factory SearchSnippet([updates(SearchSnippetBuilder b)]) = _$SearchSnippet;

  String toJson() {
    return json
        .encode(serializers.serializeWith(SearchSnippet.serializer, this));
  }

  static SearchSnippet fromJson(String jsonString) {
    return serializers.deserializeWith(
        SearchSnippet.serializer, json.decode(jsonString));
  }

  static Serializer<SearchSnippet> get serializer => _$searchSnippetSerializer;
}

abstract class SearchItem implements Built<SearchItem, SearchItemBuilder> {
  Id get id;
  SearchSnippet get snippet;

  SearchItem._();

  factory SearchItem([updates(SearchItemBuilder b)]) = _$SearchItem;

  String toJson() {
    return json.encode(serializers.serializeWith(SearchItem.serializer, this));
  }

  static SearchItem fromJson(String jsonString) {
    return serializers.deserializeWith(
        SearchItem.serializer, json.decode(jsonString));
  }

  static Serializer<SearchItem> get serializer => _$searchItemSerializer;
}

abstract class YoutubeSearchResult
    implements Built<YoutubeSearchResult, YoutubeSearchResultBuilder> {
  @nullable
  String get nextPageToken;
  BuiltList<SearchItem> get items;

  YoutubeSearchResult._();

  factory YoutubeSearchResult([updates(YoutubeSearchResultBuilder b)]) =
      _$YoutubeSearchResult;

  String toJson() {
    return json.encode(
        serializers.serializeWith(YoutubeSearchResult.serializer, this));
  }

  static YoutubeSearchResult fromJson(String jsonString) {
    return serializers.deserializeWith(
        YoutubeSearchResult.serializer, json.decode(jsonString));
  }

  static Serializer<YoutubeSearchResult> get serializer =>
      _$youtubeSearchResultSerializer;
}

class YoutubeSearchError implements Exception {
  final String message;
  YoutubeSearchError(this.message);
}
