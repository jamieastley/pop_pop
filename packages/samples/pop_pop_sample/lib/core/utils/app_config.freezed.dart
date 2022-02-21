// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppConfigTearOff {
  const _$AppConfigTearOff();

  _AppConfig call(
      {required String appVersion,
      String? sentryDsn,
      bool isGameConfigEnabled = false,
      bool isHighScoreEnabled = false,
      Environment environment = Environment.prod}) {
    return _AppConfig(
      appVersion: appVersion,
      sentryDsn: sentryDsn,
      isGameConfigEnabled: isGameConfigEnabled,
      isHighScoreEnabled: isHighScoreEnabled,
      environment: environment,
    );
  }
}

/// @nodoc
const $AppConfig = _$AppConfigTearOff();

/// @nodoc
mixin _$AppConfig {
  String get appVersion => throw _privateConstructorUsedError;
  String? get sentryDsn => throw _privateConstructorUsedError;
  bool get isGameConfigEnabled => throw _privateConstructorUsedError;
  bool get isHighScoreEnabled => throw _privateConstructorUsedError;
  Environment get environment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppConfigCopyWith<AppConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigCopyWith<$Res> {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) then) =
      _$AppConfigCopyWithImpl<$Res>;
  $Res call(
      {String appVersion,
      String? sentryDsn,
      bool isGameConfigEnabled,
      bool isHighScoreEnabled,
      Environment environment});
}

/// @nodoc
class _$AppConfigCopyWithImpl<$Res> implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._value, this._then);

  final AppConfig _value;
  // ignore: unused_field
  final $Res Function(AppConfig) _then;

  @override
  $Res call({
    Object? appVersion = freezed,
    Object? sentryDsn = freezed,
    Object? isGameConfigEnabled = freezed,
    Object? isHighScoreEnabled = freezed,
    Object? environment = freezed,
  }) {
    return _then(_value.copyWith(
      appVersion: appVersion == freezed
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      sentryDsn: sentryDsn == freezed
          ? _value.sentryDsn
          : sentryDsn // ignore: cast_nullable_to_non_nullable
              as String?,
      isGameConfigEnabled: isGameConfigEnabled == freezed
          ? _value.isGameConfigEnabled
          : isGameConfigEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isHighScoreEnabled: isHighScoreEnabled == freezed
          ? _value.isHighScoreEnabled
          : isHighScoreEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      environment: environment == freezed
          ? _value.environment
          : environment // ignore: cast_nullable_to_non_nullable
              as Environment,
    ));
  }
}

/// @nodoc
abstract class _$AppConfigCopyWith<$Res> implements $AppConfigCopyWith<$Res> {
  factory _$AppConfigCopyWith(
          _AppConfig value, $Res Function(_AppConfig) then) =
      __$AppConfigCopyWithImpl<$Res>;
  @override
  $Res call(
      {String appVersion,
      String? sentryDsn,
      bool isGameConfigEnabled,
      bool isHighScoreEnabled,
      Environment environment});
}

/// @nodoc
class __$AppConfigCopyWithImpl<$Res> extends _$AppConfigCopyWithImpl<$Res>
    implements _$AppConfigCopyWith<$Res> {
  __$AppConfigCopyWithImpl(_AppConfig _value, $Res Function(_AppConfig) _then)
      : super(_value, (v) => _then(v as _AppConfig));

  @override
  _AppConfig get _value => super._value as _AppConfig;

  @override
  $Res call({
    Object? appVersion = freezed,
    Object? sentryDsn = freezed,
    Object? isGameConfigEnabled = freezed,
    Object? isHighScoreEnabled = freezed,
    Object? environment = freezed,
  }) {
    return _then(_AppConfig(
      appVersion: appVersion == freezed
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      sentryDsn: sentryDsn == freezed
          ? _value.sentryDsn
          : sentryDsn // ignore: cast_nullable_to_non_nullable
              as String?,
      isGameConfigEnabled: isGameConfigEnabled == freezed
          ? _value.isGameConfigEnabled
          : isGameConfigEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isHighScoreEnabled: isHighScoreEnabled == freezed
          ? _value.isHighScoreEnabled
          : isHighScoreEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      environment: environment == freezed
          ? _value.environment
          : environment // ignore: cast_nullable_to_non_nullable
              as Environment,
    ));
  }
}

/// @nodoc

class _$_AppConfig extends _AppConfig {
  const _$_AppConfig(
      {required this.appVersion,
      this.sentryDsn,
      this.isGameConfigEnabled = false,
      this.isHighScoreEnabled = false,
      this.environment = Environment.prod})
      : super._();

  @override
  final String appVersion;
  @override
  final String? sentryDsn;
  @JsonKey()
  @override
  final bool isGameConfigEnabled;
  @JsonKey()
  @override
  final bool isHighScoreEnabled;
  @JsonKey()
  @override
  final Environment environment;

  @override
  String toString() {
    return 'AppConfig(appVersion: $appVersion, sentryDsn: $sentryDsn, isGameConfigEnabled: $isGameConfigEnabled, isHighScoreEnabled: $isHighScoreEnabled, environment: $environment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppConfig &&
            const DeepCollectionEquality()
                .equals(other.appVersion, appVersion) &&
            const DeepCollectionEquality().equals(other.sentryDsn, sentryDsn) &&
            const DeepCollectionEquality()
                .equals(other.isGameConfigEnabled, isGameConfigEnabled) &&
            const DeepCollectionEquality()
                .equals(other.isHighScoreEnabled, isHighScoreEnabled) &&
            const DeepCollectionEquality()
                .equals(other.environment, environment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(appVersion),
      const DeepCollectionEquality().hash(sentryDsn),
      const DeepCollectionEquality().hash(isGameConfigEnabled),
      const DeepCollectionEquality().hash(isHighScoreEnabled),
      const DeepCollectionEquality().hash(environment));

  @JsonKey(ignore: true)
  @override
  _$AppConfigCopyWith<_AppConfig> get copyWith =>
      __$AppConfigCopyWithImpl<_AppConfig>(this, _$identity);
}

abstract class _AppConfig extends AppConfig {
  const factory _AppConfig(
      {required String appVersion,
      String? sentryDsn,
      bool isGameConfigEnabled,
      bool isHighScoreEnabled,
      Environment environment}) = _$_AppConfig;
  const _AppConfig._() : super._();

  @override
  String get appVersion;
  @override
  String? get sentryDsn;
  @override
  bool get isGameConfigEnabled;
  @override
  bool get isHighScoreEnabled;
  @override
  Environment get environment;
  @override
  @JsonKey(ignore: true)
  _$AppConfigCopyWith<_AppConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
