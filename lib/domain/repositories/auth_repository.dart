import 'package:dartz/dartz.dart';
import 'package:todo/application/auth/signupform/sign_up_form_bloc.dart';

import '../../core/failures/auth_failure.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required String email, required String password});
}
