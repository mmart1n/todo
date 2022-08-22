import 'package:todo/domain/todo/entities/todo.dart';
import 'package:todo/core/failures/todo_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:todo/domain/todo/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  @override
  Future<Either<TodoFailure, Unit>> create(Todo todo) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<TodoFailure, Unit>> delete(Todo todo) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<TodoFailure, Unit>> update(Todo todo) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<Either<TodoFailure, List<Todo>>> watchAll() {
    // TODO: implement watchAll
    throw UnimplementedError();
  }
}
