/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../contractors/impl_user_repository.dart';
import '../../data/model/user.dart';
import '../../utils/exceptions/exceptions.dart';
import '../../utils/validators/validators.dart';

part './register_event.dart';
part './register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({@required this.userRepository}) : super(RegisterState.empty());

  final IUserRepository userRepository;

  // @override
  // Stream<RegisterState> transformEvents(
  //   Stream<RegisterEvent> events,
  //   Stream<RegisterState> Function(RegisterEvent event) next,
  // ) {
  //   final nonDebounceStream = events.where((event) {
  //     return (event is! IdChanged);
  //   });
  //   final debounceStream = events.where((event) {
  //     return (event is IdChanged);
  //   }).debounceTime(Duration(milliseconds: 300));
  //   return super.transformEvents(
  //     nonDebounceStream.mergeWith([debounceStream]),
  //     next,
  //   );
  // }

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is IdChanged) {
      yield* _mapIdChangedToState(event.id);
    } else if (event is RegisterClicked) {
      yield* _mapRegisterClickedToState(event.id);
    }
  }

  /// method works when the id is changed
  Stream<RegisterState> _mapIdChangedToState(String id) async* {
    yield state.update(isIdValid: Validators.isValidId(id));
  }

  /// method works when the register button is clicked
  Stream<RegisterState> _mapRegisterClickedToState(String id) async* {
    yield RegisterState.loading();
    try {
      final user = await userRepository.register(id);
      yield RegisterState.success(user);
    } on RegistrationFaultException catch (e) {
      yield RegisterState.failure(e.toString());
    } on HttpException catch (e) {
      yield RegisterState.failure(e.toString());
    } catch (e) {
      yield RegisterState.failure(e.toString());
    }
  }
}
