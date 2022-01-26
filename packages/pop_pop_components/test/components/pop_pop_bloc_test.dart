import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pop_pop/pop_pop.dart';
import 'package:pop_pop_components/src/components/pop_pop_bloc.dart';

class MockTimer extends Mock implements PopPopTimer<int> {}

class MockAudio extends Mock implements PopPopAudio {}

void main() {
  late PopPopBloc bloc;
  final PopPopTimer<int> timer = MockTimer();
  final PopPopAudio audioPlayer = MockAudio();

  setUp(() {
    when(() => timer.startTimer()).thenReturn(null);
    when(() => timer.pauseTimer()).thenReturn(null);
    when(() => timer.countdownTimerStream)
        .thenAnswer((_) => Stream<int>.fromIterable([3, 2, 1, 0]));
  });

  tearDown(() {
    bloc.dispose();
    reset(timer);
    reset(audioPlayer);
  });

  group('BubblePopBloc:', () {
    test('Validate score increments and audio invocation on pop', () async {
      bloc = PopPopBloc(
        loggingEnabled: true,
        timer: timer,
        audioPlayer: audioPlayer,
        onAllPopped: (scrollDistance) {},
      )..cacheGameSizes(
          horizontalCount: 5,
          verticalCount: 5,
          bottomOffset: 0,
          isStaggered: true,
        );

      await expectLater(bloc.currentScoreStream, emits(0));
      for (var i = 0; i < 3; i++) {
        bloc.onBubblePopped();
        verify(() =>
                audioPlayer.playSoundEffect(filePath: any(named: 'filePath')))
            .called(1);
        await expectLater(bloc.currentScoreStream, emits(i + 1));
      }
      verifyNoMoreInteractions(audioPlayer);
    });

    test('Emits correct states when starting game', () async {
      bloc = PopPopBloc(
        loggingEnabled: true,
        timer: timer,
        audioPlayer: audioPlayer,
        onAllPopped: (scrollDistance) {},
      )..cacheGameSizes(
          horizontalCount: 5,
          verticalCount: 5,
          bottomOffset: 0,
          isStaggered: true,
        );

      // ignore: unawaited_futures
      expectLater(
          bloc.gameStateStream,
          emitsInOrder(<Matcher>[
            isInstanceOf<InitialPopPopState>(),
            isInstanceOf<PopPopReadyState>(),
            isInstanceOf<PopPopReadyState>(), //restart event
          ]));

      bloc.startGame();
      bloc.restartGame();
    });

    test('Verify game dimensions when isStaggered is true', () async {
      bloc = PopPopBloc(
        loggingEnabled: true,
        timer: timer,
        audioPlayer: audioPlayer,
        onAllPopped: (scrollDistance) {},
      )..cacheGameSizes(
          horizontalCount: 5,
          verticalCount: 5,
          bottomOffset: 0,
          isStaggered: true,
        );

      debugPrint('Verifying 5 * 5 grid, with offset totals 23 bubbles');
      expect(bloc.gridSize, equals(22));

      debugPrint('Verifying 5 * column children height sets screenHeight');
      expect(bloc.scrollOffset, equals(300.0));
    });

    test('Verify game dimensions when isStaggered is false', () async {
      bloc = PopPopBloc(
        loggingEnabled: true,
        timer: timer,
        audioPlayer: audioPlayer,
        onAllPopped: (scrollDistance) {},
      )..cacheGameSizes(
          horizontalCount: 5,
          verticalCount: 5,
          bottomOffset: 0,
          isStaggered: false,
        );

      expect(bloc.gridSize, equals(25));
      expect(bloc.scrollOffset, equals(300.0));
    });
  });
}
