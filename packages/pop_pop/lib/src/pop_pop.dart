import 'package:pop_pop/src/pop_pop_audio.dart';
import 'package:pop_pop/src/pop_pop_state.dart';
import 'package:pop_pop/src/pop_pop_timer.dart';

import 'pop_pop_bubble_theme_model.dart';

/// The base logic that runs the game.
///
/// Provides the building blocks to build around a different architecture
/// or extend upon for additional functionality.
abstract class PopPop<S extends PopPopState, T extends Object> {
  /// The current state of the game.
  ///
  /// Depending on imgame plementation, should be called
  /// sparingly as rebuilding the state can be expensive.
  Stream<S> get gameStateStream;

  /// A [Stream<T>] that can be used to expose the game time from the
  /// `timer` implementation, if desired.
  // Stream<T> get timerStateStream;

  /// Emits the players current score.
  Stream<int> get currentScoreStream;

  /// Color theme of each of the game elements.
  final PopPopBubbleTheme bubbleTheme;

  /// Audio interface that is responsible for game sounds effects.
  final PopPopAudio? audioPlayer;

  /// Optional timer interface for timed game modes.
  final PopPopTimer<T>? timer;

  /// Enable debug logging.
  final bool enableLogging;

  /// Creates an implementation of a [PopPop].
  ///
  /// Provides the basic building blocks the game depends on,
  /// allowing implementation with any state management solution.
  const PopPop({
    required this.bubbleTheme,
    this.audioPlayer,
    this.timer,
    this.enableLogging = false,
  });

  /// Cache the generated grid size/count for the device.
  ///
  /// Required for the [BubblePopGame] to determine when to regenerate
  /// new bubbles based off the users' score.
  void cacheGameSizes({
    required int horizontalCount,
    required int verticalCount,
    required double bottomOffset,
    bool isStaggered = true,
  });

  /// Starts the game.
  ///
  /// Useful to kick-off one time events such as timer
  /// initialisation and pre-caching sound effects. Initialises
  /// the available bubble count to determine when to rebuild the grid.
  void startGame();

  /// Callback to alert the game that a bubble has been popped,
  /// and that the score should increment.
  void onBubblePopped();

  /// Restart the game state.
  void restartGame();

  /// Clean up and dispose of game resources and assets.
  void dispose();
}
