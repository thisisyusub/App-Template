import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:our_apps_template/data/repository/user_repository.dart';
import 'package:our_apps_template/utils/exceptions.dart';
import 'package:our_apps_template/utils/validators.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({@required this.userRepository})
      : assert(userRepository != null);

  final UserRepository userRepository;

  @override
  RegisterState get initialState => RegisterState.empty();

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
      await userRepository.register(id);
      yield RegisterState.success();
    } on RegistrationFaultException catch (e) {
      yield RegisterState.failure(e.toString());
    } on HttpException catch (e) {
      yield RegisterState.failure(e.toString());
    } catch (e) {
      yield RegisterState.failure(e.toString());
    }
  }
}
