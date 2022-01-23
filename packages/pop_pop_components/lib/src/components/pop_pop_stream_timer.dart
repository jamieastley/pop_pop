import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pop_pop/pop_pop.dart';
import 'package:rxdart/subjects.dart';

export '../extensions/pop_pop_stream_timer_extensions.dart';

class PopPopStreamTimer extends PopPopTimer<int> {
  final _timerState = BehaviorSubject<int>();

  StreamSubscription<int>? _timerStreamSubscription;

  @override
  Stream<int> get countdownTimerStream => _timerState;

  PopPopStreamTimer({
    int seconds = 60,
    bool enableLogging = false,
  }) : super(seconds: seconds, enableLogging: enableLogging);

  @override
  void pauseTimer() {
    _timerStreamSubscription?.pause();
  }

  @override
  void restartTimer() {
    _initTimer(super.seconds);
  }

  @override
  void resumeTimer() {
    _timerStreamSubscription?.resume();
  }

  @override
  void startTimer() {
    _initTimer(seconds);
  }

  void _initTimer(int seconds) {
    _timerStreamSubscription?.cancel();

    // instantly emit our starting time, otherwise listeners
    // don't get notified until after the first second ticks.
    _timerState.add(seconds);

    _timerStreamSubscription =
        Stream.periodic(const Duration(seconds: 1), (x) => seconds - x - 1)
            .take(seconds)
            .listen((event) {
      _log('$event seconds left');
      _timerState.add(event);
    });
  }

  @override
  void dispose() {
    _timerStreamSubscription?.cancel();
    _timerState.close();
    _log('disposed.');
  }

  void _log(String message) {
    if (enableLogging) {
      debugPrint('$this $message');
    }
  }

  @override
  String toString() => '::PopPopStreamTimer::';
}
