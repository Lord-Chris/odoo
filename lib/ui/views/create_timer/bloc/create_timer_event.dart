abstract class CreateTimerEvent {}

class ProjectChangedEvent extends CreateTimerEvent {
  final String? project;
  ProjectChangedEvent(this.project);
}

class TaskChangedEvent extends CreateTimerEvent {
  final String? task;
  TaskChangedEvent(this.task);
}

class DescChangedEvent extends CreateTimerEvent {
  final String desc;
  DescChangedEvent(this.desc);
}

class IsFavChangedEvent extends CreateTimerEvent {
  final bool? isFav;
  IsFavChangedEvent(this.isFav);
}
