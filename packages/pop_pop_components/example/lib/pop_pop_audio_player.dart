import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:pop_pop/pop_pop.dart';

class PopPopAudioPlayer extends PopPopAudio {
  late final AudioPlayer _audioPlayer;
  late final AudioCache _audioCache;

  PopPopAudioPlayer({
    required String filePath,
    bool loggingEnabled = false,
  }) : super(
          defaultFilePath: filePath,
          loggingEnabled: loggingEnabled,
        ) {
    init();
  }

  @override
  void init() async {
    _audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
    _audioCache = AudioCache(fixedPlayer: _audioPlayer);
    await _audioCache.load(defaultFilePath);
    // TODO: https://github.com/luanpotter/audioplayers/issues/481
    // investigate delay on iOS
    // .then((f) {
    //   _audioPlayer.play(f.path, volume: 0.0);
    // });
  }

  @override
  void playSoundEffect({String? filePath}) {
    _log('Playing file: $defaultFilePath');
    _audioCache.play(defaultFilePath);
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.release();
    _audioPlayer.dispose();
    _log('$this disposed');
  }

  void _log(String message) {
    if (loggingEnabled) {
      debugPrint('$this $message');
    }
  }

  @override
  String toString() => '::PopPopAudioPlayer::';
}
