// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

enum PopPopGridMode { straight, staggered }

typedef OnGenerateBubbleWidget = Widget Function(String gridPosition);

typedef OnGridInit = void Function(
    int horizontalCount, int verticalCount, double bottomOffset);

class PopPopGrid extends StatelessWidget {
  /// Square height/width area that each bubble will draw to.
  final double bubbleSize;

  /// Determines the positioning of each bubble row.
  final PopPopGridMode gridMode;

  /// [Widget] that is rendered for each bubble.
  ///
  /// Should be responsible for managing its own state,
  /// or otherwise hook into your game state manager.
  final OnGenerateBubbleWidget onGenerateBubble;

  /// Callback to get the available grid space after initialisation.
  final OnGridInit onGridInit;

  /// Optional [ScrollController] to allow for programmatic
  /// scrolling of the infinite-generated bubble list.
  final ScrollController controller;

  /// Optional [Axis] override to allow for horizontal bubble
  /// wrap generatopm, if desired.
  final Axis scrollDirection;

  const PopPopGrid({
    Key? key,
    required this.onGenerateBubble,
    required this.controller,
    required this.onGridInit,
    this.bubbleSize = 60,
    this.gridMode = PopPopGridMode.staggered,
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print(
            'Available constraints: ${constraints.maxWidth.floor()}w : ${constraints.maxHeight.floor()}h');
        final columnChildrenCount =
            (constraints.maxHeight / bubbleSize).floor();
        final rowChildrenCount = (constraints.maxWidth / bubbleSize).floor();

        final bottomOffset =
            constraints.maxHeight - (columnChildrenCount * bubbleSize);

        onGridInit.call(
          rowChildrenCount,
          columnChildrenCount,
          bottomOffset,
        );

        return CustomScrollView(
          controller: controller,
          scrollDirection: scrollDirection,
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, listViewIndex) {
                  final bottomPaddingValue = _isFinalColumn(
                    index: listViewIndex,
                    columnChildrenCount: columnChildrenCount,
                  )
                      ? bottomOffset
                      : 0.0;

                  if (gridMode == PopPopGridMode.staggered &&
                      listViewIndex % 2 == 0) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: bottomPaddingValue),
                      child: SizedBox(
                        width: constraints.maxWidth,
                        height: bubbleSize,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List<Widget>.generate(
                            (rowChildrenCount - 1),
                            (columnIndex) =>
                                onGenerateBubble('$listViewIndex-$columnIndex'),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.only(bottom: bottomPaddingValue),
                      child: SizedBox(
                        width: constraints.maxWidth,
                        height: bubbleSize,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List<Widget>.generate(
                            rowChildrenCount,
                            (columnIndex) =>
                                onGenerateBubble('$listViewIndex-$columnIndex'),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Given that the grid uses an infinite list, depending on the device resolution
/// there may be an additional row of bubbles being clipped at the bottom.
///
/// This checks if the [ListView] is currently rendering the final row
/// we want visible and if `true`, we can add additional padding to the bottom
/// of each bubble to hide the clipped next [ListView] children.
bool _isFinalColumn({
  required int index,
  required int columnChildrenCount,
}) {
  // can't modulo by 0
  if (index == 0) {
    return false;
  } else {
    return (index + 1) % columnChildrenCount == 0;
  }
}
