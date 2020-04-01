import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:our_apps_template/data/repository/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:our_apps_template/data/service/shared_preference_service.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  final UserRepository userRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      await Future.delayed(Duration(seconds: 2));
      final userLogged = (await SharedPreferencesService.instance).isUserLogged;
      if (userLogged != null) {
        if (userLogged) {
          yield Authenticated('Test');
        } else {
          yield Unauthenticated();
        }
      } else {
        yield Unauthenticated();
      }
    } else if (event is LoggedIn) {
      yield Authenticated('Test');
    } else if (event is LoggedOut) {
      (await SharedPreferencesService.instance).setUserLogInfo(false);
      yield Unauthenticated();
    }
  }
}
