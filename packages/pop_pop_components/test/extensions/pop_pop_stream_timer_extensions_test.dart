import 'package:flutter_test/flutter_test.dart';
import 'package:pop_pop_components/src/components/pop_pop_stream_timer.dart';

void main() {
  group('toFormattedTimeString:', () {
    test('Verify extension method returns expected timestamp string', () {
      expect(120.toFormattedTimeString(), equals('02:00'));
      expect(720.toFormattedTimeString(), equals('12:00'));
      expect(1.toFormattedTimeString(), equals('00:01'));
      expect(0.toFormattedTimeString(), equals('00:00'));
    });
  });
}
