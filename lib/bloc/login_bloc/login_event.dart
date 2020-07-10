/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

part of './login_bloc.dart';

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
