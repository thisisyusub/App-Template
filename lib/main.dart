import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_apps_template/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:our_apps_template/bloc/login_bloc/login_bloc.dart';
import 'package:our_apps_template/data/data_provider/user_data_provider.dart';
import 'package:our_apps_template/data/repository/user_repository.dart';
import 'package:our_apps_template/presentation/pages/home_page.dart';
import 'package:our_apps_template/presentation/pages/login_page.dart';
import 'package:our_apps_template/presentation/pages/splash_page.dart';
import 'package:our_apps_template/presentation/router.dart';
import 'package:our_apps_template/presentation/shared/app_colors.dart';
import 'package:our_apps_template/utils/simple_bloc_delegate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final userDataProvider = UserDataProvider();

  runApp(
    RepositoryProvider(
      create: (_) => new UserRepository(userDataProvider: userDataProvider),
      child: BlocProvider(
        create: (_) => AuthenticationBloc()..add(AppStarted()),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.mainColor,
        primaryColorDark: AppColors.secondDaryColor,
        accentColor: AppColors.accentColor,
        scaffoldBackgroundColor: AppColors.mainColor,
        cursorColor: Colors.white,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white,
          height: 50,
          minWidth: double.infinity,
        ),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, authState) {
          if (authState is Uninitialized) {
            return SplashPage();
          } else if (authState is Unauthenticated) {
            return BlocProvider(
              create: (_) => LoginBloc(
                userRepository: RepositoryProvider.of<UserRepository>(context),
              ),
              child: LoginPage(),
            );
          } else if (authState is Authenticated) {
            return HomePage();
          }

          return Container();
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
