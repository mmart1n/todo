import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/application/auth/authbloc/auth_bloc.dart';

import 'package:todo/application/auth/signupform/sign_up_form_bloc.dart';
import 'package:todo/domain/repositories/auth_repository.dart';
import 'package:todo/infrastructure/repositories/auth_repository_impl.dart';

/// sl == service locator
final sl = GetIt.I;

Future<void> init() async {
  // state management
  sl.registerFactory(() => SignUpFormBloc(authRepository: sl()));
  sl.registerFactory(() => AuthBloc(authRepository: sl()));

  // repos
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(firebaseAuth: sl()));

  //extern
  final firebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuth);
}
