import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pop_pop_components/src/components/pop_pop_grid.dart';

void main() {
  const bubbleSize = 60.0;

  group('BubblePopGrid:', () {
    testWidgets('Calculates the correct grid size for 320w:570h',
        (WidgetTester tester) async {
      var width = 320.0;
      var height = 570.0;

      tester.binding.window.physicalSizeTestValue = Size(width, height);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(),
          child: MaterialApp(
            home: PopPopGrid(
              controller: ScrollController(),
              onGridInit: (horizontalCount, verticalCount, bottomOffset) {},
              onGenerateBubble: (_, __) => const _DummyBubble(
                size: bubbleSize,
                poppedKeyString: '',
                unpoppedKeyString: '',
              ),
              bubbleSize: bubbleSize,
            ),
          ),
        ),
      );

      final totalRowChildren = (width / bubbleSize).floor();
      final totalColumnChildren = (height / bubbleSize).floor();

      // get the total of bubbles removed due to staggered grid
      final staggeredOffset = totalColumnChildren % 2 == 0
          ? (totalColumnChildren / 2)
          : (totalColumnChildren + 1) / 2;
      final total = (totalRowChildren * totalColumnChildren) - staggeredOffset;
      debugPrint('Total bubble count should be $total');
      expect(find.byType(_DummyBubble, skipOffstage: true),
          findsNWidgets(total.toInt()));

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    testWidgets('Calculates the correct grid size for 1200w:1700h',
        (WidgetTester tester) async {
      var width = 1200.0;
      var height = 1700.0;

      tester.binding.window.physicalSizeTestValue = Size(width, height);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(),
          child: MaterialApp(
            home: PopPopGrid(
              onGridInit: (horizontalCount, verticalCount, bottomOffset) {
                debugPrint(
                    'Horizontal: $horizontalCount, vertical: $verticalCount, bottomOffset: $bottomOffset');
              },
              onGenerateBubble: (sliverIndex, rowIndex) => _DummyBubble(
                key: ValueKey('$sliverIndex-$rowIndex'),
                size: bubbleSize,
                poppedKeyString: '',
                unpoppedKeyString: '',
              ),
              bubbleSize: bubbleSize,
              controller: ScrollController(),
            ),
          ),
        ),
      );

      final totalRowChildren = (width / bubbleSize).floor();
      final totalColumnChildren = (height / bubbleSize).floor();

      // get the total of bubbles removed due to staggered grid
      final staggeredOffset = totalColumnChildren % 2 == 0
          ? (totalColumnChildren / 2)
          : (totalColumnChildren + 1) / 2;
      final total = (totalRowChildren * totalColumnChildren) - staggeredOffset;
      debugPrint('Total bubble count should be $total');
      expect(find.byType(_DummyBubble, skipOffstage: true),
          findsNWidgets(total.toInt()));

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    testWidgets('Verify tapped bubbles are correctly popped',
        (WidgetTester tester) async {
      const tappedBubble1 = 'Bubble-0-0';
      const tappedBubble2 = 'Bubble-2-3';
      const tappedBubble3 = 'Bubble-4-2';

      final controller = ScrollController();

      await tester.pumpWidget(
        MaterialApp(
          home: PopPopGrid(
            controller: controller,
            onGridInit: (horizontalCount, verticalCount, bottomOffset) {
              debugPrint(
                  'Horizontal: $horizontalCount, vertical: $verticalCount, bottomOffset: $bottomOffset');
            },
            onGenerateBubble: (sliverIndex, rowIndex) => _DummyBubble(
              size: bubbleSize,
              unpoppedKeyString: 'Bubble-$sliverIndex-$rowIndex',
              poppedKeyString: 'PoppedBubble-$sliverIndex-$rowIndex',
            ),
            bubbleSize: bubbleSize,
          ),
        ),
      );

      await _popBubble(tester: tester, bubbleKey: tappedBubble1);
      await _popBubble(tester: tester, bubbleKey: tappedBubble2);
      await _popBubble(tester: tester, bubbleKey: tappedBubble3);

      expect(
          find.byKey(const ValueKey('Popped$tappedBubble1')), findsOneWidget);
      expect(
          find.byKey(const ValueKey('Popped$tappedBubble2')), findsOneWidget);
      expect(
          find.byKey(const ValueKey('Popped$tappedBubble3')), findsOneWidget);
    });
  });

  testWidgets('Ensure bubble grid is scrollable via ScrollController',
      (WidgetTester tester) async {
    const firstBubbleKey = ValueKey('Bubble-0-0');

    final controller = ScrollController();

    // default test dimens
    const width = 800.0;
    const height = 600.0;

    tester.binding.window.physicalSizeTestValue = const Size(width, height);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    late double scrollDistance;

    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          home: PopPopGrid(
            controller: controller,
            onGridInit: (horizontalCount, verticalCount, bottomOffset) {
              debugPrint(
                  'Horizontal: $horizontalCount, vertical: $verticalCount, bottomOffset: $bottomOffset');
              scrollDistance = height;
            },
            onGenerateBubble: (sliverIndex, rowIndex) => _DummyBubble(
              size: bubbleSize,
              unpoppedKeyString: 'Bubble-$sliverIndex-$rowIndex',
              poppedKeyString: 'PoppedBubble-$sliverIndex-$rowIndex',
            ),
            bubbleSize: bubbleSize,
          ),
        ),
      ),
    );

    debugPrint('Verifying initial bubble $firstBubbleKey exists');
    expect(find.byKey(firstBubbleKey), findsOneWidget);

    /// `await`-ing this causes the test to hang, as per docs for [animateTo].
    /// Instead, just `pumpAndSettle`.
    ///
    // ignore: unawaited_futures
    controller.animateTo(controller.offset + scrollDistance,
        duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
    await tester.pumpAndSettle();

    debugPrint(
        'Verifying initial bubble $firstBubbleKey no longer exists after scrolling ${scrollDistance}px');
    expect(find.byKey(firstBubbleKey), findsNothing);

    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
  });
}

Future<void> _popBubble({
  required WidgetTester tester,
  required String bubbleKey,
}) async {
  final key = ValueKey(bubbleKey);
  debugPrint('Tapping bubble with key: ${key.toString()}');
  await tester.tap(find.byKey(key));
  await tester.pump();
}

class _DummyBubble extends StatefulWidget {
  final String unpoppedKeyString;
  final String poppedKeyString;

  final double size;

  const _DummyBubble({
    required this.size,
    required this.unpoppedKeyString,
    required this.poppedKeyString,
    Key? key,
  }) : super(key: key);

  @override
  _DummyBubbleState createState() => _DummyBubbleState();
}

class _DummyBubbleState extends State<_DummyBubble> {
  bool isPopped = false;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: widget.size,
        width: widget.size,
        child: ElevatedButton(
          key: isPopped
              ? ValueKey(widget.poppedKeyString)
              : ValueKey(widget.unpoppedKeyString),
          onPressed: () {
            setState(() => isPopped = true);
          },
          child: SizedBox(
            height: widget.size,
            width: widget.size,
          ),
        ),
      );
}
