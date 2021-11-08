import 'package:flutter/material.dart';
import 'package:pop_pop/src/core/pop_pop_bubble_theme_model.dart';

/// Creates a [CustomPainter] to paint the effect of a popped bubble
class PoppedBubblePainter extends StatelessWidget {
  static const String keyPrefix = 'PoppedBubble';

  /// Supplies the [CustomPainter] with the [Color]
  /// properties required to style the bubble.
  final PopPopBubbleTheme themeModel;

  const PoppedBubblePainter({
    Key key,
    @required this.themeModel,
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

  const _Painter({@required this.themeModel});

  @override
  void paint(Canvas canvas, Size size) {
    var painterSize = (size.height * 0.85) - themeModel.strokeWidth;

    var center = size.center(Offset.zero);
    var offset = size.height * 0.05;

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
        ..color = themeModel.bubbleBaseColor //.lighten(percent: 20)
        ..strokeWidth = themeModel.strokeWidth
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke,
    );

    // ? Circular rim layer
    canvas.drawCircle(
      Offset(center.dx, (center.dy + offset)),
      painterSize / 2,
      Paint()
        ..color = themeModel.bubbleBaseColor //.lighten(percent: 12)
        ..strokeWidth = (size.height / 10)
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
