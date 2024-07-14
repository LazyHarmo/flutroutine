part of 'task_bloc.dart';

class TaskState extends Equatable{

   final List<Task> tasks;


   const TaskState({
    this.tasks = const [],
   });

   TaskState copyWith({List<Task>? tasks}){
    return TaskState(tasks: tasks?? this.tasks);
   }

  @override
  List<Object?> get props => [tasks];
}

final class TaskInitial extends TaskState {}