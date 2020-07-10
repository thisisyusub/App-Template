/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/service/shared_preference_service.dart';
import '../../utils/constants/constants.dart';
import '../../utils/constants/enums.dart';

part './language_event.dart';
part './language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc(this.defaultLocale) : super(LanguageState(defaultLocale));

  final Locale defaultLocale;

  @override
  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
    if (event is LanguageSelected) {
      yield* _mapLanguageSelectedToState(event.languageCode);
    }
  }

  Stream<LanguageState> _mapLanguageSelectedToState(
      Language selectedLanguage) async* {
    final sharedPrefService = await SharedPreferencesService.instance;
    final defaultLanguageCode = sharedPrefService.languageCode;

    if (selectedLanguage == Language.AZ &&
        defaultLanguageCode != LanguageKeys.az) {
      yield* _loadLanguage(sharedPrefService, 'az', 'AZ');
    } else if (selectedLanguage == Language.EN &&
        defaultLanguageCode != LanguageKeys.en) {
      yield* _loadLanguage(sharedPrefService, 'en', 'US');
    } else if (selectedLanguage == Language.RU &&
        defaultLanguageCode != LanguageKeys.ru) {
      yield* _loadLanguage(sharedPrefService, 'ru', 'RU');
    }
  }

  Stream<LanguageState> _loadLanguage(
      SharedPreferencesService sharedPreferencesService,
      String languageCode,
      String countryCode) async* {
    final locale = Locale(languageCode, countryCode);
    await sharedPreferencesService.setLanguage(locale.languageCode);
    yield LanguageState(locale);
  }
}
