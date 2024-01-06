import 'dart:convert';

import '../../../../models/time_sheet_model.dart';

class HomeState {
  final List<TimeSheetModel> timers;

  const HomeState({
    this.timers = const [],
  });

  int get timerCount => timers.length;

// Issue comes from here
// Let's get the why and then fix it
  // @override
  // List<Object> get props => [timers];

  Map<String, dynamic> toMap() {
    return {
      'timers': timers.map((x) => x.toMap()).toList(),
    };
  }

  factory HomeState.fromMap(Map<String, dynamic> map) {
    return HomeState(
      timers: List<TimeSheetModel>.from(
          map['timers']?.map((x) => TimeSheetModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeState.fromJson(String source) =>
      HomeState.fromMap(json.decode(source));

  HomeState copyWith({
    List<TimeSheetModel>? timers,
  }) {
    return HomeState(
      timers: timers ?? this.timers,
    );
  }
}
