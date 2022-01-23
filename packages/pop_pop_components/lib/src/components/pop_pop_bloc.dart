import 'package:flutter/foundation.dart';
import 'package:pop_pop/pop_pop.dart';
import 'package:rxdart/subjects.dart';

typedef OnAllBubblesPopped = void Function(double scrollDistance);

/// A [Stream] based BLoC that implements [BubblePopGame] logic.
///
/// Can be used with both vanilla [StreamBuilder] or alongside other
/// state-management options such as [flutter_bloc](https://pub.dev/packages/flutter_bloc)
/// and [Provider](https://pub.dev/packages/provider).
class PopPopBloc extends PopPop<PopPopState, int> {
  // BehaviorSubject allows multiple listeners to catch the last emitted value.
  // Allows multiple widgets to access game state (eg. display scores)
  final _gameState =
      BehaviorSubject<PopPopState>.seeded(const InitialPopPopState());

  // final _timerState = BehaviorSubject<String>.seeded('--:--');

  final _scoreState = BehaviorSubject<int>.seeded(0);

  @visibleForTesting
  int gridSize = 0;

  @visibleForTesting
  double scrollOffset = 0;

  @override
  Stream<PopPopState> get gameStateStream => _gameState.stream;

  // @override
  // Stream<int> get timerStateStream => _timerState.stream;

  @override
  Stream<int> get currentScoreStream => _scoreState;

  /// Callback to be notified of when the threshold of bubbles
  /// have been popped, and the game should roll the bubble wrap grid up.
  final OnAllBubblesPopped onAllPopped;

  /// Creates an instance of [PopPopBloc].
  ///
  /// Should be created at the top of your pages widget tree, so
  /// as to allow components within the game to listen and react
  /// to stream and state changes.
  PopPopBloc({
    bool loggingEnabled = false,
    PopPopTimer<int>? timer,
    PopPopAudio? audioPlayer,
    PopPopBubbleTheme bubbleTheme = const PopPopBubbleTheme(),
    required this.onAllPopped,
  }) : super(
          bubbleTheme: bubbleTheme,
          audioPlayer: audioPlayer,
          timer: timer,
          isLoggingEnabled: loggingEnabled,
        );

  @override
  void onBubblePopped() {
    audioPlayer?.playSoundEffect();

    var newScore = (_scoreState.value + 1);
    _scoreState.add(newScore);
    _log('Popped ${newScore % gridSize}/$gridSize bubbles.');
    if (newScore % 2 == 0) {
      // if (newScore % gridSize == 0) {
      onAllPopped.call(scrollOffset);
    }
  }

  @override
  void restartGame() {
    timer?.restartTimer();
    _scoreState.add(0);
    _gameState.add(const PopPopReadyState());
  }

  @override
  void cacheGameSizes({
    required int horizontalCount,
    required int verticalCount,
    required double bottomOffset,
    bool isStaggered = true,
  }) {
    scrollOffset = (bubbleTheme.size * verticalCount) + bottomOffset;
    _log('Cached scrollOffset: $scrollOffset');
    if (isStaggered) {
      // if odd number, rounds up to return correct removed count
      final removedBubbles = (verticalCount / 2).round();
      final total = (horizontalCount * verticalCount) - removedBubbles;
      gridSize = total;
      _log('Generating ${horizontalCount}w x ${verticalCount}h grid.');
      _log('Bubbles removed from staggered grid: $removedBubbles');
      _log('Total bubble count: $total');
    } else {
      final total = (horizontalCount * verticalCount);
      gridSize = total;
      _log('Generating ${horizontalCount}w x ${verticalCount}h grid.');
    }
  }

  @override
  void startGame() {
    _gameState.add(const PopPopReadyState());
    timer?.startTimer();
    timer?.countdownTimerStream.listen((int event) {
      if (event > 0) {
        // _timerState.add(event.formatTimeString);
      } else {
        _gameState.add(PopPopFinishedState(totalScore: _scoreState.value));
      }
    });
  }

  void _log(String message) {
    if (isLoggingEnabled) {
      // ignore: avoid_print
      print('$this $message');
    }
  }

  @override
  void dispose() {
    audioPlayer?.dispose();
    timer?.dispose();
    _gameState.close();
    // _timerState?.close();
    _scoreState.close();
    _log('disposed.');
  }

  @override
  String toString() => '::PopPopBloc::';
}

extension FormatAsTime on int {
  String toFormattedTimeString() {
    final currentVal = (this);
    final minutesStr =
        ((currentVal / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (currentVal % 60).floor().toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }
}
