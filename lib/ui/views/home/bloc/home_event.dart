import '../../../../models/time_sheet_model.dart';

abstract class HomeEvent {}

class AddTimerEvent extends HomeEvent {
  final TimeSheetModel timer;
  AddTimerEvent(this.timer);
}

class StartTimerEvent extends HomeEvent {
  TimeSheetModel timer;
  StartTimerEvent(this.timer);
}

class EndTimerEvent extends HomeEvent {
  TimeSheetModel timer;
  final Duration duration;
  EndTimerEvent(this.timer, this.duration);
}
