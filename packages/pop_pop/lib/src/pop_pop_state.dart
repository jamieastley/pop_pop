abstract class PopPopState {
  const PopPopState();
}

class InitialPopPopState extends PopPopState {
  const InitialPopPopState();
}

class PopPopReadyState extends PopPopState {
  const PopPopReadyState();
}

class PopPopFinishedState extends PopPopState {
  final int totalScore;

  const PopPopFinishedState({this.totalScore = 0});
}
