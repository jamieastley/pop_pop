import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pop_pop_sample/core/consts/consts.dart';
import 'package:pop_pop_sample/core/consts/environment.dart';

part 'app_config.freezed.dart';

@freezed
class AppConfig with _$AppConfig {
  const AppConfig._();

  const factory AppConfig({
    required String appVersion,
    String? sentryDsn,
    @Default(false) bool isGameConfigEnabled,
    @Default(false) bool isHighScoreEnabled,
    @Default(Environment.prod) Environment environment,
  }) = _AppConfig;

  static Future<AppConfig> init({Environment env = Environment.prod}) async {
    final packageInfo = await PackageInfo.fromPlatform();
    final buildNumber = packageInfo.buildNumber.isNotEmpty
        ? ' (${packageInfo.buildNumber})'
        : '';
    const sentryDsn = String.fromEnvironment(AppConsts.sentryDsn);
    const isConfigEnabled = bool.fromEnvironment(AppConsts.enableGameConfig);
    const isHighScoreEnabled = bool.fromEnvironment(AppConsts.enableHighScores);
    return AppConfig(
      appVersion: '${packageInfo.version}$buildNumber',
      sentryDsn: sentryDsn,
      environment: env,
      isGameConfigEnabled: isConfigEnabled,
      isHighScoreEnabled: isHighScoreEnabled,
    );
  }
}
