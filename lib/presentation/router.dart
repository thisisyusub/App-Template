import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_apps_template/bloc/register_bloc/register_bloc.dart';
import 'package:our_apps_template/data/repository/user_repository.dart';
import 'package:our_apps_template/presentation/pages/register_page.dart';
import 'package:our_apps_template/utils/constants.dart';

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterBloc(
              userRepository: RepositoryProvider.of<UserRepository>(context),
            ),
            child: RegisterPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
