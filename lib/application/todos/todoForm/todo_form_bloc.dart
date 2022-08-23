import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo/core/failures/todo_failure.dart';
import 'package:todo/domain/todo/entities/todo.dart';
import 'package:todo/domain/todo/repositories/todo_repository.dart';

part 'todo_form_event.dart';
part 'todo_form_state.dart';

class TodoFormBloc extends Bloc<TodoFormEvent, TodoFormState> {
  final TodoRepository todoRepository;

  TodoFormBloc({required this.todoRepository})
      : super(TodoFormState.initial()) {
    on<InitializeTodoDetailPage>((event, emit) {
      if (event.todo != null) {
        emit(state.copyWith(todo: event.todo, isEditing: true));
      } else {
        emit(state);
      }
    });
  }
}
