import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo/core/failures/todo_failure.dart';
import 'package:todo/domain/todo/repositories/todo_repository.dart';

import '../../../domain/todo/entities/todo.dart';

part 'controller_event.dart';
part 'controller_state.dart';

class ControllerBloc extends Bloc<ControllerEvent, ControllerState> {
  final TodoRepository todoRepository;
  ControllerBloc({required this.todoRepository}) : super(ControllerInitial()) {
    on<DeleteTodoEvent>((event, emit) async {
      emit(ControllerInProgress());
      final failureOrSuccess = await todoRepository.delete(event.todo);
      failureOrSuccess.fold(
        (failure) => emit(ControllerFailure(todoFailure: failure)),
        (r) => emit(ControllerSuccess()),
      );
    });

    on<UpdateTodoEvent>((event, emit) async {
      emit(ControllerInProgress());
      final failureOrSuccess =
          await todoRepository.update(event.todo.copyWith(done: event.done));
      failureOrSuccess.fold(
        (failure) => emit(ControllerFailure(todoFailure: failure)),
        (r) => emit(ControllerSuccess()),
      );
    });
  }
}
