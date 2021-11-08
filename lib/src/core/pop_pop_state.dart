abstract class PopPopState {
  const PopPopState();
}

class InitialPopPopState extends PopPopState {
  const InitialPopPopState();
}

class PopPopReadyState extends PopPopState {
  const PopPopReadyState();
}

class GameFinishedState extends PopPopState {
  final int totalScore;

  const GameFinishedState({this.totalScore = 0});
}
