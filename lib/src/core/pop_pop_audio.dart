import 'dart:async';

import 'package:flutter/foundation.dart';

abstract class PopPopAudio {
  final String defaultFilePath;

  final bool enableLogging;

  const PopPopAudio({
    @required this.defaultFilePath,
    this.enableLogging = false,
  });

  FutureOr<void> init();

  FutureOr<void> playSoundEffect(String filePath);

  FutureOr<void> dispose();
}
