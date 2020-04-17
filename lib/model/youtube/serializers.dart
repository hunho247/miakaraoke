import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'common_model.dart';
import 'video_model.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  VideoSearchResult,
  VideoItem,
  VideoId,
  VideoSnippet,
  Thumbnails,
  Thumbnail,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
