import 'package:flutter_test/flutter_test.dart';
import 'package:pop_pop_components/src/components/pop_pop_stream_timer.dart';

void main() {
  group('BubblePopStreamTimer', () {
    test('Initialises with the correct value and emits countdown events',
        () async {
      const seconds = 7;
      final streamTimer = PopPopStreamTimer(
        seconds: seconds,
        enableLogging: true,
      )..startTimer();

      await expectLater(streamTimer.countdownTimerStream,
          emitsInOrder(List<int>.generate(seconds, (i) => seconds - (i))));
    });
  });
}
