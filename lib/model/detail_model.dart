library detail_model;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'common_model.dart';
import 'serializers.dart';

part 'detail_model.g.dart';

abstract class VideoItem implements Built<VideoItem, VideoItemBuilder> {
  String get id;
  VideoSnippet get snippet;

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

abstract class VideoSnippet
    implements Built<VideoSnippet, VideoSnippetBuilder> {
  String get publishedAt;
  String get channelId;
  String get title;
  String get description;
  Thumbnails get thumbnails;
  String get channelTitle;
  BuiltList<String> get tags;

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

abstract class YoutubeVideoResponse
    implements Built<YoutubeVideoResponse, YoutubeVideoResponseBuilder> {
  BuiltList<VideoItem> get items;

  YoutubeVideoResponse._();

  factory YoutubeVideoResponse([updates(YoutubeVideoResponseBuilder b)]) =
      _$YoutubeVideoResponse;

  String toJson() {
    return json.encode(
        serializers.serializeWith(YoutubeVideoResponse.serializer, this));
  }

  static YoutubeVideoResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        YoutubeVideoResponse.serializer, json.decode(jsonString));
  }

  static Serializer<YoutubeVideoResponse> get serializer =>
      _$youtubeVideoResponseSerializer;
}

class YoutubeVideoError implements Exception {
  final String message;
  YoutubeVideoError(this.message);
}
