import 'package:freezed_annotation/freezed_annotation.dart';

part 'high_score.freezed.dart';

@freezed
class HighScore with _$HighScore {
  const factory HighScore({
    required int id,
    required int score,
    required DateTime playedAt,
  }) = _HighScore;

  const HighScore._();
}
