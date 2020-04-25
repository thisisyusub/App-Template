import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:our_apps_template/contractors/impl_user_repository.dart';
import 'package:our_apps_template/data/model/user.dart';
import 'package:meta/meta.dart';
import 'package:our_apps_template/data/service/shared_preference_service.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  final IUserRepository userRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final userLogged = (await SharedPreferencesService.instance).isUserLogged;
      if (userLogged != null) {
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
