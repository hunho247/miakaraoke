// GENERATED CODE - DO NOT MODIFY BY HAND

part of detail_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VideoItem> _$videoItemSerializer = new _$VideoItemSerializer();
Serializer<VideoSnippet> _$videoSnippetSerializer =
    new _$VideoSnippetSerializer();
Serializer<YoutubeVideoResponse> _$youtubeVideoResponseSerializer =
    new _$YoutubeVideoResponseSerializer();

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
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'snippet',
      serializers.serialize(object.snippet,
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
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'snippet':
          result.snippet.replace(serializers.deserialize(value,
              specifiedType: const FullType(VideoSnippet)) as VideoSnippet);
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
      'tags',
      serializers.serialize(object.tags,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
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
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$YoutubeVideoResponseSerializer
    implements StructuredSerializer<YoutubeVideoResponse> {
  @override
  final Iterable<Type> types = const [
    YoutubeVideoResponse,
    _$YoutubeVideoResponse
  ];
  @override
  final String wireName = 'YoutubeVideoResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, YoutubeVideoResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'items',
      serializers.serialize(object.items,
          specifiedType:
              const FullType(BuiltList, const [const FullType(VideoItem)])),
    ];

    return result;
  }

  @override
  YoutubeVideoResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new YoutubeVideoResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'items':
          result.items.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(VideoItem)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$VideoItem extends VideoItem {
  @override
  final String id;
  @override
  final VideoSnippet snippet;

  factory _$VideoItem([void Function(VideoItemBuilder) updates]) =>
      (new VideoItemBuilder()..update(updates)).build();

  _$VideoItem._({this.id, this.snippet}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('VideoItem', 'id');
    }
    if (snippet == null) {
      throw new BuiltValueNullFieldError('VideoItem', 'snippet');
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
    return other is VideoItem && id == other.id && snippet == other.snippet;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), snippet.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoItem')
          ..add('id', id)
          ..add('snippet', snippet))
        .toString();
  }
}

class VideoItemBuilder implements Builder<VideoItem, VideoItemBuilder> {
  _$VideoItem _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  VideoSnippetBuilder _snippet;
  VideoSnippetBuilder get snippet =>
      _$this._snippet ??= new VideoSnippetBuilder();
  set snippet(VideoSnippetBuilder snippet) => _$this._snippet = snippet;

  VideoItemBuilder();

  VideoItemBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _snippet = _$v.snippet?.toBuilder();
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
      _$result = _$v ?? new _$VideoItem._(id: id, snippet: snippet.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'snippet';
        snippet.build();
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
  @override
  final BuiltList<String> tags;

  factory _$VideoSnippet([void Function(VideoSnippetBuilder) updates]) =>
      (new VideoSnippetBuilder()..update(updates)).build();

  _$VideoSnippet._(
      {this.publishedAt,
      this.channelId,
      this.title,
      this.description,
      this.thumbnails,
      this.channelTitle,
      this.tags})
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
    if (tags == null) {
      throw new BuiltValueNullFieldError('VideoSnippet', 'tags');
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
        channelTitle == other.channelTitle &&
        tags == other.tags;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, publishedAt.hashCode), channelId.hashCode),
                        title.hashCode),
                    description.hashCode),
                thumbnails.hashCode),
            channelTitle.hashCode),
        tags.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoSnippet')
          ..add('publishedAt', publishedAt)
          ..add('channelId', channelId)
          ..add('title', title)
          ..add('description', description)
          ..add('thumbnails', thumbnails)
          ..add('channelTitle', channelTitle)
          ..add('tags', tags))
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

  ListBuilder<String> _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String> tags) => _$this._tags = tags;

  VideoSnippetBuilder();

  VideoSnippetBuilder get _$this {
    if (_$v != null) {
      _publishedAt = _$v.publishedAt;
      _channelId = _$v.channelId;
      _title = _$v.title;
      _description = _$v.description;
      _thumbnails = _$v.thumbnails?.toBuilder();
      _channelTitle = _$v.channelTitle;
      _tags = _$v.tags?.toBuilder();
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
              channelTitle: channelTitle,
              tags: tags.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'thumbnails';
        thumbnails.build();

        _$failedField = 'tags';
        tags.build();
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

class _$YoutubeVideoResponse extends YoutubeVideoResponse {
  @override
  final BuiltList<VideoItem> items;

  factory _$YoutubeVideoResponse(
          [void Function(YoutubeVideoResponseBuilder) updates]) =>
      (new YoutubeVideoResponseBuilder()..update(updates)).build();

  _$YoutubeVideoResponse._({this.items}) : super._() {
    if (items == null) {
      throw new BuiltValueNullFieldError('YoutubeVideoResponse', 'items');
    }
  }

  @override
  YoutubeVideoResponse rebuild(
          void Function(YoutubeVideoResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  YoutubeVideoResponseBuilder toBuilder() =>
      new YoutubeVideoResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is YoutubeVideoResponse && items == other.items;
  }

  @override
  int get hashCode {
    return $jf($jc(0, items.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('YoutubeVideoResponse')
          ..add('items', items))
        .toString();
  }
}

class YoutubeVideoResponseBuilder
    implements Builder<YoutubeVideoResponse, YoutubeVideoResponseBuilder> {
  _$YoutubeVideoResponse _$v;

  ListBuilder<VideoItem> _items;
  ListBuilder<VideoItem> get items =>
      _$this._items ??= new ListBuilder<VideoItem>();
  set items(ListBuilder<VideoItem> items) => _$this._items = items;

  YoutubeVideoResponseBuilder();

  YoutubeVideoResponseBuilder get _$this {
    if (_$v != null) {
      _items = _$v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(YoutubeVideoResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$YoutubeVideoResponse;
  }

  @override
  void update(void Function(YoutubeVideoResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$YoutubeVideoResponse build() {
    _$YoutubeVideoResponse _$result;
    try {
      _$result = _$v ?? new _$YoutubeVideoResponse._(items: items.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'YoutubeVideoResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
