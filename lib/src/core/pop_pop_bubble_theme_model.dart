import 'package:flutter/material.dart';

class PopPopBubbleTheme {
  final Color gridBackgroundColor;
  final Color bubbleBaseColor;
  final Color bubbleBodyColor;
  final Color bubbleRimColor;
  final Color poppedBubbleBaseColor;
  final double size;
  final double strokeWidth;

  const PopPopBubbleTheme({
    this.gridBackgroundColor = const Color(0xFF4DD0E1),
    this.bubbleBaseColor = const Color(0xFF00ACC1),
    this.bubbleBodyColor = const Color.fromARGB(120, 255, 255, 255),
    this.bubbleRimColor = const Color(0xFFE0E0E0),
    this.poppedBubbleBaseColor = const Color(0xFF00BCD4),
    this.size = 60,
    this.strokeWidth = 4.0,
  });

  PopPopBubbleTheme copyWith({
    Color gridBackgroundColor,
    Color bubbleBaseColor,
    Color bubbleBodyColor,
    Color bubbleRimColor,
    Color poppedBubbleBaseColor,
    double size,
    double strokeWidth,
  }) {
    return PopPopBubbleTheme(
      gridBackgroundColor: gridBackgroundColor ?? this.gridBackgroundColor,
      bubbleBaseColor: bubbleBaseColor ?? this.bubbleBaseColor,
      bubbleBodyColor: bubbleBodyColor ?? this.bubbleBodyColor,
      bubbleRimColor: bubbleRimColor ?? this.bubbleRimColor,
      poppedBubbleBaseColor:
          poppedBubbleBaseColor ?? this.poppedBubbleBaseColor,
      size: size ?? this.size,
      strokeWidth: strokeWidth ?? this.strokeWidth,
    );
  }
}
