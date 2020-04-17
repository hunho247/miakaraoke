library search_model;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'common_model.dart';
import 'serializers.dart';

part 'video_model.g.dart';

abstract class VideoId implements Built<VideoId, VideoIdBuilder> {
  String get videoId;

  VideoId._();

  factory VideoId([updates(VideoIdBuilder b)]) = _$VideoId;

  String toJson() {
    return json.encode(serializers.serializeWith(VideoId.serializer, this));
  }

  static VideoId fromJson(String jsonString) {
    return serializers.deserializeWith(
        VideoId.serializer, json.decode(jsonString));
  }

  static Serializer<VideoId> get serializer => _$videoIdSerializer;
}

abstract class VideoSnippet
    implements Built<VideoSnippet, VideoSnippetBuilder> {
  String get publishedAt;
  String get channelId;
  String get title;
  String get description;
  Thumbnails get thumbnails;
  String get channelTitle;

  VideoSnippet._();

  factory VideoSnippet([updates(VideoSnippetBuilder b)]) = _$VideoSnippet;

  String toJson() {
    return json
        .encode(serializers.serializeWith(VideoSnippet.serializer, this));
  }

  static VideoSnippet fromJson(String jsonString) {
    return serializers.deserializeWith(
        VideoSnippet.serializer, json.decode(jsonString));
  }

  static Serializer<VideoSnippet> get serializer => _$videoSnippetSerializer;
}

abstract class VideoItem implements Built<VideoItem, VideoItemBuilder> {
  VideoId get id;
  VideoSnippet get videoSnippet;

  VideoItem._();

  factory VideoItem([updates(VideoItemBuilder b)]) = _$VideoItem;

  String toJson() {
    return json.encode(serializers.serializeWith(VideoItem.serializer, this));
  }

  static VideoItem fromJson(String jsonString) {
    return serializers.deserializeWith(
        VideoItem.serializer, json.decode(jsonString));
  }

  static Serializer<VideoItem> get serializer => _$videoItemSerializer;
}

abstract class VideoSearchResult
    implements Built<VideoSearchResult, VideoSearchResultBuilder> {
  @nullable
  String get nextPageToken;
  BuiltList<VideoItem> get videoItems;

  VideoSearchResult._();

  factory VideoSearchResult([updates(VideoSearchResultBuilder b)]) =
      _$VideoSearchResult;

  String toJson() {
    return json
        .encode(serializers.serializeWith(VideoSearchResult.serializer, this));
  }

  static VideoSearchResult fromJson(String jsonString) {
    return serializers.deserializeWith(
        VideoSearchResult.serializer, json.decode(jsonString));
  }

  static Serializer<VideoSearchResult> get serializer =>
      _$videoSearchResultSerializer;
}

class YoutubeSearchError implements Exception {
  final String message;
  YoutubeSearchError(this.message);
}
