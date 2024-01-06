import 'dart:convert';

import 'package:equatable/equatable.dart';

class TimeSheetModel extends Equatable {
  final String project;
  final String task;
  final String description;
  final DateTime deadline;
  final String assignee;
  final bool isFavorite;
  final Duration time;
  final bool isPaused;

  const TimeSheetModel({
    required this.project,
    required this.task,
    required this.description,
    required this.deadline,
    required this.assignee,
    required this.isFavorite,
    required this.time,
    this.isPaused = true,
  });

  TimeSheetModel copyWith({
    String? project,
    String? task,
    String? description,
    DateTime? deadline,
    String? assignee,
    bool? isFavorite,
    Duration? time,
    bool? isPaused,
  }) {
    return TimeSheetModel(
      project: project ?? this.project,
      task: task ?? this.task,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      assignee: assignee ?? this.assignee,
      isFavorite: isFavorite ?? this.isFavorite,
      time: time ?? this.time,
      isPaused: isPaused ?? this.isPaused,
    );
  }

  @override
  List<Object> get props {
    return [
      project,
      task,
      description,
      assignee,
      isFavorite,
      isPaused,
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'project': project,
      'task': task,
      'description': description,
      'deadline': deadline.millisecondsSinceEpoch,
      'assignee': assignee,
      'is_favorite': isFavorite,
      'time': time.inSeconds,
      'is_paused': isPaused,
    };
  }

  factory TimeSheetModel.fromMap(Map<String, dynamic> map) {
    return TimeSheetModel(
      project: map['project'] ?? '',
      task: map['task'] ?? '',
      description: map['description'] ?? '',
      deadline: DateTime.fromMillisecondsSinceEpoch(map['deadline']),
      assignee: map['assignee'] ?? '',
      isFavorite: map['is_favorite'] ?? false,
      time: Duration(seconds: map['time']),
      isPaused: map['is_paused'] ?? true,
    );
  }

  String toJson() => json.encode(toMap());

  factory TimeSheetModel.fromJson(String source) =>
      TimeSheetModel.fromMap(json.decode(source));
}
