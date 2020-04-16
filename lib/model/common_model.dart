library common_model;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'common_model.g.dart';

abstract class Thumbnail implements Built<Thumbnail, ThumbnailBuilder> {
  String get url;
  int get width;
  int get height;

  Thumbnail._();

  factory Thumbnail([updates(ThumbnailBuilder b)]) = _$Thumbnail;

  String toJson() {
    return json.encode(serializers.serializeWith(Thumbnail.serializer, this));
  }

  static Thumbnail fromJson(String jsonString) {
    return serializers.deserializeWith(
        Thumbnail.serializer, json.decode(jsonString));
  }

  static Serializer<Thumbnail> get serializer => _$thumbnailSerializer;
}

abstract class Thumbnails implements Built<Thumbnails, ThumbnailsBuilder> {
  @BuiltValueField(wireName: 'default')
  Thumbnail get default_;
  Thumbnail get medium;
  Thumbnail get high;

  Thumbnails._();

  factory Thumbnails([updates(ThumbnailsBuilder b)]) = _$Thumbnails;

  String toJson() {
    return json.encode(serializers.serializeWith(Thumbnails.serializer, this));
  }

  static Thumbnails fromJson(String jsonString) {
    return serializers.deserializeWith(
        Thumbnails.serializer, json.decode(jsonString));
  }

  static Serializer<Thumbnails> get serializer => _$thumbnailsSerializer;
}
