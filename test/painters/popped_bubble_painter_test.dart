import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pop_pop/src/core/pop_pop_bubble_theme_model.dart';
import 'package:pop_pop/src/painters/popped_bubble_painter.dart';

void main() {
  final size = 40.0;
  final model = PopPopBubbleTheme(size: size);

  group('PoppedBubblePainter:', () {
    testWidgets('Ensure widget is rendered within the given bounds',
        (WidgetTester tester) async {
      final key = Key('PoppedBubble');

      tester.binding.window.physicalSizeTestValue = Size(size, size);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      final widget = PoppedBubblePainter(
        key: key,
        themeModel: model,
      );

      await tester.pumpWidget(
        MediaQuery(
          data: MediaQueryData(),
          child: widget,
        ),
      );

      await tester.pumpAndSettle();

      final pos = await tester.getRect(find.byKey(key));
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
