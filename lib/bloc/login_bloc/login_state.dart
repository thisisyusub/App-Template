/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

part of './login_bloc.dart';

@immutable
class LoginState {
  final bool isIdValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;
  final User user;

  bool get isFormValid => isIdValid;

  LoginState({
    @required this.isIdValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    this.message,
    this.user,
  });

  factory LoginState.empty() {
    return LoginState(
      isIdValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory LoginState.loading() {
    return LoginState(
      isIdValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory LoginState.failure([String message]) {
    return LoginState(
      message: message,
      isIdValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }

  factory LoginState.success([User user]) {
    return LoginState(
      user: user,
      isIdValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  LoginState update({
    bool isIdValid,
  }) {
    return copyWith(
      isIdValid: isIdValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  LoginState copyWith({
    bool isIdValid,
    bool isSubmitEnabled,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return LoginState(
      isIdValid: isIdValid ?? this.isIdValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  String toString() {
    return '''LoginState {
      isIdValid: $isIdValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }
}
