import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TodoAddTaskButtonClickedActionEvent>(
        todoAddTaskButtonClickedActionEvent);
    on<TodoCloseButtonClickedActionEvent>(todoCloseButtonClickedActionEvent);
  }

  FutureOr<void> todoAddTaskButtonClickedActionEvent(
      TodoAddTaskButtonClickedActionEvent event, Emitter<TodoState> emit) {}

  FutureOr<void> todoCloseButtonClickedActionEvent(
      TodoCloseButtonClickedActionEvent event, Emitter<TodoState> emit) {}
}
