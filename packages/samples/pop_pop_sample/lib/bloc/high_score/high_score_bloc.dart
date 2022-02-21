import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pop_pop_sample/domain/model/high_score.dart';

part 'high_score_bloc.freezed.dart';
part 'high_score_event.dart';
part 'high_score_state.dart';

class HighScoreBloc extends Bloc<HighScoreEvent, HighScoreState> {
  HighScoreBloc() : super(const HighScoreState.empty()) {
    on<HighScoreEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
