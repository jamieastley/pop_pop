import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:pop_pop_components/src/components/pop_pop_stream_timer.dart';

void main() {
  late PopPopStreamTimer timer;

  tearDown(() {
    timer.dispose();
  });

  group('BubblePopStreamTimer', () {
    test('Initialises with the correct value and emits countdown events',
        () async {
      const seconds = 7;
      timer = PopPopStreamTimer(
        seconds: seconds,
        loggingEnabled: true,
      )..startTimer();

      await expectLater(timer.countdownTimerStream,
          emitsInOrder(List<int>.generate(seconds, (i) => seconds - (i))));
    });

    test('Verify timer stops emitting when pause is invoked', () async {
      const seconds = 7;
      timer = PopPopStreamTimer(
        seconds: seconds,
        loggingEnabled: true,
      )..startTimer();

      timer.countdownTimerStream.listen((event) {
        if (event == 5) {
          timer.pauseTimer();
        }
      });

      await expectLater(
        timer.countdownTimerStream,
        emitsInOrder(
          <int>[7, 6, 5],
        ),
      );
    });

    test('Verify timer restarts when restart is invoked', () async {
      const seconds = 3;
      final completer = Completer<void>();
      timer = PopPopStreamTimer(
        seconds: seconds,
        loggingEnabled: true,
      )..startTimer();

      timer.countdownTimerStream.listen((event) {
        if (event == 1 && !completer.isCompleted) {
          completer.complete();
          timer.restartTimer();
        }
      });

      await expectLater(
        timer.countdownTimerStream,
        emitsInOrder(
          <int>[3, 2, 1, 3, 2, 1, 0],
        ),
      );
    });

    test('Verify timer restarts when restart is invoked', () async {
      const seconds = 3;
      final completer = Completer<void>();
      timer = PopPopStreamTimer(
        seconds: seconds,
        loggingEnabled: true,
      )..startTimer();

      timer.countdownTimerStream.listen((event) {
        if (event == 1 && !completer.isCompleted) {
          completer.complete();
          timer.restartTimer();
        }
      });

      await expectLater(
        timer.countdownTimerStream,
        emitsInOrder(
          <int>[3, 2, 1, 3, 2, 1, 0],
        ),
      );
    });
  });
}
