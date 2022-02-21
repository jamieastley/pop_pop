// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'high_score_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HighScoreEventTearOff {
  const _$HighScoreEventTearOff();

  _GetTop getTopScores(int? limit) {
    return _GetTop(
      limit,
    );
  }

  _AddScore addScore(int score) {
    return _AddScore(
      score,
    );
  }
}

/// @nodoc
const $HighScoreEvent = _$HighScoreEventTearOff();

/// @nodoc
mixin _$HighScoreEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit) getTopScores,
    required TResult Function(int score) addScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? limit)? getTopScores,
    TResult Function(int score)? addScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit)? getTopScores,
    TResult Function(int score)? addScore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTop value) getTopScores,
    required TResult Function(_AddScore value) addScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetTop value)? getTopScores,
    TResult Function(_AddScore value)? addScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTop value)? getTopScores,
    TResult Function(_AddScore value)? addScore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HighScoreEventCopyWith<$Res> {
  factory $HighScoreEventCopyWith(
          HighScoreEvent value, $Res Function(HighScoreEvent) then) =
      _$HighScoreEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HighScoreEventCopyWithImpl<$Res>
    implements $HighScoreEventCopyWith<$Res> {
  _$HighScoreEventCopyWithImpl(this._value, this._then);

  final HighScoreEvent _value;
  // ignore: unused_field
  final $Res Function(HighScoreEvent) _then;
}

/// @nodoc
abstract class _$GetTopCopyWith<$Res> {
  factory _$GetTopCopyWith(_GetTop value, $Res Function(_GetTop) then) =
      __$GetTopCopyWithImpl<$Res>;
  $Res call({int? limit});
}

/// @nodoc
class __$GetTopCopyWithImpl<$Res> extends _$HighScoreEventCopyWithImpl<$Res>
    implements _$GetTopCopyWith<$Res> {
  __$GetTopCopyWithImpl(_GetTop _value, $Res Function(_GetTop) _then)
      : super(_value, (v) => _then(v as _GetTop));

  @override
  _GetTop get _value => super._value as _GetTop;

  @override
  $Res call({
    Object? limit = freezed,
  }) {
    return _then(_GetTop(
      limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_GetTop implements _GetTop {
  const _$_GetTop(this.limit);

  @override
  final int? limit;

  @override
  String toString() {
    return 'HighScoreEvent.getTopScores(limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetTop &&
            const DeepCollectionEquality().equals(other.limit, limit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(limit));

  @JsonKey(ignore: true)
  @override
  _$GetTopCopyWith<_GetTop> get copyWith =>
      __$GetTopCopyWithImpl<_GetTop>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit) getTopScores,
    required TResult Function(int score) addScore,
  }) {
    return getTopScores(limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? limit)? getTopScores,
    TResult Function(int score)? addScore,
  }) {
    return getTopScores?.call(limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit)? getTopScores,
    TResult Function(int score)? addScore,
    required TResult orElse(),
  }) {
    if (getTopScores != null) {
      return getTopScores(limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTop value) getTopScores,
    required TResult Function(_AddScore value) addScore,
  }) {
    return getTopScores(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetTop value)? getTopScores,
    TResult Function(_AddScore value)? addScore,
  }) {
    return getTopScores?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTop value)? getTopScores,
    TResult Function(_AddScore value)? addScore,
    required TResult orElse(),
  }) {
    if (getTopScores != null) {
      return getTopScores(this);
    }
    return orElse();
  }
}

abstract class _GetTop implements HighScoreEvent {
  const factory _GetTop(int? limit) = _$_GetTop;

  int? get limit;
  @JsonKey(ignore: true)
  _$GetTopCopyWith<_GetTop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AddScoreCopyWith<$Res> {
  factory _$AddScoreCopyWith(_AddScore value, $Res Function(_AddScore) then) =
      __$AddScoreCopyWithImpl<$Res>;
  $Res call({int score});
}

/// @nodoc
class __$AddScoreCopyWithImpl<$Res> extends _$HighScoreEventCopyWithImpl<$Res>
    implements _$AddScoreCopyWith<$Res> {
  __$AddScoreCopyWithImpl(_AddScore _value, $Res Function(_AddScore) _then)
      : super(_value, (v) => _then(v as _AddScore));

  @override
  _AddScore get _value => super._value as _AddScore;

  @override
  $Res call({
    Object? score = freezed,
  }) {
    return _then(_AddScore(
      score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_AddScore implements _AddScore {
  const _$_AddScore(this.score);

  @override
  final int score;

  @override
  String toString() {
    return 'HighScoreEvent.addScore(score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddScore &&
            const DeepCollectionEquality().equals(other.score, score));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(score));

  @JsonKey(ignore: true)
  @override
  _$AddScoreCopyWith<_AddScore> get copyWith =>
      __$AddScoreCopyWithImpl<_AddScore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit) getTopScores,
    required TResult Function(int score) addScore,
  }) {
    return addScore(score);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? limit)? getTopScores,
    TResult Function(int score)? addScore,
  }) {
    return addScore?.call(score);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit)? getTopScores,
    TResult Function(int score)? addScore,
    required TResult orElse(),
  }) {
    if (addScore != null) {
      return addScore(score);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTop value) getTopScores,
    required TResult Function(_AddScore value) addScore,
  }) {
    return addScore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetTop value)? getTopScores,
    TResult Function(_AddScore value)? addScore,
  }) {
    return addScore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTop value)? getTopScores,
    TResult Function(_AddScore value)? addScore,
    required TResult orElse(),
  }) {
    if (addScore != null) {
      return addScore(this);
    }
    return orElse();
  }
}

abstract class _AddScore implements HighScoreEvent {
  const factory _AddScore(int score) = _$_AddScore;

  int get score;
  @JsonKey(ignore: true)
  _$AddScoreCopyWith<_AddScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$HighScoreStateTearOff {
  const _$HighScoreStateTearOff();

  _Empty empty() {
    return const _Empty();
  }

  _HighScores loaded(List<HighScore> highScores) {
    return _HighScores(
      highScores,
    );
  }
}

/// @nodoc
const $HighScoreState = _$HighScoreStateTearOff();

/// @nodoc
mixin _$HighScoreState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(List<HighScore> highScores) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(List<HighScore> highScores)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(List<HighScore> highScores)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_HighScores value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_HighScores value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_HighScores value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HighScoreStateCopyWith<$Res> {
  factory $HighScoreStateCopyWith(
          HighScoreState value, $Res Function(HighScoreState) then) =
      _$HighScoreStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HighScoreStateCopyWithImpl<$Res>
    implements $HighScoreStateCopyWith<$Res> {
  _$HighScoreStateCopyWithImpl(this._value, this._then);

  final HighScoreState _value;
  // ignore: unused_field
  final $Res Function(HighScoreState) _then;
}

/// @nodoc
abstract class _$EmptyCopyWith<$Res> {
  factory _$EmptyCopyWith(_Empty value, $Res Function(_Empty) then) =
      __$EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$EmptyCopyWithImpl<$Res> extends _$HighScoreStateCopyWithImpl<$Res>
    implements _$EmptyCopyWith<$Res> {
  __$EmptyCopyWithImpl(_Empty _value, $Res Function(_Empty) _then)
      : super(_value, (v) => _then(v as _Empty));

  @override
  _Empty get _value => super._value as _Empty;
}

/// @nodoc

class _$_Empty implements _Empty {
  const _$_Empty();

  @override
  String toString() {
    return 'HighScoreState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(List<HighScore> highScores) loaded,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(List<HighScore> highScores)? loaded,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(List<HighScore> highScores)? loaded,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_HighScores value) loaded,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_HighScores value)? loaded,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_HighScores value)? loaded,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements HighScoreState {
  const factory _Empty() = _$_Empty;
}

/// @nodoc
abstract class _$HighScoresCopyWith<$Res> {
  factory _$HighScoresCopyWith(
          _HighScores value, $Res Function(_HighScores) then) =
      __$HighScoresCopyWithImpl<$Res>;
  $Res call({List<HighScore> highScores});
}

/// @nodoc
class __$HighScoresCopyWithImpl<$Res> extends _$HighScoreStateCopyWithImpl<$Res>
    implements _$HighScoresCopyWith<$Res> {
  __$HighScoresCopyWithImpl(
      _HighScores _value, $Res Function(_HighScores) _then)
      : super(_value, (v) => _then(v as _HighScores));

  @override
  _HighScores get _value => super._value as _HighScores;

  @override
  $Res call({
    Object? highScores = freezed,
  }) {
    return _then(_HighScores(
      highScores == freezed
          ? _value.highScores
          : highScores // ignore: cast_nullable_to_non_nullable
              as List<HighScore>,
    ));
  }
}

/// @nodoc

class _$_HighScores implements _HighScores {
  const _$_HighScores(this.highScores);

  @override
  final List<HighScore> highScores;

  @override
  String toString() {
    return 'HighScoreState.loaded(highScores: $highScores)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HighScores &&
            const DeepCollectionEquality()
                .equals(other.highScores, highScores));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(highScores));

  @JsonKey(ignore: true)
  @override
  _$HighScoresCopyWith<_HighScores> get copyWith =>
      __$HighScoresCopyWithImpl<_HighScores>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(List<HighScore> highScores) loaded,
  }) {
    return loaded(highScores);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(List<HighScore> highScores)? loaded,
  }) {
    return loaded?.call(highScores);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(List<HighScore> highScores)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(highScores);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_HighScores value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_HighScores value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_HighScores value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _HighScores implements HighScoreState {
  const factory _HighScores(List<HighScore> highScores) = _$_HighScores;

  List<HighScore> get highScores;
  @JsonKey(ignore: true)
  _$HighScoresCopyWith<_HighScores> get copyWith =>
      throw _privateConstructorUsedError;
}
