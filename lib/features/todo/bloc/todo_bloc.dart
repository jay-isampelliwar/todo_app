import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/features/home/resources/api_repo.dart';

import '../../../core/model/base_data_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final HomeApiRepository _homeApiRepository = HomeApiRepository();
  TodoBloc() : super(TodoInitial()) {
    on<TodoAddTaskButtonClickedActionEvent>(
        todoAddTaskButtonClickedActionEvent);
    on<TodoCloseButtonClickedActionEvent>(todoCloseButtonClickedActionEvent);
    on<TodoUpdateTaskButtonClickedActionEvent>(
        todoUpdateButtonClickedActionEvent);
  }

  FutureOr<void> todoAddTaskButtonClickedActionEvent(
      TodoAddTaskButtonClickedActionEvent event,
      Emitter<TodoState> emit) async {
    emit(TodoButtonLoadingState());
    BaseModel baseModel = await _homeApiRepository.createTodo(event.title);

    if (baseModel.status) {
      emit(TodoSuccessActionState(message: baseModel.message));
      emit(TodoInitial());
      emit(TodoUpdateActionState());
    } else {
      emit(TodoErrorActionState(message: baseModel.message));
    }
  }

  FutureOr<void> todoCloseButtonClickedActionEvent(
      TodoCloseButtonClickedActionEvent event, Emitter<TodoState> emit) {
    emit(TodoCloseButtonClickedActionState());
  }

  FutureOr<void> todoUpdateButtonClickedActionEvent(
      TodoUpdateTaskButtonClickedActionEvent event,
      Emitter<TodoState> emit) async {
    emit(TodoButtonLoadingState());
    BaseModel baseModel =
        await _homeApiRepository.updateTodo(event.title, event.id);

    if (baseModel.status) {
      emit(TodoSuccessActionState(message: baseModel.message));
      emit(TodoInitial());
      emit(TodoUpdateActionState());
    } else {
      emit(TodoErrorActionState(message: baseModel.message));
    }
  }
}
