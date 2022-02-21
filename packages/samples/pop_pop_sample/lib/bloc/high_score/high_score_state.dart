part of 'high_score_bloc.dart';

@freezed
class HighScoreState with _$HighScoreState {
  const factory HighScoreState.empty() = _Empty;
  const factory HighScoreState.loaded(List<HighScore> highScores) = _HighScores;
}
