part of 'high_score_bloc.dart';

@freezed
class HighScoreEvent with _$HighScoreEvent {
  const factory HighScoreEvent.getTopScores(int? limit) = _GetTop;
  const factory HighScoreEvent.addScore(int score) = _AddScore;
}
