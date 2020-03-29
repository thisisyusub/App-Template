import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_apps_template/presentation/pages/home_page.dart';
import 'package:our_apps_template/presentation/pages/login_page.dart';
import 'package:our_apps_template/presentation/pages/sign_in_page.dart';
import 'package:our_apps_template/utils/constants/routes.dart';

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
        break;
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => SignInPage());
        break;
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
