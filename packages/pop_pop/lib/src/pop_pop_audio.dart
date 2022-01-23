import 'dart:async';

abstract class PopPopAudio {
  /// Defines the default file path.
  ///
  /// This is intended to be used for your games' bubble pop sound effect.
  final String defaultFilePath;

  /// Sets whether the [PopPopAudio] implementation should
  /// enable debug logging.
  final bool enableLogging;

  /// Creates a [PopPopAudio] interface.
  ///
  /// Should be extended upon to provide your own audio
  /// player implemention with your preferred audio player package.
  const PopPopAudio({
    required this.defaultFilePath,
    this.enableLogging = false,
  });

  /// Initialise any resources required by the [PopPopAudio] implementation.
  FutureOr<void> init();

  /// Play a game sound effect.
  ///
  /// Should fallback to use the `defaultFilePath` (eg. this can be your bubble pop
  /// sound effect), if `filePath` is `null`, otherwise provide a `filePath` value if you
  /// desire additional game sound effects.
  FutureOr<void> playSoundEffect({String? filePath});

  /// Dispose of and clean up any audio player resources.
  FutureOr<void> dispose();
}
