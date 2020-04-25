import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:our_apps_template/contractors/impl_user_repository.dart';
import 'package:our_apps_template/data/model/user.dart';
import 'package:our_apps_template/utils/exceptions/exceptions.dart';
import 'package:our_apps_template/utils/validators/validators.dart';
import 'package:rxdart/rxdart.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({@required this.userRepository})
      : assert(userRepository != null);

  final IUserRepository userRepository;

  @override
  RegisterState get initialState => RegisterState.empty();

  @override
  Stream<RegisterState> transformEvents(
    Stream<RegisterEvent> events,
    Stream<RegisterState> Function(RegisterEvent event) next,
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
