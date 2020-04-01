import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_apps_template/bloc/authentication_bloc/authentication_bloc.dart';

class LogOutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: const Text('Log out'),
      actions: <Widget>[
        new FlatButton(
          child: const Text('OK'),
          onPressed: () {
            context.bloc<AuthenticationBloc>().add(new LoggedOut());
            Navigator.of(context).pop();
          },
        ),
        new FlatButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      content: const Text('Dou you want to log out?'),
    );
  }
}
