part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
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
