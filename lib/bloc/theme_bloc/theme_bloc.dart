/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/service/shared_preference_service.dart';

part './theme_state.dart';
part './theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(this.defaultThemeMode) : super(ThemeState(defaultThemeMode));

  final ThemeMode defaultThemeMode;

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeChanged) {
      yield* _mapThemeChangedToState(event.value);
    }
  }

//  Stream<ThemeState> _mapThemeLoadStartedToState() async* {
//    final sharedPrefService = await SharedPreferencesService.instance;
//    final isDarkModeEnabled = sharedPrefService.isDarkModeEnabled;
//
//    if (isDarkModeEnabled == null) {
//      sharedPrefService.setDarkModeInfo(false);
//      yield ThemeState(ThemeMode.light);
//    } else {
//      ThemeMode themeMode =
//          isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light;
//      yield ThemeState(themeMode);
//    }
//  }

  Stream<ThemeState> _mapThemeChangedToState(bool value) async* {
    final sharedPrefService = await SharedPreferencesService.instance;
    final isDarkModeEnabled = sharedPrefService.isDarkModeEnabled;

    if (value && !isDarkModeEnabled) {
      await sharedPrefService.setDarkModeInfo(true);
      yield ThemeState(ThemeMode.dark);
    } else if (!value && isDarkModeEnabled) {
      await sharedPrefService.setDarkModeInfo(false);
      yield ThemeState(ThemeMode.light);
    }
  }
}
