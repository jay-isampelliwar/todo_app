import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/core/model/base_data_model.dart';
import 'package:todo_app/features/home/resources/api_repo.dart';

import '../model/todo_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeApiRepository _homeApiRepository = HomeApiRepository();
  late TodoDataModel todoDataModel;
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeTaskDeleteEvent>(homeTaskDeleteEvent);
    on<HomeTaskClickedActionEvent>(homeTaskClickedActionEvent);
    on<HomeNewTaskAddEvent>(homeNewTaskAddEvent);
    on<HomeAddTaskButtonClickedActionEvent>(
        homeAddTaskButtonClickedActionEvent);
    // on<HomeUpdatePageEvent>(homeUpdatePageEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    todoDataModel = await _homeApiRepository.getAllTask();

    if (todoDataModel.status) {
      emit(HomeLoadingSuccessState(todoList: todoDataModel.data));
      emit(HomeSuccessActionState(message: "Success"));
    } else {
      emit(HomeErrorActionState(message: "Something Went Wrong"));
    }
  }

  FutureOr<void> homeTaskClickedActionEvent(
      HomeTaskClickedActionEvent event, Emitter<HomeState> emit) {
    emit(HomeTaskClickedActionState(todo: event.todo));
  }

  FutureOr<void> homeNewTaskAddEvent(
      HomeNewTaskAddEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeTaskDeleteEvent(
      HomeTaskDeleteEvent event, Emitter<HomeState> emit) async {
    todoDataModel.data.remove(event.todo);
    emit(HomeLoadingSuccessState(todoList: todoDataModel.data));

    BaseModel baseModel =
        await _homeApiRepository.deleteTodo(event.todo.datumId);

    if (baseModel.status) {
      emit(HomeSuccessActionState(message: baseModel.message));
    } else {
      emit(HomeErrorActionState(message: baseModel.message));
      todoDataModel.data.add(event.todo);
      emit(HomeLoadingSuccessState(todoList: todoDataModel.data));
    }
  }

  FutureOr<void> homeAddTaskButtonClickedActionEvent(
      HomeAddTaskButtonClickedActionEvent event, Emitter<HomeState> emit) {
    emit(HomeAddTaskButtonClickedActionState());
  }
}
