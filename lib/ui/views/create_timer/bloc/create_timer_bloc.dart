import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'create_timer_event.dart';
import 'create_timer_state.dart';

class CreateTimerBloc extends Bloc<CreateTimerEvent, CreateTimerState> {
  CreateTimerBloc() : super(const CreateTimerState()) {
    on<ProjectChangedEvent>(_onProjectChangedEvent);
    on<TaskChangedEvent>(_onTaskChangedEvent);
    on<DescChangedEvent>(_onDescChangedEvent);
    on<IsFavChangedEvent>(_onIsFavChangedEvent);
  }

  FutureOr<void> _onProjectChangedEvent(
      ProjectChangedEvent event, Emitter<CreateTimerState> emit) {
    emit(state.copyWith(project: event.project));
  }

  FutureOr<void> _onTaskChangedEvent(
      TaskChangedEvent event, Emitter<CreateTimerState> emit) {
    emit(state.copyWith(task: event.task));
  }

  FutureOr<void> _onDescChangedEvent(
      DescChangedEvent event, Emitter<CreateTimerState> emit) {
    emit(state.copyWith(description: event.desc));
  }

  FutureOr<void> _onIsFavChangedEvent(
      IsFavChangedEvent event, Emitter<CreateTimerState> emit) {
    emit(state.copyWith(isFav: event.isFav));
  }
}
