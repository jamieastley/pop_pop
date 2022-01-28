import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pop_pop/pop_pop.dart';
import 'package:pop_pop_components/pop_pop_components.dart';
import 'package:pop_pop_components/provider_bubble.dart';
import 'package:provider/provider.dart';

import '../../mocks/mock_pop_pop_bloc.dart';

void main() {
  const unpoppedKey = 'unpopped';
  const poppedKey = 'popped';

  final mockBloc = MockPopPopBloc();

  setUp(() {
    when(() => mockBloc.bubbleTheme).thenReturn(const PopPopBubbleTheme());
    when(() => mockBloc.onBubblePopped()).thenReturn(null);
  });

  tearDown(() {
    reset(mockBloc);
  });

  group('ProviderBubble:', () {
    testWidgets('Verify that popped bubble widget is found when popping bubble',
        (tester) async {
      final completer = Completer<void>();
      await tester.pumpWidget(
        _TestAppWrapper(
          bloc: mockBloc,
          child: ProviderBubble(
            poppedBubble: Container(
              key: const Key(poppedKey),
              decoration: const BoxDecoration(color: Colors.blue),
              height: mockBloc.bubbleTheme.size,
              width: mockBloc.bubbleTheme.size,
            ),
            unpoppedBubble: Container(
              key: const Key(unpoppedKey),
              decoration: const BoxDecoration(color: Colors.red),
              height: mockBloc.bubbleTheme.size,
              width: mockBloc.bubbleTheme.size,
            ),
            onPopped: () => completer.complete(),
          ),
        ),
      );

      await tester.tap(find.byKey(const Key(unpoppedKey)));
      await tester.pumpAndSettle();

      expect(completer.isCompleted, isTrue);
      expect(find.byKey(const Key(poppedKey)), findsOneWidget);
      expect(find.byKey(const Key(unpoppedKey)), findsNothing);
    });
  });
}

class _TestAppWrapper extends StatelessWidget {
  final Widget child;
  final PopPopBloc bloc;

  const _TestAppWrapper({
    required this.child,
    required this.bloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Provider<PopPop>(
            create: (context) => bloc,
            child: child,
          ),
        ),
      );
}
