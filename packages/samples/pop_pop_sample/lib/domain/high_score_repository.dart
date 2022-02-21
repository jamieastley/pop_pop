import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:pop_pop_sample/domain/model/high_score.dart' as domain;
import 'package:pop_pop_sample/infrastructure/database/models/high_scores.dart';

class HighScoreRepository {
  final _isar = GetIt.I<Isar>();

  Future<void> addHighScore(int score) async {
    await _isar.writeTxn((isar) async => isar.highScores.put(
          HighScores()
            ..score = score
            ..playedAt = DateTime.now(),
        ));
  }

  Future<List<domain.HighScore>> getTopScores({int limit = 5}) async {
    final topScores =
        await _isar.highScores.where(sort: Sort.desc).limit(limit).findAll();
    return topScores
        .map((e) =>
            domain.HighScore(id: e.id!, score: e.score, playedAt: e.playedAt))
        .toList();
  }
}
