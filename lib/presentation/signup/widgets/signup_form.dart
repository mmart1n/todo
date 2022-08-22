import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo/application/auth/signupform/sign_up_form_bloc.dart';
import 'package:todo/core/failures/auth_failure.dart';
import 'package:todo/presentation/signup/widgets/signin_register_button.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String _email;
    late String _password;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    // TODO: extract in separate class
    String? validateEmail(String? input) {
      const emailRegex =
          r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

      if (input == null || input.isEmpty) {
        return "Please enter email";
      } else if (RegExp(emailRegex).hasMatch(input)) {
        _email = input;
        return null;
      } else {
        return "Invalid email format";
      }
    }

    // TODO: extract in separate class
    String? validatePassword(String? input) {
      if (input == null || input.isEmpty) {
        return "Please enter password";
      } else if (input.length >= 6) {
        _password = input;
        return null;
      } else {
        return "Short Password";
      }
    }

    String mapFailureMessage(AuthFailure failure) {
      switch (failure.runtimeType) {
        case ServerFailure:
          return "Something went wrong! Please try again!";
        case EmailAlreadyInUseFailure:
          return "Email already in use!";
        case InvalidEmailAndPasswordCombinationFailure:
          return "Invalid email and password combination!";
        default:
          return "Something went wrong! Please try again!";
      }
    }

    final themeData = Theme.of(context);

    return BlocConsumer<SignUpFormBloc, SignUpFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () => {},
          (eitherFailureOrSuccess) => eitherFailureOrSuccess.fold(
            (failure) {
              // TODO: SnackBar showed twice!
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(microseconds: 900),
                content: Text(
                  mapFailureMessage(failure),
                  style: themeData.textTheme.bodyText1,
                ),
                backgroundColor: Colors.redAccent,
              ));
            },
            (_) => print("logged in"),
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showValidationMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(
                height: 80, // TODO: displaySize
              ),
              Text(
                "Welcome",
                style: themeData.textTheme.headline1!.copyWith(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(
                height: 20, // TODO: displaySize
              ),
              Text(
                "Please register or sign in",
                style: themeData.textTheme.headline1!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(
                height: 80, // TODO: displaySize
              ),
              TextFormField(
                cursorColor: Colors.white,
                decoration: const InputDecoration(labelText: "E-Mail"),
                validator: validateEmail,
              ),
              const SizedBox(
                height: 20, // TODO: displaySize
              ),
              TextFormField(
                cursorColor: Colors.white,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password"),
                validator: validatePassword,
              ),
              const SizedBox(
                height: 40, // TODO: displaySize
              ),
              SignInRegisterButton(
                buttonText: 'Sign in',
                callback: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<SignUpFormBloc>(context)
                        .add(SignInWithEmailAndPasswordPressed(
                      email: _email,
                      password: _password,
                    ));
                  } else {
                    BlocProvider.of<SignUpFormBloc>(context)
                        .add(SignInWithEmailAndPasswordPressed(
                      email: null,
                      password: null,
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Invalid Input",
                        style: themeData.textTheme.bodyText1,
                      ),
                      backgroundColor: Colors.redAccent,
                    ));
                  }
                },
              ),
              const SizedBox(
                height: 20, // TODO: displaySize
              ),
              SignInRegisterButton(
                buttonText: 'Register',
                callback: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<SignUpFormBloc>(context)
                        .add(RegisterWithEmailAndPasswordPressed(
                      email: _email,
                      password: _password,
                    ));
                  } else {
                    BlocProvider.of<SignUpFormBloc>(context)
                        .add(RegisterWithEmailAndPasswordPressed(
                      email: null,
                      password: null,
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: const Duration(microseconds: 900),
                      content: Text(
                        "Invalid Input",
                        style: themeData.textTheme.bodyText1,
                      ),
                      backgroundColor: Colors.redAccent,
                    ));
                  }
                },
              ),
              if (state.isSubmitting) ...[
                const SizedBox(
                  height: 10, // TODO: displaySize
                ),
                LinearProgressIndicator(
                  color: themeData.colorScheme.secondary,
                ),
              ]
            ],
          ),
        );
      },
    );
  }
}
