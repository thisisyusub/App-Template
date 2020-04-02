import 'package:flutter/material.dart';
import 'package:our_apps_template/data/model/user.dart';

class CustomDrawer extends StatelessWidget {
  final User userData;

  CustomDrawer(this.userData);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
                accountName: Text(userData.username),
                accountEmail: Text(userData.email),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(userData.id.toString()),
                ),
                arrowColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
