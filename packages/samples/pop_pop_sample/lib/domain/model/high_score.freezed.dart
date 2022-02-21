// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'high_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HighScoreTearOff {
  const _$HighScoreTearOff();

  _HighScore call(
      {required int id, required int score, required DateTime playedAt}) {
    return _HighScore(
      id: id,
      score: score,
      playedAt: playedAt,
    );
  }
}

/// @nodoc
const $HighScore = _$HighScoreTearOff();

/// @nodoc
mixin _$HighScore {
  int get id => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  DateTime get playedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HighScoreCopyWith<HighScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HighScoreCopyWith<$Res> {
  factory $HighScoreCopyWith(HighScore value, $Res Function(HighScore) then) =
      _$HighScoreCopyWithImpl<$Res>;
  $Res call({int id, int score, DateTime playedAt});
}

/// @nodoc
class _$HighScoreCopyWithImpl<$Res> implements $HighScoreCopyWith<$Res> {
  _$HighScoreCopyWithImpl(this._value, this._then);

  final HighScore _value;
  // ignore: unused_field
  final $Res Function(HighScore) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? score = freezed,
    Object? playedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      playedAt: playedAt == freezed
          ? _value.playedAt
          : playedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$HighScoreCopyWith<$Res> implements $HighScoreCopyWith<$Res> {
  factory _$HighScoreCopyWith(
          _HighScore value, $Res Function(_HighScore) then) =
      __$HighScoreCopyWithImpl<$Res>;
  @override
  $Res call({int id, int score, DateTime playedAt});
}

/// @nodoc
class __$HighScoreCopyWithImpl<$Res> extends _$HighScoreCopyWithImpl<$Res>
    implements _$HighScoreCopyWith<$Res> {
  __$HighScoreCopyWithImpl(_HighScore _value, $Res Function(_HighScore) _then)
      : super(_value, (v) => _then(v as _HighScore));

  @override
  _HighScore get _value => super._value as _HighScore;

  @override
  $Res call({
    Object? id = freezed,
    Object? score = freezed,
    Object? playedAt = freezed,
  }) {
    return _then(_HighScore(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      playedAt: playedAt == freezed
          ? _value.playedAt
          : playedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_HighScore extends _HighScore {
  const _$_HighScore(
      {required this.id, required this.score, required this.playedAt})
      : super._();

  @override
  final int id;
  @override
  final int score;
  @override
  final DateTime playedAt;

  @override
  String toString() {
    return 'HighScore(id: $id, score: $score, playedAt: $playedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HighScore &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.score, score) &&
            const DeepCollectionEquality().equals(other.playedAt, playedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(score),
      const DeepCollectionEquality().hash(playedAt));

  @JsonKey(ignore: true)
  @override
  _$HighScoreCopyWith<_HighScore> get copyWith =>
      __$HighScoreCopyWithImpl<_HighScore>(this, _$identity);
}

abstract class _HighScore extends HighScore {
  const factory _HighScore(
      {required int id,
      required int score,
      required DateTime playedAt}) = _$_HighScore;
  const _HighScore._() : super._();

  @override
  int get id;
  @override
  int get score;
  @override
  DateTime get playedAt;
  @override
  @JsonKey(ignore: true)
  _$HighScoreCopyWith<_HighScore> get copyWith =>
      throw _privateConstructorUsedError;
}
