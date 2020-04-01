import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:our_apps_template/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:meta/meta.dart';

part 'language_event.dart';

part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc({@required this.authenticationBloc}) {
    _authenticationBlocStreamSubscription =
        authenticationBloc.listen((authState) {
      if (authState is Uninitialized) {
        print('language bloc is good listener :)');
        add(AppStarted());
      }
    });
  }

  final AuthenticationBloc authenticationBloc;
  StreamSubscription _authenticationBlocStreamSubscription;

  @override
  LanguageState get initialState => DefaultLocale(Locale('en', 'US'));

  @override
  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
    if (event is AppStarted) {
      // TODO: load current locale
    } else if (event is LanguageSelected) {
      // TODO: Change language
    }
  }

  @override
  Future<void> close() {
    _authenticationBlocStreamSubscription.cancel();
    return super.close();
  }
}
