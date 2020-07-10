/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../contractors/impl_user_repository.dart';
import '../../data/model/user.dart';
import '../../utils/exceptions/exceptions.dart';
import '../../utils/validators/validators.dart';

part './login_event.dart';
part './login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({@required this.userRepository}) : super(LoginState.empty());

  final IUserRepository userRepository;

  // @override
  // Stream<LoginState> transform(
  //   Stream<LoginEvent> events,
  //   Stream<LoginState> Function(LoginEvent event) next,
  // ) {
  //   final nonDebounceStream = events.where((event) {
  //     return (event is! IdChanged);
  //   });

  //   final debounceStream = events.where((event) {
  //     return (event is IdChanged);
  //   }).debounceTime(Duration(milliseconds: 300));

  //   return super.transform(
  //     nonDebounceStream.mergeWith([debounceStream]),
  //     next,
  //   );
  // }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is IdChanged) {
      yield* _mapIdChangedToState(event.id);
    } else if (event is LoginClicked) {
      yield* _mapLoginClickedToState(event.id);
    }
  }

  /// method works when the id is changed
  Stream<LoginState> _mapIdChangedToState(String id) async* {
    yield state.update(isIdValid: Validators.isValidId(id));
  }

  /// method works when login button is clicked
  Stream<LoginState> _mapLoginClickedToState(String id) async* {
    yield LoginState.loading();
    try {
      final user = await userRepository.login(id);
      yield LoginState.success(user);
    } on UserNotFoundException catch (e) {
      print('user in not found exception');
      print(e.toString());
      yield LoginState.failure(e.toString());
    } on HttpException catch (e) {
      print('user in not http exception');
      yield LoginState.failure(e.toString());
    } catch (e) {
      print('user in not exception');
      yield LoginState.failure(e.toString());
    }
  }
}
