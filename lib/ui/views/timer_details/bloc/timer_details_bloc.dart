import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../models/time_sheet_model.dart';
import 'timer_details_event.dart';
import 'timer_details_state.dart';

class TimerDetailsBloc extends Bloc<TimerDetailsEvent, TimerDetailsState> {
  final TimeSheetModel timeSheet;
  TimerDetailsBloc(this.timeSheet) : super(TimerDetailsState(timeSheet)) {
    on<PausePlayTapEvent>(_onPausePlayTapEvent);
    on<StopTapEvent>(_onStopTapEvent);
    on<UpdateTimeEvent>(_onUpdateTimeEvent);
    _startTImerListener(timeSheet);
  }

  Timer? _timer;

  void _startTImerListener(TimeSheetModel timeSheet) {
    if (!timeSheet.isPaused) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        add(UpdateTimeEvent());
      });
    } else {
      _timer?.cancel();
    }
  }

  FutureOr<void> _onPausePlayTapEvent(
      PausePlayTapEvent event, Emitter<TimerDetailsState> emit) {
    var timeSheet = state.timeSheet;
    timeSheet = timeSheet.copyWith(isPaused: !timeSheet.isPaused);
    emit(state.copyWith(timeSheet: timeSheet));

    _startTImerListener(timeSheet);
  }

  FutureOr<void> _onStopTapEvent(
      StopTapEvent event, Emitter<TimerDetailsState> emit) {
    var timeSheet = state.timeSheet;
    timeSheet = timeSheet.copyWith(isPaused: true, time: Duration.zero);
    emit(state.copyWith(timeSheet: timeSheet));
  }

  @override
  Future<void> close() async {
    super.close();
    _timer?.cancel();
  }

  FutureOr<void> _onUpdateTimeEvent(
      UpdateTimeEvent event, Emitter<TimerDetailsState> emit) async {
    var timeSheet = state.timeSheet;
    if (timeSheet.time.isNegative || timeSheet.time.inSeconds == 0) {
      timeSheet = timeSheet.copyWith(time: Duration.zero);
      _timer?.cancel();
    } else if (!timeSheet.isPaused) {
      timeSheet = timeSheet.copyWith(
        time: Duration(seconds: timeSheet.time.inSeconds - 1),
      );
    }
    emit(state.copyWith(timeSheet: timeSheet));
  }
}
