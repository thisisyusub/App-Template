part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeLoad extends ThemeState {
  final ThemeMode themeMode;

  ThemeLoad(this.themeMode) : assert(themeMode != null);

  @override
  // TODO: implement props
  List<Object> get props => [themeMode];
}
