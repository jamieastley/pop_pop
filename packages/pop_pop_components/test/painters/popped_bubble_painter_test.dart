import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pop_pop/pop_pop.dart';
import 'package:pop_pop_components/src/painters/popped_bubble_painter.dart';

void main() {
  const size = 100.0;
  const key = Key('PoppedBubble');
  const model = PopPopBubbleTheme(size: size);

  group('PoppedBubblePainter:', () {
    testWidgets('Ensure widget is rendered within the given bounds',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(size, size);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      const widget = PoppedBubblePainter(
        key: key,
        themeModel: model,
      );

      await tester.pumpWidget(
        const MediaQuery(
          data: MediaQueryData(),
          child: widget,
        ),
      );
      await tester.pumpAndSettle();

      final pos = tester.getRect(find.byKey(key));
      debugPrint('Found $key at ${pos.toString()}');
      final leftPos = pos.left.floor();
      final rightPos = pos.right.floor();
      final topPos = pos.top.floor();
      final bottomPos = pos.bottom.floor();

      expect(leftPos, greaterThanOrEqualTo(0));
      expect(leftPos, lessThanOrEqualTo(size));

      expect(rightPos, greaterThanOrEqualTo(size));
      expect(rightPos, lessThanOrEqualTo(size));

      expect(topPos, greaterThanOrEqualTo(0));
      expect(topPos, lessThanOrEqualTo(size));

      expect(bottomPos, greaterThanOrEqualTo(size));
      expect(bottomPos, lessThanOrEqualTo(size));
    });

    testWidgets('Golden test', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PoppedBubblePainter(themeModel: model),
          ),
        ),
      );
      await expectLater(find.byType(PoppedBubblePainter),
          matchesGoldenFile('../goldens/painters/popped_bubble_painter.png'));
    });
  });
}
