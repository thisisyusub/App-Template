import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:our_apps_template/data/service/shared_preference_service.dart';

part 'theme_state.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => ThemeState(ThemeMode.light);

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeLoadStarted) {
      yield* _mapThemeLoadStartedToState();
    } else if (event is ThemeChanged) {
      yield* _mapThemeChangedToState(event.value);
    }
  }

  Stream<ThemeState> _mapThemeLoadStartedToState() async* {
    final sharedPrefService = await SharedPreferencesService.instance;
    final isDarkModeEnabled = sharedPrefService.isDarkModeEnabled;

    if (isDarkModeEnabled == null) {
      sharedPrefService.setDarkModeInfo(false);
      yield ThemeState(ThemeMode.light);
    } else {
      ThemeMode themeMode =
          isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light;
      yield ThemeState(themeMode);
    }
  }

  Stream<ThemeState> _mapThemeChangedToState(bool value) async* {
    final sharedPrefService = await SharedPreferencesService.instance;
    final isDarkModeEnabled = sharedPrefService.isDarkModeEnabled;

    if (!value) {
      await sharedPrefService.setDarkModeInfo(false);
      yield ThemeState(ThemeMode.light);
    } else if (value) {
      await sharedPrefService.setDarkModeInfo(true);
      yield ThemeState(ThemeMode.dark);
    }
  }
}
