import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import '../models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<TaskStarted>(_onStarted);
		on<AddTask>(_onAddTask);
		on<RemoveTask>(_onRemoveTask);
		on<AlterTask>(_onAlterTask);
  }

	void _onStarted(
		TaskStarted event,
		Emitter<TaskState> emit,
	) {
		if(state.status == TaskStatus.success) return;
		emit(
			state.copyWith(
				tasks: state.tasks,
				status: TaskStatus.success
			)
		);
	}

	void _onAddTask(
		AddTask event,
		Emitter<TaskState> emit,
	) {
		emit(
			state.copyWith(
				status: TaskStatus.loading
			)
		);
		try {
			List<Task> temp = [];
			temp.addAll(state.tasks);
		  temp.insert(0, event.task);
			emit(
				state.copyWith(
					tasks: temp,
					status: TaskStatus.success
				)
			);
		} catch (e) {
		  emit(
				state.copyWith(
					status: TaskStatus.error
				)
			);
		}
	}
	
	void _onRemoveTask(
		RemoveTask event,
		Emitter<TaskState> emit,
	) {
		emit(
			state.copyWith(
				status: TaskStatus.loading
			)
		);
		try {
			state.tasks.remove(event.task);
			emit(
				state.copyWith(
					tasks: state.tasks,
					status: TaskStatus.success
				)
			);
		} catch (e) {
		  emit(
				state.copyWith(
					status: TaskStatus.error
				)
			);
		}
	}

	void _onAlterTask(
		AlterTask event,
		Emitter<TaskState> emit,
	) {
		emit(
			state.copyWith(
				status: TaskStatus.loading
			)
		);
		try {
			state.tasks[event.index].isDone = !state.tasks[event.index].isDone;
			emit(
				state.copyWith(
					tasks: state.tasks,
					status: TaskStatus.success
				)
			);
		} catch (e) {
		  emit(
				state.copyWith(
					status: TaskStatus.error
				)
			);
		}
	}
	
	 @override
	 TaskState? fromJson(Map<String, dynamic> json) {
		return TaskState.fromJson(json);
	 }
	
	 @override
	 Map<String, dynamic>? toJson(TaskState state) {
		 return state.toJson();
	 }
}