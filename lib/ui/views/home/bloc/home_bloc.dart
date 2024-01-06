import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logger/logger.dart';

import '../../../../models/time_sheet_model.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<AddTimerEvent>(_onAddTimerEvent);
    on<StartTimerEvent>(_onStartTimerEvent);
    on<EndTimerEvent>(_onEndTimerEvent);
  }

  final _log = Logger();

  @override
  void onChange(Change<HomeState> change) {
    super.onChange(change);
    print(state);
  }

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    return HomeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) {
    return state.toMap();
  }

  FutureOr<void> _onAddTimerEvent(
      AddTimerEvent event, Emitter<HomeState> emit) {
    final timers = state.timers;
    timers.add(event.timer);
    emit(state.copyWith(timers: timers));
  }

  FutureOr<void> _onStartTimerEvent(
      StartTimerEvent event, Emitter<HomeState> emit) {
    try {
      assert(event.timer.isPaused == true);
      List<TimeSheetModel> timers = state.timers;
      final index = timers.indexOf(event.timer);
      timers[index] = event.timer.copyWith(isPaused: false);
      emit(state.copyWith(timers: timers));
    } catch (e) {
      _log.e(e);
    }
  }

  FutureOr<void> _onEndTimerEvent(
      EndTimerEvent event, Emitter<HomeState> emit) {
    try {
      assert(event.timer.isPaused == false);
      List<TimeSheetModel> timers = state.timers;
      final index = timers.indexOf(event.timer);
      timers[index] = event.timer.copyWith(
        isPaused: true,
        time: event.duration,
      );
      emit(state.copyWith(timers: timers));
    } catch (e, s) {
      _log.e(s);
      _log.e(e);
    }
  }
}
