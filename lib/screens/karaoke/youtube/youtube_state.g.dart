// GENERATED CODE - DO NOT MODIFY BY HAND

part of youtube_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$YoutubeState extends YoutubeState {
  @override
  final bool isLoading;
  @override
  final String error;

  factory _$YoutubeState([void Function(YoutubeStateBuilder) updates]) =>
      (new YoutubeStateBuilder()..update(updates)).build();

  _$YoutubeState._({this.isLoading, this.error}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('YoutubeState', 'isLoading');
    }
    if (error == null) {
      throw new BuiltValueNullFieldError('YoutubeState', 'error');
    }
  }

  @override
  YoutubeState rebuild(void Function(YoutubeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  YoutubeStateBuilder toBuilder() => new YoutubeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is YoutubeState &&
        isLoading == other.isLoading &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, isLoading.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('YoutubeState')
          ..add('isLoading', isLoading)
          ..add('error', error))
        .toString();
  }
}

class YoutubeStateBuilder
    implements Builder<YoutubeState, YoutubeStateBuilder> {
  _$YoutubeState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  YoutubeStateBuilder();

  YoutubeStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(YoutubeState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$YoutubeState;
  }

  @override
  void update(void Function(YoutubeStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$YoutubeState build() {
    final _$result =
        _$v ?? new _$YoutubeState._(isLoading: isLoading, error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
