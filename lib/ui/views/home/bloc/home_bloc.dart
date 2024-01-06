import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logger/logger.dart';

import '../../../../models/_models.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<AddTimeSheetEvent>(_onAddTimeSheetEvent);
    on<UpdateTimeSheetEvent>(_onUpdateTimeSheetEvent);
    on<StartTimerEvent>(_onStartTimerEvent);
    on<EndTimerEvent>(_onEndTimerEvent);
    on<UpdateTimeEvent>(_onUpdateTimeEvent);
  }

  final _log = Logger();

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    return HomeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) {
    return state.toMap();
  }

  FutureOr<void> _onAddTimeSheetEvent(
      AddTimeSheetEvent event, Emitter<HomeState> emit) {
    try {
      final timers = state.timers;
      timers.add(event.timer);
      emit(state.copyWith(timers: timers));
    } catch (e) {
      _log.e(e);
      emit(state.updateError(
        const Failure(
            message: 'Something went wrong. Please contact developer!'),
      ));
    }
  }

  FutureOr<void> _onUpdateTimeSheetEvent(
      UpdateTimeSheetEvent event, Emitter<HomeState> emit) {
    try {
      final timers = state.timers;
      final index = timers.indexWhere((timer) => timer.id == event.timer.id);
      timers[index] = event.timer;
      emit(state.copyWith(timers: timers));
    } catch (e) {
      _log.e(e);
      emit(state.updateError(
        const Failure(
            message: 'Something went wrong. Please contact developer!'),
      ));
    }
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
      emit(state.updateError(
        const Failure(
            message: 'Something went wrong. Please contact developer!'),
      ));
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
    } catch (e) {
      _log.e(e);
      emit(state.updateError(
        const Failure(
            message: 'Something went wrong. Please contact developer!'),
      ));
    }
  }

  FutureOr<void> _onUpdateTimeEvent(
      UpdateTimeEvent event, Emitter<HomeState> emit) async {
    try {
      final timeSheets = state.timers;
      var timeSheet = timeSheets[event.timesheetIndex];
      if (timeSheet.time.isNegative || timeSheet.time.inSeconds == 0) {
        timeSheet = timeSheet.copyWith(time: Duration.zero, isPaused: true);
      } else if (!timeSheet.isPaused) {
        timeSheet = timeSheet.copyWith(
          time: Duration(seconds: timeSheet.time.inSeconds - 1),
        );
      }
      timeSheets[event.timesheetIndex] = timeSheet;
      emit(state.copyWith(timers: timeSheets));
    } catch (e) {
      _log.e(e);
      emit(state.updateError(
        const Failure(
            message: 'Something went wrong. Please contact developer!'),
      ));
    }
  }
}
