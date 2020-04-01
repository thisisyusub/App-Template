part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class DefaultLocale extends LanguageState {
  final Locale locale;

  DefaultLocale(this.locale) : assert(locale != null);

  @override
  List<Object> get props => [locale];
}

class CurrentLocale extends LanguageState {
  final Locale locale;

  CurrentLocale(this.locale) : assert(locale != null);

  @override
  List<Object> get props => [locale];
}

