import 'package:isar/isar.dart';

part 'high_scores.g.dart';

@Collection(accessor: 'highScores')
class HighScores {
  int? id;
  @Index()
  late final int score;
  @Index()
  late final DateTime playedAt;
}
