import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:our_apps_template/data/model/user.dart';
import 'package:our_apps_template/data/repository/user_repository.dart';
import 'package:our_apps_template/utils/exceptions.dart';
import 'package:our_apps_template/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({@required this.userRepository}) : assert(userRepository != null);

  final UserRepository userRepository;

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> transformEvents(
    Stream<LoginEvent> events,
    Stream<LoginState> Function(LoginEvent event) next,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! IdChanged);
    });

    final debounceStream = events.where((event) {
      return (event is IdChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      next,
    );
  }

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
