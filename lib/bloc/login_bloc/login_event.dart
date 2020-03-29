part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class IdChanged extends LoginEvent {
  final String id;

  const IdChanged({@required this.id});

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'IdChanged { id :$id }';
}

class LoginClicked extends LoginEvent {
  final String id;

  const LoginClicked({
    @required this.id,
  });

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return 'Submitted { email: $id}';
  }
}
