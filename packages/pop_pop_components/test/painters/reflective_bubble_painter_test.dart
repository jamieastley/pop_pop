// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pop_pop/pop_pop.dart';
import 'package:pop_pop_components/src/painters/reflective_bubble_painter.dart';

void main() {
  const size = 40.0;
  const model = PopPopBubbleTheme(size: size);

  group('ReflectiveBubblePainter:', () {
    testWidgets('Ensure widget is rendered within the given bounds',
        (WidgetTester tester) async {
      const key = Key('ReflectiveBubble');

      tester.binding.window.physicalSizeTestValue = const Size(size, size);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      const widget = ReflectiveBubblePainter(
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
      print('Found $key at ${pos.toString()}');
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
  });
}
