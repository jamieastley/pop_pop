import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pop_pop/pop_pop.dart';
import 'package:pop_pop_components/bubble_painters.dart';
import 'package:pop_pop_components/pop_pop_components.dart';
import 'package:pop_pop_components/provider_bubble.dart';
import 'package:provider/provider.dart';

class Game extends StatefulWidget {
  static const routeName = 'game';
  static const routePath = 'game';

  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late final ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<PopPopBloc>(
      create: (context) => PopPopBloc(
        onAllPopped: (scrollDistance) {
          if (controller.hasClients) {
            controller.animateTo(
              controller.offset + scrollDistance,
              duration: const Duration(milliseconds: 300),
              curve: Curves.decelerate,
            );
          }
        },
        audioPlayer: GetIt.I<PopPopAudio>(),
        timer: GetIt.I<PopPopTimer<int>>(),
      ),
      child: _PopPopView(controller: controller),
      dispose: (context, value) => value.dispose(),
    );
  }
}

class _PopPopView extends StatelessWidget {
  final ScrollController controller;

  const _PopPopView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final popPop = Provider.of<PopPopBloc>(context);

    return Scaffold(
      body: StreamBuilder(
        stream: popPop.gameStateStream,
        builder: (context, snapshot) {
          if (snapshot.data is InitialPopPopState) {
            popPop.startGame();
          } else if (snapshot.data is PopPopReadyState) {
            return _BuildGameReadyState(
              popPop: popPop,
              controller: controller,
            );
          } else if (snapshot.data is PopPopFinishedState) {
            final state = (snapshot.data as PopPopFinishedState);
            return _BuildFinishedState(totalScore: state.totalScore);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _BuildGameReadyState extends StatelessWidget {
  final PopPopBloc popPop;
  final ScrollController controller;
  const _BuildGameReadyState({
    Key? key,
    required this.popPop,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 50,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                    child: StreamBuilder<int>(
                      stream: popPop.timer!.countdownTimerStream,
                      initialData: 0,
                      builder: (context, snapshot) => Text(
                        snapshot.data!.toFormattedTimeString(),
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 30,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 16.0),
                    child: StreamBuilder(
                      stream: popPop.currentScoreStream,
                      initialData: 0,
                      builder: (context, score) => Text(
                        '${score.data}',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 30,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SafeArea(
              child: PopPopGrid(
                onGridInit: (horizontalCount, verticalCount, bottomOffset) =>
                    popPop.cacheGameSizes(
                  horizontalCount: horizontalCount,
                  verticalCount: verticalCount,
                  bottomOffset: bottomOffset,
                ),
                controller: controller,
                onGenerateBubble: (sliverIndex, rowIndex) => ProviderBubble(
                  poppedBubble: PoppedBubblePainter(
                    key: ValueKey('poppedBubble-$sliverIndex-$rowIndex'),
                    themeModel: popPop.bubbleTheme.copyWith(),
                  ),
                  unpoppedBubble: ReflectiveBubblePainter(
                    key: ValueKey('reflectiveBubble-$sliverIndex-$rowIndex'),
                    themeModel: popPop.bubbleTheme.copyWith(
                      bubbleBaseColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.7),
                      bubbleBodyColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  bubbleTheme: popPop.bubbleTheme,
                  onPopped: () => popPop.onBubblePopped(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildFinishedState extends StatelessWidget {
  final int totalScore;
  const _BuildFinishedState({
    Key? key,
    required this.totalScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text(
                        'You popped $totalScore bubbles!',
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      child: const Text('Play again'),
                      onPressed: () {
                        Provider.of<PopPopBloc>(context, listen: false)
                            .restartGame();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
