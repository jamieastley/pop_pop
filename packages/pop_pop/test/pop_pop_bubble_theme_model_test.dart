import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pop_pop/pop_pop.dart';

void main() {
  group('PopPopBubbleThemeModel:', () {
    testWidgets('Golden test', (tester) async {
      const theme = PopPopBubbleTheme();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: theme.size,
                width: theme.size,
                decoration: BoxDecoration(color: theme.bubbleBaseColor),
              ),
              Container(
                height: theme.size,
                width: theme.size,
                decoration: BoxDecoration(
                  color: theme.bubbleBodyColor,
                  border: Border.all(
                    width: theme.strokeWidth,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                height: theme.size,
                width: theme.size,
                decoration: BoxDecoration(color: theme.bubbleRimColor),
              ),
              Container(
                height: theme.size,
                width: theme.size,
                decoration: BoxDecoration(color: theme.gridBackgroundColor),
              ),
              Container(
                height: theme.size,
                width: theme.size,
                decoration: BoxDecoration(color: theme.poppedBubbleBaseColor),
              ),
            ],
          ),
        ),
      ));

      await expectLater(
        find.byType(Row),
        matchesGoldenFile('goldens/default_theme.png'),
      );
    });
  });
}
