// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VideoId> _$videoIdSerializer = new _$VideoIdSerializer();
Serializer<VideoSnippet> _$videoSnippetSerializer =
    new _$VideoSnippetSerializer();
Serializer<VideoItem> _$videoItemSerializer = new _$VideoItemSerializer();
Serializer<VideoSearchResult> _$videoSearchResultSerializer =
    new _$VideoSearchResultSerializer();

class _$VideoIdSerializer implements StructuredSerializer<VideoId> {
  @override
  final Iterable<Type> types = const [VideoId, _$VideoId];
  @override
  final String wireName = 'VideoId';

  @override
  Iterable<Object> serialize(Serializers serializers, VideoId object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'videoId',
      serializers.serialize(object.videoId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  VideoId deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VideoIdBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'videoId':
          result.videoId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$VideoSnippetSerializer implements StructuredSerializer<VideoSnippet> {
  @override
  final Iterable<Type> types = const [VideoSnippet, _$VideoSnippet];
  @override
  final String wireName = 'VideoSnippet';

  @override
  Iterable<Object> serialize(Serializers serializers, VideoSnippet object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'publishedAt',
      serializers.serialize(object.publishedAt,
          specifiedType: const FullType(String)),
      'channelId',
      serializers.serialize(object.channelId,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'thumbnails',
      serializers.serialize(object.thumbnails,
          specifiedType: const FullType(Thumbnails)),
      'channelTitle',
      serializers.serialize(object.channelTitle,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  VideoSnippet deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VideoSnippetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'publishedAt':
          result.publishedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'channelId':
          result.channelId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'thumbnails':
          result.thumbnails.replace(serializers.deserialize(value,
              specifiedType: const FullType(Thumbnails)) as Thumbnails);
          break;
        case 'channelTitle':
          result.channelTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$VideoItemSerializer implements StructuredSerializer<VideoItem> {
  @override
  final Iterable<Type> types = const [VideoItem, _$VideoItem];
  @override
  final String wireName = 'VideoItem';

  @override
  Iterable<Object> serialize(Serializers serializers, VideoItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(VideoId)),
      'videoSnippet',
      serializers.serialize(object.videoSnippet,
          specifiedType: const FullType(VideoSnippet)),
    ];

    return result;
  }

  @override
  VideoItem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VideoItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id.replace(serializers.deserialize(value,
              specifiedType: const FullType(VideoId)) as VideoId);
          break;
        case 'videoSnippet':
          result.videoSnippet.replace(serializers.deserialize(value,
              specifiedType: const FullType(VideoSnippet)) as VideoSnippet);
          break;
      }
    }

    return result.build();
  }
}

class _$VideoSearchResultSerializer
    implements StructuredSerializer<VideoSearchResult> {
  @override
  final Iterable<Type> types = const [VideoSearchResult, _$VideoSearchResult];
  @override
  final String wireName = 'VideoSearchResult';

  @override
  Iterable<Object> serialize(Serializers serializers, VideoSearchResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'videoItems',
      serializers.serialize(object.videoItems,
          specifiedType:
              const FullType(BuiltList, const [const FullType(VideoItem)])),
    ];
    if (object.nextPageToken != null) {
      result
        ..add('nextPageToken')
        ..add(serializers.serialize(object.nextPageToken,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  VideoSearchResult deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VideoSearchResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'nextPageToken':
          result.nextPageToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'videoItems':
          result.videoItems.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(VideoItem)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$VideoId extends VideoId {
  @override
  final String videoId;

  factory _$VideoId([void Function(VideoIdBuilder) updates]) =>
      (new VideoIdBuilder()..update(updates)).build();

  _$VideoId._({this.videoId}) : super._() {
    if (videoId == null) {
      throw new BuiltValueNullFieldError('VideoId', 'videoId');
    }
  }

  @override
  VideoId rebuild(void Function(VideoIdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoIdBuilder toBuilder() => new VideoIdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoId && videoId == other.videoId;
  }

  @override
  int get hashCode {
    return $jf($jc(0, videoId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoId')..add('videoId', videoId))
        .toString();
  }
}

class VideoIdBuilder implements Builder<VideoId, VideoIdBuilder> {
  _$VideoId _$v;

  String _videoId;
  String get videoId => _$this._videoId;
  set videoId(String videoId) => _$this._videoId = videoId;

  VideoIdBuilder();

  VideoIdBuilder get _$this {
    if (_$v != null) {
      _videoId = _$v.videoId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoId other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VideoId;
  }

  @override
  void update(void Function(VideoIdBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VideoId build() {
    final _$result = _$v ?? new _$VideoId._(videoId: videoId);
    replace(_$result);
    return _$result;
  }
}

class _$VideoSnippet extends VideoSnippet {
  @override
  final String publishedAt;
  @override
  final String channelId;
  @override
  final String title;
  @override
  final String description;
  @override
  final Thumbnails thumbnails;
  @override
  final String channelTitle;

  factory _$VideoSnippet([void Function(VideoSnippetBuilder) updates]) =>
      (new VideoSnippetBuilder()..update(updates)).build();

  _$VideoSnippet._(
      {this.publishedAt,
      this.channelId,
      this.title,
      this.description,
      this.thumbnails,
      this.channelTitle})
      : super._() {
    if (publishedAt == null) {
      throw new BuiltValueNullFieldError('VideoSnippet', 'publishedAt');
    }
    if (channelId == null) {
      throw new BuiltValueNullFieldError('VideoSnippet', 'channelId');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('VideoSnippet', 'title');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('VideoSnippet', 'description');
    }
    if (thumbnails == null) {
      throw new BuiltValueNullFieldError('VideoSnippet', 'thumbnails');
    }
    if (channelTitle == null) {
      throw new BuiltValueNullFieldError('VideoSnippet', 'channelTitle');
    }
  }

  @override
  VideoSnippet rebuild(void Function(VideoSnippetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoSnippetBuilder toBuilder() => new VideoSnippetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoSnippet &&
        publishedAt == other.publishedAt &&
        channelId == other.channelId &&
        title == other.title &&
        description == other.description &&
        thumbnails == other.thumbnails &&
        channelTitle == other.channelTitle;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, publishedAt.hashCode), channelId.hashCode),
                    title.hashCode),
                description.hashCode),
            thumbnails.hashCode),
        channelTitle.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoSnippet')
          ..add('publishedAt', publishedAt)
          ..add('channelId', channelId)
          ..add('title', title)
          ..add('description', description)
          ..add('thumbnails', thumbnails)
          ..add('channelTitle', channelTitle))
        .toString();
  }
}

class VideoSnippetBuilder
    implements Builder<VideoSnippet, VideoSnippetBuilder> {
  _$VideoSnippet _$v;

  String _publishedAt;
  String get publishedAt => _$this._publishedAt;
  set publishedAt(String publishedAt) => _$this._publishedAt = publishedAt;

  String _channelId;
  String get channelId => _$this._channelId;
  set channelId(String channelId) => _$this._channelId = channelId;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  ThumbnailsBuilder _thumbnails;
  ThumbnailsBuilder get thumbnails =>
      _$this._thumbnails ??= new ThumbnailsBuilder();
  set thumbnails(ThumbnailsBuilder thumbnails) =>
      _$this._thumbnails = thumbnails;

  String _channelTitle;
  String get channelTitle => _$this._channelTitle;
  set channelTitle(String channelTitle) => _$this._channelTitle = channelTitle;

  VideoSnippetBuilder();

  VideoSnippetBuilder get _$this {
    if (_$v != null) {
      _publishedAt = _$v.publishedAt;
      _channelId = _$v.channelId;
      _title = _$v.title;
      _description = _$v.description;
      _thumbnails = _$v.thumbnails?.toBuilder();
      _channelTitle = _$v.channelTitle;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoSnippet other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VideoSnippet;
  }

  @override
  void update(void Function(VideoSnippetBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VideoSnippet build() {
    _$VideoSnippet _$result;
    try {
      _$result = _$v ??
          new _$VideoSnippet._(
              publishedAt: publishedAt,
              channelId: channelId,
              title: title,
              description: description,
              thumbnails: thumbnails.build(),
              channelTitle: channelTitle);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'thumbnails';
        thumbnails.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'VideoSnippet', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$VideoItem extends VideoItem {
  @override
  final VideoId id;
  @override
  final VideoSnippet videoSnippet;

  factory _$VideoItem([void Function(VideoItemBuilder) updates]) =>
      (new VideoItemBuilder()..update(updates)).build();

  _$VideoItem._({this.id, this.videoSnippet}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('VideoItem', 'id');
    }
    if (videoSnippet == null) {
      throw new BuiltValueNullFieldError('VideoItem', 'videoSnippet');
    }
  }

  @override
  VideoItem rebuild(void Function(VideoItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoItemBuilder toBuilder() => new VideoItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoItem &&
        id == other.id &&
        videoSnippet == other.videoSnippet;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), videoSnippet.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoItem')
          ..add('id', id)
          ..add('videoSnippet', videoSnippet))
        .toString();
  }
}

class VideoItemBuilder implements Builder<VideoItem, VideoItemBuilder> {
  _$VideoItem _$v;

  VideoIdBuilder _id;
  VideoIdBuilder get id => _$this._id ??= new VideoIdBuilder();
  set id(VideoIdBuilder id) => _$this._id = id;

  VideoSnippetBuilder _videoSnippet;
  VideoSnippetBuilder get videoSnippet =>
      _$this._videoSnippet ??= new VideoSnippetBuilder();
  set videoSnippet(VideoSnippetBuilder videoSnippet) =>
      _$this._videoSnippet = videoSnippet;

  VideoItemBuilder();

  VideoItemBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id?.toBuilder();
      _videoSnippet = _$v.videoSnippet?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VideoItem;
  }

  @override
  void update(void Function(VideoItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VideoItem build() {
    _$VideoItem _$result;
    try {
      _$result = _$v ??
          new _$VideoItem._(id: id.build(), videoSnippet: videoSnippet.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'id';
        id.build();
        _$failedField = 'videoSnippet';
        videoSnippet.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'VideoItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$VideoSearchResult extends VideoSearchResult {
  @override
  final String nextPageToken;
  @override
  final BuiltList<VideoItem> videoItems;

  factory _$VideoSearchResult(
          [void Function(VideoSearchResultBuilder) updates]) =>
      (new VideoSearchResultBuilder()..update(updates)).build();

  _$VideoSearchResult._({this.nextPageToken, this.videoItems}) : super._() {
    if (videoItems == null) {
      throw new BuiltValueNullFieldError('VideoSearchResult', 'videoItems');
    }
  }

  @override
  VideoSearchResult rebuild(void Function(VideoSearchResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoSearchResultBuilder toBuilder() =>
      new VideoSearchResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoSearchResult &&
        nextPageToken == other.nextPageToken &&
        videoItems == other.videoItems;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, nextPageToken.hashCode), videoItems.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoSearchResult')
          ..add('nextPageToken', nextPageToken)
          ..add('videoItems', videoItems))
        .toString();
  }
}

class VideoSearchResultBuilder
    implements Builder<VideoSearchResult, VideoSearchResultBuilder> {
  _$VideoSearchResult _$v;

  String _nextPageToken;
  String get nextPageToken => _$this._nextPageToken;
  set nextPageToken(String nextPageToken) =>
      _$this._nextPageToken = nextPageToken;

  ListBuilder<VideoItem> _videoItems;
  ListBuilder<VideoItem> get videoItems =>
      _$this._videoItems ??= new ListBuilder<VideoItem>();
  set videoItems(ListBuilder<VideoItem> videoItems) =>
      _$this._videoItems = videoItems;

  VideoSearchResultBuilder();

  VideoSearchResultBuilder get _$this {
    if (_$v != null) {
      _nextPageToken = _$v.nextPageToken;
      _videoItems = _$v.videoItems?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoSearchResult other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VideoSearchResult;
  }

  @override
  void update(void Function(VideoSearchResultBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VideoSearchResult build() {
    _$VideoSearchResult _$result;
    try {
      _$result = _$v ??
          new _$VideoSearchResult._(
              nextPageToken: nextPageToken, videoItems: videoItems.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'videoItems';
        videoItems.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'VideoSearchResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
