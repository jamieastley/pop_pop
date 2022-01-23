import 'package:flutter/material.dart';
import 'package:pop_pop/pop_pop.dart';
import 'package:pop_pop_components/bubble_painters.dart';
import 'package:provider/provider.dart';

/// A bubble painter, state-managed via Provider's [ChangeNotifierProvider].
///
/// Internally calls `Provider.of<PopPop>`
class ProviderBubble extends StatelessWidget {
  /// Appends an identifying [String] to the end of
  /// the bubbles [ValueKey] value.
  ///
  /// Should typically be the value of the bubbles position
  /// within the game grid.
  /// ```dart
  /// String keySuffix = '0-0';
  /// ```
  final String keySuffix;

  /// Creates an encapsulated [ChangeNotifierBubble].
  ///
  /// [ChangeNotifier] is automatically handled and disposed
  /// of when the bubble no longer exists with the game grid (such
  /// as when the [ListView.builder] has scrolled down).
  const ProviderBubble({
    Key? key,
    required this.keySuffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bubbleGame = Provider.of<PopPop>(context, listen: false);

    return ChangeNotifierProvider<ChangeNotifierBubble>(
      create: (context) => ChangeNotifierBubble(),
      builder: (context, _) {
        return SizedBox(
          height: bubbleGame.bubbleTheme.size,
          child: Consumer<ChangeNotifierBubble>(
            builder: (context, value, _) {
              return GestureDetector(
                /// `onTap` is *ever* so slightly slower as it won't register
                /// the pop until the users' finger has been lifted, so capture `onTapDown`
                onTapDown: (_) {
                  if (!value.isPopped) {
                    value.popBubble();
                    bubbleGame.onBubblePopped();
                  }
                },
                child: value.isPopped
                    ? PoppedBubblePainter(
                        key: ValueKey('poppedBubble-$keySuffix'),
                        themeModel: bubbleGame.bubbleTheme,
                      )
                    : ReflectiveBubblePainter(
                        key: ValueKey('reflectiveBubble-$keySuffix'),
                        themeModel: bubbleGame.bubbleTheme,
                      ),
              );
            },
          ),
        );
      },
    );
  }
}

class ChangeNotifierBubble extends ChangeNotifier implements PopPopBubbleModel {
  bool _isPopped = false;

  @override
  bool get isPopped => _isPopped;

  ChangeNotifierBubble();

  @override
  void popBubble() {
    _isPopped = true;
    notifyListeners();
  }

  void reset() {
    _isPopped = false;
    notifyListeners();
  }
}
