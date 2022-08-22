import 'package:dartz/dartz.dart';

import 'package:todo/core/failures/todo_failure.dart';
import 'package:todo/domain/todo/entities/todo.dart';

abstract class TodoRepository {
  Stream<Either<TodoFailure, List<Todo>>> watchAll();

  Future<Either<TodoFailure, Unit>> create(Todo todo);

  Future<Either<TodoFailure, Unit>> update(Todo todo);

  Future<Either<TodoFailure, Unit>> delete(Todo todo);
}
