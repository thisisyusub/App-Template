part of 'register_bloc.dart';

@immutable
class RegisterState {
  final bool isIdValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;

  bool get isFormValid => isIdValid;

  RegisterState({
    @required this.isIdValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    this.message,
  });

  factory RegisterState.empty() {
    return RegisterState(
      isIdValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory RegisterState.loading() {
    return RegisterState(
      isIdValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory RegisterState.failure([String message]) {
    return RegisterState(
      message: message,
      isIdValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }

  factory RegisterState.success() {
    return RegisterState(
      isIdValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  RegisterState update({
    bool isIdValid,
  }) {
    return copyWith(
      isIdValid: isIdValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  RegisterState copyWith({
    bool isIdValid,
    bool isSubmitEnabled,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return RegisterState(
      isIdValid: isIdValid ?? this.isIdValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  String toString() {
    return '''RegisterState {
      isIdValid: $isIdValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }
}
