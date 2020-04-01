import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:our_apps_template/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:our_apps_template/bloc/language_bloc/language_bloc.dart'
    show LanguageBloc;
import 'package:our_apps_template/bloc/login_bloc/login_bloc.dart';
import 'package:our_apps_template/data/data_provider/user_data_provider.dart';
import 'package:our_apps_template/data/repository/user_repository.dart';
import 'package:our_apps_template/presentation/pages/home_page.dart';
import 'package:our_apps_template/presentation/pages/login_page.dart';
import 'package:our_apps_template/presentation/pages/splash_page.dart';
import 'package:our_apps_template/presentation/router.dart';
import 'package:our_apps_template/presentation/shared/app_colors.dart';
import 'package:our_apps_template/utils/app_localizations.dart';
import 'package:our_apps_template/utils/simple_bloc_delegate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = new SimpleBlocDelegate();

  final userDataProvider = new UserDataProvider();
  final userRepository = new UserRepository(userDataProvider: userDataProvider);

  runApp(
    new RepositoryProvider(
      create: (_) => userRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(userRepository: userRepository),
        child: Builder(
          builder: (context)  {
          context.bloc<AuthenticationBloc>()
          .add(AppStarted());

           return MyApp();
          }
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
    return new MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('az', 'AZ'),
      ],
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: AppColors.mainColor,
        primaryColorDark: AppColors.secondDaryColor,
        accentColor: AppColors.accentColor,
        scaffoldBackgroundColor: AppColors.mainColor,
        cursorColor: Colors.white,
        buttonTheme: new ButtonThemeData(
          buttonColor: Colors.white,
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
                userRepository: RepositoryProvider.of<UserRepository>(context),
              ),
              child: new LoginPage(),
            );
          } else if (authState is Authenticated) {
            return new HomePage();
          }

          return new Container();
        },
      ),
      onGenerateRoute: Router.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
