import '../../../../models/time_sheet_model.dart';

class TimerDetailsState {
  final TimeSheetModel timeSheet;

  const TimerDetailsState(this.timeSheet);

  TimerDetailsState copyWith({
    TimeSheetModel? timeSheet,
  }) {
    return TimerDetailsState(
      timeSheet ?? this.timeSheet,
    );
  }
}
