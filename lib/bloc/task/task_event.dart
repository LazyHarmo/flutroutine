part of 'task_bloc.dart';


class TaskEvent extends Equatable{
  const TaskEvent();
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class AddEvent extends TaskEvent{
  final String taskname;
  final String taskdesc;
  const AddEvent({
    required this.taskname,
    required this.taskdesc
    });
    @override
    List<Object?> get props => [taskname,taskdesc];
}

class DelEvent extends TaskEvent{
    final int index;
  const DelEvent({
    required this.index,

    });
    @override
    List<Object?> get props => [index];

}