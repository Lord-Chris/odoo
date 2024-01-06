import '../../../../models/_models.dart';

class TimerDetailsState {
  final TimeSheetModel timeSheet;
  final Failure? error;

  const TimerDetailsState(this.timeSheet, [this.error]);

  TimerDetailsState copyWith({
    TimeSheetModel? timeSheet,
  }) {
    return TimerDetailsState(
      timeSheet ?? this.timeSheet,
    );
  }

  TimerDetailsState updateError(Failure? error) {
    return TimerDetailsState(timeSheet, error);
  }
}
