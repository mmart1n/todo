import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/application/auth/authbloc/auth_bloc.dart';

import 'package:todo/application/auth/signupform/sign_up_form_bloc.dart';
import 'package:todo/application/todos/observer/observer_bloc.dart';
import 'package:todo/domain/auth/repositories/auth_repository.dart';
import 'package:todo/domain/todo/repositories/todo_repository.dart';
import 'package:todo/infrastructure/repositories/auth_repository_impl.dart';
import 'package:todo/infrastructure/repositories/todo_repository_impl.dart';

/// sl == service locator
final sl = GetIt.I;

Future<void> init() async {
  // ##### auth ######
  // state management
  sl.registerFactory(() => SignUpFormBloc(authRepository: sl()));
  sl.registerFactory(() => AuthBloc(authRepository: sl()));

  // repos
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(firebaseAuth: sl()));

  //extern
  final firebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuth);

  // ##### todo #####

  // state management
  sl.registerFactory(() => ObserverBloc(
      todoRepository:
          sl())); // factory -> generiert new instance every time; every time we go on the home page we want to emit the initial event

  // repos
  sl.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(firestore: sl()));

  // extern
  final firestore = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firestore);
}
