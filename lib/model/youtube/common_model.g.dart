// GENERATED CODE - DO NOT MODIFY BY HAND

part of common_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Thumbnail> _$thumbnailSerializer = new _$ThumbnailSerializer();
Serializer<Thumbnails> _$thumbnailsSerializer = new _$ThumbnailsSerializer();

class _$ThumbnailSerializer implements StructuredSerializer<Thumbnail> {
  @override
  final Iterable<Type> types = const [Thumbnail, _$Thumbnail];
  @override
  final String wireName = 'Thumbnail';

  @override
  Iterable<Object> serialize(Serializers serializers, Thumbnail object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'width',
      serializers.serialize(object.width, specifiedType: const FullType(int)),
      'height',
      serializers.serialize(object.height, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Thumbnail deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ThumbnailBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'width':
          result.width = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ThumbnailsSerializer implements StructuredSerializer<Thumbnails> {
  @override
  final Iterable<Type> types = const [Thumbnails, _$Thumbnails];
  @override
  final String wireName = 'Thumbnails';

  @override
  Iterable<Object> serialize(Serializers serializers, Thumbnails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'default',
      serializers.serialize(object.default_,
          specifiedType: const FullType(Thumbnail)),
      'medium',
      serializers.serialize(object.medium,
          specifiedType: const FullType(Thumbnail)),
      'high',
      serializers.serialize(object.high,
          specifiedType: const FullType(Thumbnail)),
    ];

    return result;
  }

  @override
  Thumbnails deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ThumbnailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'default':
          result.default_.replace(serializers.deserialize(value,
              specifiedType: const FullType(Thumbnail)) as Thumbnail);
          break;
        case 'medium':
          result.medium.replace(serializers.deserialize(value,
              specifiedType: const FullType(Thumbnail)) as Thumbnail);
          break;
        case 'high':
          result.high.replace(serializers.deserialize(value,
              specifiedType: const FullType(Thumbnail)) as Thumbnail);
          break;
      }
    }

    return result.build();
  }
}

class _$Thumbnail extends Thumbnail {
  @override
  final String url;
  @override
  final int width;
  @override
  final int height;

  factory _$Thumbnail([void Function(ThumbnailBuilder) updates]) =>
      (new ThumbnailBuilder()..update(updates)).build();

  _$Thumbnail._({this.url, this.width, this.height}) : super._() {
    if (url == null) {
      throw new BuiltValueNullFieldError('Thumbnail', 'url');
    }
    if (width == null) {
      throw new BuiltValueNullFieldError('Thumbnail', 'width');
    }
    if (height == null) {
      throw new BuiltValueNullFieldError('Thumbnail', 'height');
    }
  }

  @override
  Thumbnail rebuild(void Function(ThumbnailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThumbnailBuilder toBuilder() => new ThumbnailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Thumbnail &&
        url == other.url &&
        width == other.width &&
        height == other.height;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, url.hashCode), width.hashCode), height.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Thumbnail')
          ..add('url', url)
          ..add('width', width)
          ..add('height', height))
        .toString();
  }
}

class ThumbnailBuilder implements Builder<Thumbnail, ThumbnailBuilder> {
  _$Thumbnail _$v;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  int _width;
  int get width => _$this._width;
  set width(int width) => _$this._width = width;

  int _height;
  int get height => _$this._height;
  set height(int height) => _$this._height = height;

  ThumbnailBuilder();

  ThumbnailBuilder get _$this {
    if (_$v != null) {
      _url = _$v.url;
      _width = _$v.width;
      _height = _$v.height;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Thumbnail other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Thumbnail;
  }

  @override
  void update(void Function(ThumbnailBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Thumbnail build() {
    final _$result =
        _$v ?? new _$Thumbnail._(url: url, width: width, height: height);
    replace(_$result);
    return _$result;
  }
}

class _$Thumbnails extends Thumbnails {
  @override
  final Thumbnail default_;
  @override
  final Thumbnail medium;
  @override
  final Thumbnail high;

  factory _$Thumbnails([void Function(ThumbnailsBuilder) updates]) =>
      (new ThumbnailsBuilder()..update(updates)).build();

  _$Thumbnails._({this.default_, this.medium, this.high}) : super._() {
    if (default_ == null) {
      throw new BuiltValueNullFieldError('Thumbnails', 'default_');
    }
    if (medium == null) {
      throw new BuiltValueNullFieldError('Thumbnails', 'medium');
    }
    if (high == null) {
      throw new BuiltValueNullFieldError('Thumbnails', 'high');
    }
  }

  @override
  Thumbnails rebuild(void Function(ThumbnailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThumbnailsBuilder toBuilder() => new ThumbnailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Thumbnails &&
        default_ == other.default_ &&
        medium == other.medium &&
        high == other.high;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, default_.hashCode), medium.hashCode), high.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Thumbnails')
          ..add('default_', default_)
          ..add('medium', medium)
          ..add('high', high))
        .toString();
  }
}

class ThumbnailsBuilder implements Builder<Thumbnails, ThumbnailsBuilder> {
  _$Thumbnails _$v;

  ThumbnailBuilder _default_;
  ThumbnailBuilder get default_ => _$this._default_ ??= new ThumbnailBuilder();
  set default_(ThumbnailBuilder default_) => _$this._default_ = default_;

  ThumbnailBuilder _medium;
  ThumbnailBuilder get medium => _$this._medium ??= new ThumbnailBuilder();
  set medium(ThumbnailBuilder medium) => _$this._medium = medium;

  ThumbnailBuilder _high;
  ThumbnailBuilder get high => _$this._high ??= new ThumbnailBuilder();
  set high(ThumbnailBuilder high) => _$this._high = high;

  ThumbnailsBuilder();

  ThumbnailsBuilder get _$this {
    if (_$v != null) {
      _default_ = _$v.default_?.toBuilder();
      _medium = _$v.medium?.toBuilder();
      _high = _$v.high?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Thumbnails other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Thumbnails;
  }

  @override
  void update(void Function(ThumbnailsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Thumbnails build() {
    _$Thumbnails _$result;
    try {
      _$result = _$v ??
          new _$Thumbnails._(
              default_: default_.build(),
              medium: medium.build(),
              high: high.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'default_';
        default_.build();
        _$failedField = 'medium';
        medium.build();
        _$failedField = 'high';
        high.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Thumbnails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
