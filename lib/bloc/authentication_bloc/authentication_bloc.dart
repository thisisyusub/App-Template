/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../contractors/impl_user_repository.dart';
import '../../data/model/user.dart';
import '../../data/service/shared_preference_service.dart';

part './authentication_event.dart';

part './authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({@required this.userRepository}) : super(Uninitialized());

  final IUserRepository userRepository;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final userLogged = (await SharedPreferencesService.instance).isUserLogged;
      if (userLogged != null) {
        // TODO: Change this part
        if (userLogged) {
          yield Authenticated(User(
            username: 'Kanan Yusubov',
            name: 'Kanan',
            email: 'kanan.yusubov@gmail.com',
            id: 1,
          ));
        } else {
          yield Unauthenticated();
        }
      } else {
        yield Unauthenticated();
      }
    } else if (event is LoggedIn) {
      (await SharedPreferencesService.instance).setUserLogInfo(true);
      yield Authenticated(event.user);
    } else if (event is LoggedOut) {
      (await SharedPreferencesService.instance).setUserLogInfo(false);
      yield Unauthenticated();
    }
  }
}
