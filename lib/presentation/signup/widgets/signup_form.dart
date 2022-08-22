import 'package:flutter/material.dart';
import 'package:todo/presentation/signup/widgets/signin_register_button.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    // TODO: extract in separate class
    String? validateEmail(String? input) {
      const emailRegex =
          r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

      if (input == null || input.isEmpty) {
        return "Please enter email";
      } else if (RegExp(emailRegex).hasMatch(input)) {
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
        return null;
      } else {
        return "Short Password";
      }
    }

    final themeData = Theme.of(context);

    return Form(
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
            autovalidateMode: AutovalidateMode.disabled,
            cursorColor: Colors.white,
            decoration: const InputDecoration(labelText: "E-Mail"),
            validator: validateEmail,
          ),
          const SizedBox(
            height: 20, // TODO: displaySize
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.disabled,
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
              } else {
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
            callback: () {},
          ),
        ],
      ),
    );
  }
}
