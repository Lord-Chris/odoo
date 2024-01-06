import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../../models/time_sheet_model.dart';

class CreateTimerState extends Equatable {
  final String? project;
  final String? task;
  final String description;
  final bool isFav;

  const CreateTimerState({
    this.project,
    this.task,
    this.description = '',
    this.isFav = false,
  });

  @override
  List<Object?> get props => [project, task, description, isFav];

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

  Map<String, dynamic> toMap() {
    return {
      'project': project,
      'task': task,
      'description': description,
      'is_fav': isFav,
    };
  }

  factory CreateTimerState.fromMap(Map<String, dynamic> map) {
    return CreateTimerState(
      project: map['project'],
      task: map['task'],
      description: map['description'] ?? '',
      isFav: map['is_fav'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateTimerState.fromJson(String source) =>
      CreateTimerState.fromMap(json.decode(source));

  TimeSheetModel toTimerModel() {
    return TimeSheetModel(
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
