/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/register_bloc/register_bloc.dart';
import '../contractors/impl_user_repository.dart';
import './pages/register_page.dart';
import '../utils/constants/constants.dart';
import './pages/favorite_page.dart';

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterBloc(
              userRepository: RepositoryProvider.of<IUserRepository>(context),
            ),
            child: RegisterPage(),
          ),
        );
      case Routes.favorites:
        return MaterialPageRoute(
          builder: (_) => FavoritePage(),
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
