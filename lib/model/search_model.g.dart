// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Id> _$idSerializer = new _$IdSerializer();
Serializer<SearchSnippet> _$searchSnippetSerializer =
    new _$SearchSnippetSerializer();
Serializer<SearchItem> _$searchItemSerializer = new _$SearchItemSerializer();
Serializer<YoutubeSearchResult> _$youtubeSearchResultSerializer =
    new _$YoutubeSearchResultSerializer();

class _$IdSerializer implements StructuredSerializer<Id> {
  @override
  final Iterable<Type> types = const [Id, _$Id];
  @override
  final String wireName = 'Id';

  @override
  Iterable<Object> serialize(Serializers serializers, Id object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'videoId',
      serializers.serialize(object.videoId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Id deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IdBuilder();

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

class _$SearchSnippetSerializer implements StructuredSerializer<SearchSnippet> {
  @override
  final Iterable<Type> types = const [SearchSnippet, _$SearchSnippet];
  @override
  final String wireName = 'SearchSnippet';

  @override
  Iterable<Object> serialize(Serializers serializers, SearchSnippet object,
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
  SearchSnippet deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchSnippetBuilder();

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

class _$SearchItemSerializer implements StructuredSerializer<SearchItem> {
  @override
  final Iterable<Type> types = const [SearchItem, _$SearchItem];
  @override
  final String wireName = 'SearchItem';

  @override
  Iterable<Object> serialize(Serializers serializers, SearchItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(Id)),
      'snippet',
      serializers.serialize(object.snippet,
          specifiedType: const FullType(SearchSnippet)),
    ];

    return result;
  }

  @override
  SearchItem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id.replace(serializers.deserialize(value,
              specifiedType: const FullType(Id)) as Id);
          break;
        case 'snippet':
          result.snippet.replace(serializers.deserialize(value,
              specifiedType: const FullType(SearchSnippet)) as SearchSnippet);
          break;
      }
    }

    return result.build();
  }
}

class _$YoutubeSearchResultSerializer
    implements StructuredSerializer<YoutubeSearchResult> {
  @override
  final Iterable<Type> types = const [
    YoutubeSearchResult,
    _$YoutubeSearchResult
  ];
  @override
  final String wireName = 'YoutubeSearchResult';

  @override
  Iterable<Object> serialize(
      Serializers serializers, YoutubeSearchResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'items',
      serializers.serialize(object.items,
          specifiedType:
              const FullType(BuiltList, const [const FullType(SearchItem)])),
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
  YoutubeSearchResult deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new YoutubeSearchResultBuilder();

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
        case 'items':
          result.items.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SearchItem)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$Id extends Id {
  @override
  final String videoId;

  factory _$Id([void Function(IdBuilder) updates]) =>
      (new IdBuilder()..update(updates)).build();

  _$Id._({this.videoId}) : super._() {
    if (videoId == null) {
      throw new BuiltValueNullFieldError('Id', 'videoId');
    }
  }

  @override
  Id rebuild(void Function(IdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IdBuilder toBuilder() => new IdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Id && videoId == other.videoId;
  }

  @override
  int get hashCode {
    return $jf($jc(0, videoId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Id')..add('videoId', videoId))
        .toString();
  }
}

class IdBuilder implements Builder<Id, IdBuilder> {
  _$Id _$v;

  String _videoId;
  String get videoId => _$this._videoId;
  set videoId(String videoId) => _$this._videoId = videoId;

  IdBuilder();

  IdBuilder get _$this {
    if (_$v != null) {
      _videoId = _$v.videoId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Id other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Id;
  }

  @override
  void update(void Function(IdBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Id build() {
    final _$result = _$v ?? new _$Id._(videoId: videoId);
    replace(_$result);
    return _$result;
  }
}

class _$SearchSnippet extends SearchSnippet {
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

  factory _$SearchSnippet([void Function(SearchSnippetBuilder) updates]) =>
      (new SearchSnippetBuilder()..update(updates)).build();

  _$SearchSnippet._(
      {this.publishedAt,
      this.channelId,
      this.title,
      this.description,
      this.thumbnails,
      this.channelTitle})
      : super._() {
    if (publishedAt == null) {
      throw new BuiltValueNullFieldError('SearchSnippet', 'publishedAt');
    }
    if (channelId == null) {
      throw new BuiltValueNullFieldError('SearchSnippet', 'channelId');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('SearchSnippet', 'title');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('SearchSnippet', 'description');
    }
    if (thumbnails == null) {
      throw new BuiltValueNullFieldError('SearchSnippet', 'thumbnails');
    }
    if (channelTitle == null) {
      throw new BuiltValueNullFieldError('SearchSnippet', 'channelTitle');
    }
  }

  @override
  SearchSnippet rebuild(void Function(SearchSnippetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchSnippetBuilder toBuilder() => new SearchSnippetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchSnippet &&
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
    return (newBuiltValueToStringHelper('SearchSnippet')
          ..add('publishedAt', publishedAt)
          ..add('channelId', channelId)
          ..add('title', title)
          ..add('description', description)
          ..add('thumbnails', thumbnails)
          ..add('channelTitle', channelTitle))
        .toString();
  }
}

class SearchSnippetBuilder
    implements Builder<SearchSnippet, SearchSnippetBuilder> {
  _$SearchSnippet _$v;

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

  SearchSnippetBuilder();

  SearchSnippetBuilder get _$this {
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
  void replace(SearchSnippet other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchSnippet;
  }

  @override
  void update(void Function(SearchSnippetBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchSnippet build() {
    _$SearchSnippet _$result;
    try {
      _$result = _$v ??
          new _$SearchSnippet._(
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
            'SearchSnippet', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SearchItem extends SearchItem {
  @override
  final Id id;
  @override
  final SearchSnippet snippet;

  factory _$SearchItem([void Function(SearchItemBuilder) updates]) =>
      (new SearchItemBuilder()..update(updates)).build();

  _$SearchItem._({this.id, this.snippet}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('SearchItem', 'id');
    }
    if (snippet == null) {
      throw new BuiltValueNullFieldError('SearchItem', 'snippet');
    }
  }

  @override
  SearchItem rebuild(void Function(SearchItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchItemBuilder toBuilder() => new SearchItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchItem && id == other.id && snippet == other.snippet;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), snippet.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchItem')
          ..add('id', id)
          ..add('snippet', snippet))
        .toString();
  }
}

class SearchItemBuilder implements Builder<SearchItem, SearchItemBuilder> {
  _$SearchItem _$v;

  IdBuilder _id;
  IdBuilder get id => _$this._id ??= new IdBuilder();
  set id(IdBuilder id) => _$this._id = id;

  SearchSnippetBuilder _snippet;
  SearchSnippetBuilder get snippet =>
      _$this._snippet ??= new SearchSnippetBuilder();
  set snippet(SearchSnippetBuilder snippet) => _$this._snippet = snippet;

  SearchItemBuilder();

  SearchItemBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id?.toBuilder();
      _snippet = _$v.snippet?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchItem;
  }

  @override
  void update(void Function(SearchItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchItem build() {
    _$SearchItem _$result;
    try {
      _$result =
          _$v ?? new _$SearchItem._(id: id.build(), snippet: snippet.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'id';
        id.build();
        _$failedField = 'snippet';
        snippet.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SearchItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$YoutubeSearchResult extends YoutubeSearchResult {
  @override
  final String nextPageToken;
  @override
  final BuiltList<SearchItem> items;

  factory _$YoutubeSearchResult(
          [void Function(YoutubeSearchResultBuilder) updates]) =>
      (new YoutubeSearchResultBuilder()..update(updates)).build();

  _$YoutubeSearchResult._({this.nextPageToken, this.items}) : super._() {
    if (items == null) {
      throw new BuiltValueNullFieldError('YoutubeSearchResult', 'items');
    }
  }

  @override
  YoutubeSearchResult rebuild(
          void Function(YoutubeSearchResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  YoutubeSearchResultBuilder toBuilder() =>
      new YoutubeSearchResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is YoutubeSearchResult &&
        nextPageToken == other.nextPageToken &&
        items == other.items;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, nextPageToken.hashCode), items.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('YoutubeSearchResult')
          ..add('nextPageToken', nextPageToken)
          ..add('items', items))
        .toString();
  }
}

class YoutubeSearchResultBuilder
    implements Builder<YoutubeSearchResult, YoutubeSearchResultBuilder> {
  _$YoutubeSearchResult _$v;

  String _nextPageToken;
  String get nextPageToken => _$this._nextPageToken;
  set nextPageToken(String nextPageToken) =>
      _$this._nextPageToken = nextPageToken;

  ListBuilder<SearchItem> _items;
  ListBuilder<SearchItem> get items =>
      _$this._items ??= new ListBuilder<SearchItem>();
  set items(ListBuilder<SearchItem> items) => _$this._items = items;

  YoutubeSearchResultBuilder();

  YoutubeSearchResultBuilder get _$this {
    if (_$v != null) {
      _nextPageToken = _$v.nextPageToken;
      _items = _$v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(YoutubeSearchResult other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$YoutubeSearchResult;
  }

  @override
  void update(void Function(YoutubeSearchResultBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$YoutubeSearchResult build() {
    _$YoutubeSearchResult _$result;
    try {
      _$result = _$v ??
          new _$YoutubeSearchResult._(
              nextPageToken: nextPageToken, items: items.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'YoutubeSearchResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
