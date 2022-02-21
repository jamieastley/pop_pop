extension TimeExtensions on int {
  String toTimeRemaining() {
    final minutesStr =
        (this / Duration.minutesPerHour).floor().toString().padLeft(2, '0');
    final secondsStr =
        (this % Duration.secondsPerMinute).floor().toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }
}
