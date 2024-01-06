import 'dart:convert';

import 'package:uuid/uuid.dart';

import '../../../../models/_models.dart';

class CreateTimerState {
  final String? project;
  final String? task;
  final String description;
  final bool isFav;
  final Failure? error;

  const CreateTimerState({
    this.project,
    this.task,
    this.description = '',
    this.isFav = false,
    this.error,
  });

  CreateTimerState copyWith({
    String? project,
    String? task,
    String? description,
    bool? isFav,
  }) {
    return CreateTimerState(
      project: project ?? this.project,
      task: task ?? this.task,
      description: description ?? this.description,
      isFav: isFav ?? this.isFav,
    );
  }

  CreateTimerState updateError(Failure? error) {
    return CreateTimerState(
      project: project,
      task: task,
      description: description,
      isFav: isFav,
      error: error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'project': project,
      'task': task,
      'description': description,
      'is_fav': isFav,
      'error': error?.toMap(),
    };
  }

  factory CreateTimerState.fromMap(Map<String, dynamic> map) {
    return CreateTimerState(
      project: map['project'],
      task: map['task'],
      description: map['description'] ?? '',
      isFav: map['is_fav'] ?? false,
      error: map['error'] != null ? Failure.fromMap(map['error']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateTimerState.fromJson(String source) =>
      CreateTimerState.fromMap(json.decode(source));

  TimeSheetModel toTimerModel() {
    return TimeSheetModel(
      id: const Uuid().v4(),
      project: project ?? '',
      description: description,
      task: task ?? '',
      deadline: DateTime.now().add(const Duration(days: 2)),
      assignee: 'Ivan Zhuikov',
      isFavorite: isFav,
      time: const Duration(minutes: 10),
    );
  }
}
