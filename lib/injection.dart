import 'package:get_it/get_it.dart';
import 'package:todo/application/auth/signupform/sign_up_form_bloc.dart';

/// sl == service locator
final sl = GetIt.I;

Future<void> init() async {
  // state management

  sl.registerFactory(() => SignUpFormBloc());
}
