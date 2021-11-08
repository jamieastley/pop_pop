/// An optional timer to implement if a stopwatch or countdown timer
/// is required for [BubblePopGame] implementations.
abstract class PopPopTimer<T extends Object> {
  /// [Stream] to listen to that emits time updates.
  Stream<T> get countdownTimerStream;

  /// Initialises the timer with the given `seconds` value.
  final int seconds;

  /// Sets whether the lib should print debug logs.
  final bool loggingEnabled;

  const PopPopTimer({required this.seconds, this.loggingEnabled = false});

  /// Starts the timer countdown.
  void startTimer();

  /// Pauses the active timer [Stream].
  void pauseTimer();

  /// Resumes a paused timer [Stream]
  void resumeTimer();

  /// Restarts tje active timer and sets to the given `seconds` value.
  void restartTimer();

  /// Close streams and clean up resources.
  void dispose();
}
