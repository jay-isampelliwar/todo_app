import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TodoDateCardButtonClickedActionEvent>(
        todoDateCardButtonClickedActionEvent);
    on<TodoTimeCardButtonClickedActionEvent>(
        todoTimeCardButtonClickedActionEvent);

    on<TodoBusinessChipSelectEvent>(todoBusinessChipSelectEvent);
    on<TodoPersonalChipSelectEvent>(todoPersonalChipSelectEvent);
    on<TodoUrgentChipSelectEvent>(todoUrgentChipSelectEvent);
    on<TodoAddTaskButtonClickedActionEvent>(
        todoAddTaskButtonClickedActionEvent);
    on<TodoCloseButtonClickedActionEvent>(todoCloseButtonClickedActionEvent);
  }

  FutureOr<void> todoDateCardButtonClickedActionEvent(
      TodoDateCardButtonClickedActionEvent event, Emitter<TodoState> emit) {}

  FutureOr<void> todoTimeCardButtonClickedActionEvent(
      TodoTimeCardButtonClickedActionEvent event, Emitter<TodoState> emit) {}

  FutureOr<void> todoBusinessChipSelectEvent(
      TodoBusinessChipSelectEvent event, Emitter<TodoState> emit) {}

  FutureOr<void> todoPersonalChipSelectEvent(
      TodoPersonalChipSelectEvent event, Emitter<TodoState> emit) {}
  FutureOr<void> todoUrgentChipSelectEvent(
      TodoUrgentChipSelectEvent event, Emitter<TodoState> emit) {}

  FutureOr<void> todoAddTaskButtonClickedActionEvent(
      TodoAddTaskButtonClickedActionEvent event, Emitter<TodoState> emit) {}

  FutureOr<void> todoCloseButtonClickedActionEvent(
      TodoCloseButtonClickedActionEvent event, Emitter<TodoState> emit) {}
}
