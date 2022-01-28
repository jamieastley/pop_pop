import 'package:flutter/material.dart';
import 'package:pop_pop/pop_pop.dart';

/// Creates a [CustomPainter] to paint the effect of a popped bubble
class PoppedBubblePainter extends StatelessWidget {
  /// Supplies the [CustomPainter] with the [Color]
  /// properties required to style the bubble.
  final PopPopBubbleTheme themeModel;

  // coverage:ignore-start
  /// Creates a [PoppedBubblePainter].
  ///
  /// Internally calculates and paints the dimensions of a popped bubble from
  /// the given `themeModel.size`.
  const PoppedBubblePainter({
    Key? key,
    required this.themeModel,
  }) : super(key: key);
  // coverage:ignore-end

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(themeModel.size, themeModel.size),
      painter: _Painter(themeModel: themeModel),
    );
  }
}

class _Painter extends CustomPainter {
  final PopPopBubbleTheme themeModel;

  const _Painter({required this.themeModel});

  @override
  void paint(Canvas canvas, Size size) {
    final painterSize = (size.height * 0.85) - themeModel.strokeWidth;

    final center = size.center(Offset.zero);
    final offset = size.height * 0.05;

    // ? base bubble layer
    canvas.drawCircle(
      Offset(center.dx, (center.dy + offset)),
      painterSize / 1.95,
      Paint()
        ..color = themeModel.bubbleBaseColor.withOpacity(0.4)
        ..strokeWidth = themeModel.strokeWidth
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.fill,
    );

    // ? base bubble border
    canvas.drawCircle(
      Offset(center.dx, (center.dy + offset)),
      painterSize / 1.95,
      Paint()
        ..color = themeModel.bubbleBaseColor
        ..strokeWidth = themeModel.strokeWidth
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke,
    );

    // ? Circular rim layer
    canvas.drawCircle(
      Offset(center.dx, (center.dy + offset)),
      painterSize / 2,
      Paint()
        ..color = themeModel.bubbleBaseColor
        ..strokeWidth = (size.height / 10)
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke,
    );
  }

  // coverage:ignore-start
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
  // coverage:ignore-end
}
