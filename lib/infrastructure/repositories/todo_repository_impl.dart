import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/domain/todo/entities/todo.dart';
import 'package:todo/core/failures/todo_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:todo/domain/todo/repositories/todo_repository.dart';
import 'package:todo/infrastructure/extensions/firebase_helpers.dart';

import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final FirebaseFirestore firestore;

  TodoRepositoryImpl({required this.firestore});

  @override
  Future<Either<TodoFailure, Unit>> create(Todo todo) async {
    try {
      final userDoc = await firestore.userDocument();
      final todoModel = TodoModel.fromDomain(todo);

      await userDoc.todoCollection.doc(todoModel.id).set(todoModel.toMap());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code.contains("permission-denied") ||
          e.code.contains("PERMISSION_DENIED")) {
        return left(InsufficientPermissions());
      } else {
        return left(UnexpectedFailure());
      }
    }
  }

  @override
  Future<Either<TodoFailure, Unit>> update(Todo todo) async {
    try {
      final userDoc = await firestore.userDocument();
      final todoModel = TodoModel.fromDomain(todo);

      await userDoc.todoCollection.doc(todoModel.id).update(todoModel.toMap());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code.contains("permission-denied") ||
          e.code.contains("PERMISSION_DENIED")) {
        // NOT_FOUND as well
        return left(InsufficientPermissions());
      } else {
        return left(UnexpectedFailure());
      }
    }
  }

  @override
  Future<Either<TodoFailure, Unit>> delete(Todo todo) async {
    try {
      final userDoc = await firestore.userDocument();
      final todoModel = TodoModel.fromDomain(todo);

      await userDoc.todoCollection.doc(todoModel.id).delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code.contains("permission-denied") ||
          e.code.contains("PERMISSION_DENIED")) {
        // NOT_FOUND as well - if not found we can delete the record from the UI thus it is not in the back end as well
        return left(InsufficientPermissions());
      } else {
        return left(UnexpectedFailure());
      }
    }
  }

  /// async* - we can emit data in the stream
  @override
  Stream<Either<TodoFailure, List<Todo>>> watchAll() async* {
    final userDoc = await firestore.userDocument();

    // right side (listen on todos)
    yield* userDoc.todoCollection
        .snapshots()
        .map((snapshot) => right<TodoFailure, List<Todo>>(snapshot.docs
            .map((doc) => TodoModel.fromFirestore(doc).toDomain())
            .toList()))
        // error handling (left side)
        .handleError((e) {
      if (e is FirebaseException) {
        if (e.code.contains("permission-denied") ||
            e.code.contains("PERMISSION_DENIED")) {
          return left(InsufficientPermissions());
        } else {
          return left(UnexpectedFailure());
        }
      } else {
        return left(UnexpectedFailure());
      }
    });
  }
}
