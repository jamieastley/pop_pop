/// Base abstraction class to implement across any [PopPop] implementation.
abstract class PopPopBubbleModel {
  /// State of the current [PopPopBubbleModel].
  ///
  /// Value should be set and managed internally via the
  /// chosen state-management option.
  bool get isPopped;

  /// Transforms the state of the [PopPopBubbleModel].
  ///
  /// Should also be used to hook into the [PopPop] implementation
  /// and notify that a [PopPopBubbleModel] has been popped.
  void popBubble();
}
