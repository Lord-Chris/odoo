import 'dart:convert';

import '../../../../models/_models.dart';

class HomeState {
  final List<TimeSheetModel> timers;
  final Failure? error;

  const HomeState({
    this.timers = const [],
    this.error,
  });

  int get timerCount => timers.length;

  Map<String, dynamic> toMap() {
    return {
      'timers': timers.map((x) => x.toMap()).toList(),
      'error': error?.toMap(),
    };
  }

  factory HomeState.fromMap(Map<String, dynamic> map) {
    return HomeState(
      timers: List<TimeSheetModel>.from(
          map['timers']?.map((x) => TimeSheetModel.fromMap(x))),
      error: map['error'] != null ? Failure.fromMap(map['error']) : null,
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
      error: null,
    );
  }

  HomeState updateError(Failure? error) {
    return HomeState(
      timers: timers,
      error: error,
    );
  }
}
