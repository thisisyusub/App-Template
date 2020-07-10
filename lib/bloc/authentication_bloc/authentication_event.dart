/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

part of './authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'Authentication: AppStarted';
}

class LoggedIn extends AuthenticationEvent {
  final User user;

  LoggedIn(this.user) : assert(user != null);

  @override
  List<Object> get props => [user];
}

class LoggedOut extends AuthenticationEvent {}
