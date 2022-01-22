import 'package:flutter/material.dart';

class PopPopBubbleTheme {
  /// Defines the background [Color] of the game grid.
  final Color gridBackgroundColor;

  /// Defines the bottom base [Color] of each unpopped bubble.
  final Color bubbleBaseColor;

  /// Defines the body [Color] of an unpopped bubble.
  final Color bubbleBodyColor;

  /// Defines the outer rim [Color] of the bubble.
  final Color bubbleRimColor;

  /// Defines the fill [Color] of a popped bubble.
  final Color poppedBubbleBaseColor;

  /// Defines the square size that the bubble should be painted to.
  final double size;

  /// Defines the bubbles outer rim stroke width.
  final double strokeWidth;

  /// Creates a [PopPopBubbleTheme].
  ///
  /// The theme defines the colour scheme of various parts of the game.
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
    Color? gridBackgroundColor,
    Color? bubbleBaseColor,
    Color? bubbleBodyColor,
    Color? bubbleRimColor,
    Color? poppedBubbleBaseColor,
    double? size,
    double? strokeWidth,
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
