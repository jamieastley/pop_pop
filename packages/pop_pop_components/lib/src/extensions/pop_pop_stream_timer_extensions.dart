extension FormatAsTime on int {
  /// Returns a prettified time [String] based on the seconds of [this].
  ///
  /// ```dart
  /// print(60.toFormattedTimeString()) // prints '01:00'
  /// ```
  String toFormattedTimeString() {
    final currentVal = (this);
    final minutesStr =
        ((currentVal / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (currentVal % 60).floor().toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }
}
