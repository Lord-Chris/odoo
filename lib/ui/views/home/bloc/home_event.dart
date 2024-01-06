import '../../../../models/time_sheet_model.dart';

abstract class HomeEvent {}

class AddTimeSheetEvent extends HomeEvent {
  final TimeSheetModel timer;
  AddTimeSheetEvent(this.timer);
}

class UpdateTimeSheetEvent extends HomeEvent {
  final TimeSheetModel timer;
  UpdateTimeSheetEvent(this.timer);
}

class StartTimerEvent extends HomeEvent {
  final TimeSheetModel timer;
  StartTimerEvent(this.timer);
}

class EndTimerEvent extends HomeEvent {
  final TimeSheetModel timer;
  final Duration duration;
  EndTimerEvent(this.timer, this.duration);
}

class UpdateTimeEvent extends HomeEvent {
  final int timesheetIndex;
  final Duration duration;
  UpdateTimeEvent(this.timesheetIndex, this.duration);
}
