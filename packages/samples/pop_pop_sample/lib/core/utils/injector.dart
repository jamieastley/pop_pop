import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:pop_pop/pop_pop.dart';
import 'package:pop_pop_components/pop_pop_components.dart';
import 'package:pop_pop_sample/core/consts/environment.dart';
import 'package:pop_pop_sample/core/utils/app_config.dart';
import 'package:pop_pop_sample/domain/high_score_repository.dart';
import 'package:pop_pop_sample/infrastructure/database/models/high_scores.dart';
import 'package:pop_pop_sample/infrastructure/database/platform/isar_platform.dart';
import 'package:pop_pop_sample/pop_pop_audio_player.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

typedef AppRunner = FutureOr<void> Function();

class Injector {
  static Future<void> init(
    Environment environment, {
    required AppRunner appRunner,
  }) async {
    WidgetsFlutterBinding.ensureInitialized();

    final config = await AppConfig.init(env: environment);
    GetIt.I.registerSingleton<AppConfig>(config);
    await Sentry.init(
      (options) {
        options.dsn = config.sentryDsn;
      },
      appRunner: () async {
        _initDependencies(environment);
        appRunner();
      },
    );
  }
}

Future<void> _initDependencies(Environment environment) async {
  GetIt.I.registerFactory<PopPopAudio>(() => PopPopAudioPlayer(
        filePath: 'mp3/pop.mp3',
        loggingEnabled: environment == Environment.dev,
      ));
  GetIt.I.registerFactory<PopPopTimer<int>>(() => PopPopStreamTimer(
        loggingEnabled: environment == Environment.dev,
        seconds: 30,
      ));

  GetIt.I.registerSingletonAsync<Isar>(() async =>
      IsarPlatform().init([HighScoresSchema], enableInspector: true));

  GetIt.I.registerSingletonWithDependencies<HighScoreRepository>(
    () => HighScoreRepository(),
    dependsOn: [Isar],
  );

  await GetIt.I.allReady();
}
