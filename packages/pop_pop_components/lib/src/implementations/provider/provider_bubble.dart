import 'package:flutter/material.dart';
import 'package:pop_pop/pop_pop.dart';
import 'package:provider/provider.dart';

/// A bubble painter, state-managed via Provider's [ChangeNotifierProvider].
///
/// Internally calls `Provider.of<PopPop>`
class ProviderBubble extends StatelessWidget {
  /// Sets the [Widget] for an unpopped bubble.
  ///
  /// This can either be the package-provided painter bubbles, or your own
  /// bubble widget design.
  final Widget unpoppedBubble;

  /// Sets the [Widget] for an popped bubble.
  ///
  /// This can either be the package-provided painter bubbles, or your own
  /// bubble widget design.
  final Widget poppedBubble;

  /// Creates a Provider-based bubble, encapsulating [ChangeNotifierProvider] .
  ///
  /// [ChangeNotifier] is automatically handled and disposed
  /// of when the bubble no longer exists with the game grid (such
  /// as when the [ListView.builder] has scrolled down).
  const ProviderBubble({
    Key? key,
    required this.unpoppedBubble,
    required this.poppedBubble,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final popPop = Provider.of<PopPop>(context, listen: false);

    return ChangeNotifierProvider<_ChangeNotifierBubble>(
      create: (context) => _ChangeNotifierBubble(),
      builder: (context, _) => SizedBox(
        height: popPop.bubbleTheme.size,
        child: Consumer<_ChangeNotifierBubble>(
          builder: (context, value, _) => GestureDetector(
            /// `onTap` is *ever* so slightly slower as it won't register
            /// the pop until the users' finger has been lifted, so capture `onTapDown`
            onTapDown: (_) {
              if (!value.isPopped) {
                value.popBubble();
                popPop.onBubblePopped();
              }
            },
            child: value.isPopped ? poppedBubble : unpoppedBubble,
          ),
        ),
      ),
    );
  }
}

class _ChangeNotifierBubble extends ChangeNotifier
    implements PopPopBubbleModel {
  bool _isPopped = false;

  @override
  bool get isPopped => _isPopped;

  _ChangeNotifierBubble();

  @override
  void popBubble() {
    _isPopped = true;
    notifyListeners();
  }
}
