part of 'sign_up_form_bloc.dart';

@immutable
abstract class SignUpFormEvent {}

class RegisterWithEmailAndPasswordPressed extends SignUpFormEvent {
  final String? email;
  final String? password;

  RegisterWithEmailAndPasswordPressed({
    required this.email,
    required this.password,
  });
}

class SignInWithEmailAndPasswordPressed extends SignUpFormEvent {
  final String? email;
  final String? password;

  SignInWithEmailAndPasswordPressed({
    required this.email,
    required this.password,
  });
}
