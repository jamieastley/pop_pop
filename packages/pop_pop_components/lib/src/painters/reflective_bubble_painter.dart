import 'package:flutter/material.dart';
import 'package:pop_pop/pop_pop.dart';
import 'package:pop_pop_components/src/utils/pop_pop_utils.dart';

/// Creates a [CustomPainter] to paint the effect of a bubble
/// with parallel reflective effects .
class ReflectiveBubblePainter extends StatelessWidget {
  @visibleForTesting
  static const String keyPrefix = 'Bubble';

  /// Supplies the [CustomPainter] with the [Color]
  /// properties required to style the bubble.
  final PopPopBubbleTheme themeModel;

  /// Creates a [ReflectiveBubblePainter].
  ///
  /// Internally calculates and paints the dimensions of an unpopped bubble from
  /// the given `themeModel.size`, creating a parallel reflective effect
  /// on the top layer of the bubble.
  const ReflectiveBubblePainter({
    Key? key,
    required this.themeModel,
  }) : super(key: key);

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
    final painterSize = (size.height * 0.9) - themeModel.strokeWidth;

    final center = size.center(Offset.zero);
    final offset = size.height * 0.05;

    // base bubble layer
    canvas.drawCircle(
      Offset(center.dx + offset, (center.dy + offset)),
      painterSize / 2,
      Paint()
        ..color = themeModel.bubbleBaseColor
        ..strokeWidth = themeModel.strokeWidth
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.fill,
    );

    // middle, semi-transparent bubble body
    canvas.drawCircle(
      Offset(center.dx, (center.dy - offset)),
      painterSize / 2,
      Paint()
        ..color = themeModel.bubbleBodyColor
        ..strokeWidth = themeModel.strokeWidth
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.fill,
    );

    // top bubble layer - outer rim
    canvas.drawCircle(
      Offset(center.dx, (center.dy - offset)),
      painterSize / 2,
      Paint()
        ..color = themeModel.bubbleRimColor
        ..strokeWidth = themeModel.strokeWidth
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke,
    );

    // bottom-right reflection
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(center.dx, (center.dy - offset)),
        radius: size.height / 3.2,
      ),
      degToRad(15),
      degToRad(70),
      false,
      Paint()
        ..color = themeModel.bubbleRimColor
        ..strokeWidth = themeModel.strokeWidth
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke,
    );

    // top-left reflection
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(center.dx, (center.dy - offset)),
        radius: size.height / 3.2,
      ),
      degToRad(190),
      degToRad(70),
      false,
      Paint()
        ..color = themeModel.bubbleRimColor
        ..strokeWidth = themeModel.strokeWidth
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke,
    );
  }

// coverage:ignore-start
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
  // coverage:ignore-end
}
