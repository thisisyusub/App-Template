import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:our_apps_template/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:our_apps_template/bloc/language_bloc/language_bloc.dart';
import 'package:our_apps_template/bloc/login_bloc/login_bloc.dart';
import 'package:our_apps_template/bloc/home_bloc//home_bloc.dart';
import 'package:our_apps_template/bloc/theme_bloc/theme_bloc.dart';
import 'package:our_apps_template/data/service/shared_preference_service.dart';
import 'package:our_apps_template/presentation/pages/home_page.dart';
import 'package:our_apps_template/presentation/pages/login_page.dart';
import 'package:our_apps_template/presentation/pages/splash_page.dart';
import 'package:our_apps_template/presentation/router.dart';
import 'package:our_apps_template/presentation/shared/app_colors.dart';
import 'package:our_apps_template/utils/constants/enums.dart';
import 'package:our_apps_template/utils/repository_factory.dart';
import 'package:our_apps_template/utils/localization/app_localizations.dart';
import 'package:our_apps_template/utils/simple_bloc_delegate.dart';

import 'bloc/language_bloc/language_bloc.dart';
import 'contractors/i_repository.dart';
import 'contractors/impl_post_repository.dart';
import 'contractors/impl_user_repository.dart';
import 'presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  // TODO: make good logic for language and theme config
  // shared pref service
  final sharedPrefService = await SharedPreferencesService.instance;

  // app default language
  String defaultLanguageCode = sharedPrefService.languageCode;
  Locale locale;
  if (defaultLanguageCode == null) {
    locale = new Locale('en', 'US');
    await sharedPrefService.setLanguage(locale.languageCode);
  } else {
    locale = new Locale(defaultLanguageCode);
  }

  // app default theme
  ThemeMode themeMode;
  final bool isDarkModeEnabled = sharedPrefService.isDarkModeEnabled;
  if (isDarkModeEnabled == null) {
    sharedPrefService.setDarkModeInfo(false);
    themeMode = ThemeMode.system;
  } else {
    themeMode = isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light;
  }

  final userRepository =
      await RepositoryFactory.createRepository(Repository.User);
  final postRepository =
      await RepositoryFactory.createRepository(Repository.Post);

  runApp(
    new MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IUserRepository>(
          create: (_) => userRepository,
        ),
        RepositoryProvider<IPostRepository>(
          create: (_) => postRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ThemeBloc(themeMode),
          ),
          BlocProvider(
            create: (_) => LanguageBloc(locale),
          ),
          BlocProvider(
            create: (_) => AuthenticationBloc(userRepository: userRepository)
              ..add(AppStarted()),
          ),
        ],
        child: DevicePreview(
          enabled: false,
          builder: (_) => MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, languageState) {
            return new MaterialApp(
              locale: languageState.locale,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                AppLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('en', 'US'),
                Locale('az', 'AZ'),
                Locale('ru', 'RU'),
              ],
              debugShowCheckedModeBanner: false,
              themeMode: themeState.themeMode,
              theme: new ThemeData(
                brightness: Brightness.light,
                primaryColor: AppColors.mainColor,
                primaryColorDark: AppColors.secondaryColor,
                accentColor: AppColors.accentColor,
                scaffoldBackgroundColor: AppColors.mainColor,
                buttonTheme: new ButtonThemeData(
                  buttonColor: Colors.white,
                  height: 50,
                  minWidth: double.infinity,
                ),
              ),
              darkTheme: new ThemeData(
                brightness: Brightness.dark,
                primaryColor: AppColors.mainColor,
                primaryColorDark: AppColors.secondaryColor,
                accentColor: AppColors.accentColor,
                primaryColorBrightness: Brightness.dark,
                accentColorBrightness: Brightness.dark,
                buttonTheme: new ButtonThemeData(
                  buttonColor: Colors.red,
                  height: 50,
                  minWidth: double.infinity,
                ),
              ),
              home: new BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, authState) {
                  if (authState is Uninitialized) {
                    return new SplashPage();
                  } else if (authState is Unauthenticated) {
                    return new BlocProvider(
                      create: (_) => new LoginBloc(
                        userRepository:
                            RepositoryProvider.of<IUserRepository>(context),
                      ),
                      child: new LoginPage(),
                    );
                  } else if (authState is Authenticated) {
                    return new BlocProvider<HomeBloc>(
                      create: (_) => HomeBloc(
                        postRepository:
                            RepositoryProvider.of<IPostRepository>(context),
                      )..add(FetchPostsRequested()),
                      child: HomePage(authState.user),
                    );
                  }

                  return new Container();
                },
              ),
              onGenerateRoute: Router.onGenerateRoute,
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
