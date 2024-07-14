import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutroutine/model/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final List<String> taskname = [];
  TaskBloc() : super(TaskState()) {
    on<AddEvent>(_add);
    on<DelEvent>(_delete);

  }

  void _add(AddEvent event,Emitter<TaskState>emit){
    final newTask = Task(taskname: event.taskname, taskdesc: event.taskdesc);
    final updatedTask = List<Task>.from(state.tasks)..add(newTask);
    emit(state.copyWith(tasks: updatedTask));
  }

  void _delete(DelEvent event,Emitter<TaskState>emit){
    final updatedTask = List<Task>.from(state.tasks)..removeAt(event.index);
    emit(state.copyWith(tasks: updatedTask));
  }


}