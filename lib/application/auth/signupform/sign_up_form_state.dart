part of 'sign_up_form_bloc.dart';

class SignUpFormState {
  final bool isSubmitting;
  final bool showValidationMessages;

  SignUpFormState({
    required this.isSubmitting,
    required this.showValidationMessages,
  });

  SignUpFormState copyWith({
    bool? isSubmitting,
    bool? showValidationMessages,
  }) {
    return SignUpFormState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      showValidationMessages:
          showValidationMessages ?? this.showValidationMessages,
    );
  }
}
